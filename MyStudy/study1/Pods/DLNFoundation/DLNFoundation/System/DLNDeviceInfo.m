//
//  DLNDeviceInfo.m
//  DLNFoundation
//
//  Created by Linzh on 14-7-25.
//  Copyright (c) 2014年 Linzh. All rights reserved.
//

#import "DLNDeviceInfo.h"
#import <DLNCore/DLNUUIDTool.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <AVFoundation/AVCaptureDevice.h>
#import <AVFoundation/AVMediaFormat.h>
#import <CoreLocation/CoreLocation.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <DLNCore/AESCrypt.h>
#import <UserNotifications/UserNotifications.h>

static NSString *const KeyDeviceToken = @"KeyDeviceToken";
static NSString *const SecretKey = @"device@iOS";

@implementation DLNDeviceInfo

+ (NSString *)UDID {
    return [DLNUUIDTool getUDID];
}

+ (BOOL)isUserNotificationEnabled {
    if (@available(iOS 10, *)) {
        __block BOOL result;
        NSLock *lock = [[NSLock alloc] init];
        [lock lock];
        [[UNUserNotificationCenter currentNotificationCenter] getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
            result = settings.authorizationStatus == UNAuthorizationStatusAuthorized;
            [lock unlock];
        }];
        [lock lock];
        [lock unlock];
        return result;
    }
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_10_0
    else if (@available(iOS 8, *)) {
        return [[UIApplication sharedApplication] currentUserNotificationSettings].types != UIUserNotificationTypeNone;
    }
#endif
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_8_0
    else {
        return [[UIApplication sharedApplication] enabledRemoteNotificationTypes] != UIRemoteNotificationTypeNone;
    }
#endif
    
    return NO;
}

+ (BOOL)isPhotoDataAccessed {
    ALAuthorizationStatus status = [ALAssetsLibrary authorizationStatus];
    return status != ALAuthorizationStatusRestricted && status != ALAuthorizationStatusDenied;
}

+ (BOOL)isMediaCaptureAccessed {
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    return status != AVAuthorizationStatusRestricted && status != AVAuthorizationStatusDenied;
}

+ (BOOL)isLocationServicesEnabled {
    return [CLLocationManager locationServicesEnabled];
}

+ (BOOL)setDeviceToken:(NSData *)deviceToken {
    if (!deviceToken) {
        return NO;
    }
    NSString *token = [[[[deviceToken description] stringByReplacingOccurrencesOfString: @"<" withString: @""]
                        stringByReplacingOccurrencesOfString: @">" withString: @""]
                       stringByReplacingOccurrencesOfString: @" " withString: @""];

    NSLog(@"deviceToken: %@", token);
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[AESCrypt encrypt:token password:SecretKey] forKey:KeyDeviceToken];
    [defaults synchronize];
    return YES;
}

+ (NSString *)deviceToken {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [AESCrypt decrypt:[defaults objectForKey:KeyDeviceToken] password:SecretKey];
}

#pragma mark - Camera Utility
+ (BOOL)isCameraAvailable {
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

+ (BOOL)isRearCameraAvailable {
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
}

+ (BOOL)isFrontCameraAvailable {
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
}

+ (BOOL)doesCameraSupportTakingPhotos {
    return [self cameraSupportsMedia:(__bridge NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypeCamera];
}

+ (BOOL)isPhotoLibraryAvailable {
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary];
}

+ (BOOL)canUserPickVideosFromPhotoLibrary {
    return [self cameraSupportsMedia:(__bridge NSString *)kUTTypeMovie sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}

+ (BOOL)canUserPickPhotosFromPhotoLibrary {
    return [self cameraSupportsMedia:(__bridge NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}

+ (BOOL)cameraSupportsMedia:(NSString *)paramMediaType sourceType:(UIImagePickerControllerSourceType)paramSourceType {
    __block BOOL result = NO;
    if ([paramMediaType length] == 0) {
        return NO;
    }
    NSArray *availableMediaTypes = [UIImagePickerController availableMediaTypesForSourceType:paramSourceType];
    [availableMediaTypes enumerateObjectsUsingBlock: ^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *mediaType = (NSString *)obj;
        if ([mediaType isEqualToString:paramMediaType]){
            result = YES;
            *stop= YES;
        }
    }];
    return result;
}
@end
