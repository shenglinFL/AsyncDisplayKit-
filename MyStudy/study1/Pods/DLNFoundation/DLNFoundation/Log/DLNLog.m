//
//  DLNLog.m
//  DLNFoundation
//
//  Created by Linzh on 12/28/15.
//  Copyright © 2015 Daniel Lin. All rights reserved.
//

//#import "DLNLog.h"
//
//@implementation DLNLog
//+ (void)initLogSettings {
//    //    [DDLog addLogger:[DDASLLogger sharedInstance]]; // Apple System Logs
//    //    [DDLog addLogger:[DDTTYLogger sharedInstance]]; // Xcode console
//    [DDLog addLogger:[DDASLLogger sharedInstance] withLevel:ddLogLevel];
//    [DDLog addLogger:[DDTTYLogger sharedInstance] withLevel:ddLogLevel];
//    
//    [self setLogColorsForLevelDebug:RGB(58, 153, 216) info:RGB(166, 196, 70) warning:RGB(228, 126, 48) error:RGB(229, 77, 66)];
//    
//    DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
//    fileLogger.maximumFileSize = 0;
//    fileLogger.rollingFrequency = 24 * 60 * 60;
//    fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
//    fileLogger.logFileManager.logFilesDiskQuota = 0;
//    [DDLog addLogger:fileLogger];
//}
//
//+ (void)setLogColorsForLevelDebug:(DDColor *)debugColor info:(DDColor *)infoColor warning:(DDColor *)warningColor error:(DDColor *)errorColor {
//    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
//    [[DDTTYLogger sharedInstance] setForegroundColor:infoColor backgroundColor:nil forFlag:DDLogFlagInfo];
//    [[DDTTYLogger sharedInstance] setForegroundColor:debugColor backgroundColor:nil forFlag:DDLogFlagDebug];
//    [[DDTTYLogger sharedInstance] setForegroundColor:warningColor backgroundColor:nil forFlag:DDLogFlagWarning];
//    [[DDTTYLogger sharedInstance] setForegroundColor:errorColor backgroundColor:nil forFlag:DDLogFlagError];
//}
//@end
