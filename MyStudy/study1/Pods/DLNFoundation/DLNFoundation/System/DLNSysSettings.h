//
//  DLNSettings.h
//  DLNFoundation
//
//  Created by Linzh on 12/23/15.
//  Copyright © 2015 Daniel Lin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_CLASS_AVAILABLE_IOS(8_0) @interface DLNSysSettings : NSObject
+ (void)openAppSelfSettings NS_AVAILABLE_IOS(8_0);
+ (void)phoneCall:(NSString *)phoneNumber NS_AVAILABLE_IOS(8_0);
+ (void)openAbout NS_DEPRECATED_IOS(8_0, 10_0);
+ (void)openWiFi NS_DEPRECATED_IOS(8_0, 10_0);
+ (void)openNotification NS_DEPRECATED_IOS(8_0, 10_0);
@end
