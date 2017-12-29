//
//  DLNFoundation.h
//  DLNFoundation
//
//  Created by Linzh on 12/4/15.
//  Copyright © 2015 Daniel Lin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//! Project version number for DLNFoundation.
FOUNDATION_EXPORT double DLNFoundationVersionNumber;

//! Project version string for DLNFoundation.
FOUNDATION_EXPORT const unsigned char DLNFoundationVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <DLNFoundation/PublicHeader.h>
#import "DLNMacro.h"
//#import <CocoaLumberjack/CocoaLumberjack.h>

#ifndef DLNTargetSelfLogLevel
// FIXME:
//#ifdef DEBUG
//static const DDLogLevel ddLogLevel = DDLogLevelAll;
//#else
//static const DDLogLevel ddLogLevel = DDLogLevelOff;
//#endif
#endif

#ifdef DEBUG
#define NSLog(...)  NSLog(__VA_ARGS__)
#else
#define NSLog(...)
#endif
