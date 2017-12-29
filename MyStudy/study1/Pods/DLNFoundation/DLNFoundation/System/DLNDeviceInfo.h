//
//  DLNDeviceInfo.h
//  DLNFoundation
//
//  Created by Linzh on 14-7-25.
//  Copyright (c) 2014年 Linzh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DLNDeviceInfo : NSObject
/**
 *  设备唯一标识
 *
 *  @return <#return value description#>
 */
+ (NSString *)UDID;

/**
 *  判断消息推送是否可用
 *
 *  @return <#return value description#>
 */
+ (BOOL)isUserNotificationEnabled;

/**
 *  判断是否有权限访问相册
 *
 *  @return <#return value description#>
 */
+ (BOOL)isPhotoDataAccessed;

/**
 *  判断是否有权限访问摄像头
 *
 *  @return <#return value description#>
 */
+ (BOOL)isMediaCaptureAccessed;

/**
 *  判断系统定位服务是否可用
 *
 *  @return <#return value description#>
 */
+ (BOOL)isLocationServicesEnabled;

/**
 *  保存deviceToken
 *
 *  @param deviceToken <#deviceToken description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)setDeviceToken:(NSData *)deviceToken;

/**
 *  获取deviceToken
 *
 *  @return <#return value description#>
 */
+ (NSString *)deviceToken;

#pragma mark - Camera Utility
+ (BOOL)isCameraAvailable;
+ (BOOL)isRearCameraAvailable;
+ (BOOL)isFrontCameraAvailable;
+ (BOOL)doesCameraSupportTakingPhotos;
+ (BOOL)isPhotoLibraryAvailable;
+ (BOOL)canUserPickVideosFromPhotoLibrary;
+ (BOOL)canUserPickPhotosFromPhotoLibrary;

@end
