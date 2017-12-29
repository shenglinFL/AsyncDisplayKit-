//
//  DLNMacro.h
//  DLNFoundation
//
//  Created by Linzh on 12/22/15.
//  Copyright © 2015 Daniel Lin. All rights reserved.
//

#ifndef DLNMacro_h
#define DLNMacro_h

//  字符串：
#ifndef nilToEmpty
#define nilToEmpty(object) (object!=nil)?object:@""
#endif

#ifndef formatStringOfObject
#define formatStringOfObject(object) [NSString stringWithFormat:@"%@", object]
#endif

#ifndef nilToEmptyFormatStringOfObject
#define nilToEmptyFormatStringOfObject(object) formatStringOfObject(nilToEmpty(object))
#endif

#ifndef trimString
#define trimString(string) string?[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]:@""
#endif

#ifndef stringNotEmpty
#define stringNotEmpty(string) string&&![string isEqualToString:@""]
#endif

#ifndef stringEmpty
#define stringEmpty(string) !string||[string isEqualToString:@""]
#endif

#pragma mark - 数据安全
#define NotNull(obj) ([(obj) isEqual:[NSNull null]] ? nil : (obj))
#define NotNullSrt(str) NotNull(str)?str:(@"")
#define toString(obj) [NSString stringWithFormat:@"%@",NotNull(obj)]
#define toNullStr(obj) ([toString(obj) isEqualToString:@"(null)"] ? @"" : toString(obj))

//  图片：
#ifndef imagePath
#define imagePath(imageName) [[NSBundle mainBundle] pathForResource:imageName ofType:@"png"]
#endif


//  颜色
#define RGBA(r, g, b, a)    [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b)        RGBA(r, g, b, 1.0f)
#define HEXACOLOR(hex, a)   [UIColor colorWithRed:((hex>>16)&0xFF)/255.0f green:((hex>>8)&0xFF)/255.0f blue:(hex&0xFF)/255.0f alpha:a]
#define HEXCOLOR(hex)       HEXACOLOR(hex, 1.0f)
#define HSBA(h,s,b,a)       [UIColor colorWithHue:h/360.0f saturation:s/100.0f brightness:b/100.0f alpha:a]
#define HSB(h,s,b)          HSBA(h,s,b,1.0)


//  debug
#define debug(...) NSLog(@"%s %@", __PRETTY_FUNCTION__, [NSString stringWithFormat:__VA_ARGS__])


//  iOS 支持
#define SUPPORT_IPHONE_OS_VERSION(version) ( __IPHONE_OS_VERSION_MIN_REQUIRED <= version && __IPHONE_OS_VERSION_MAX_ALLOWED >= version)

// iOS 版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

//  Application delegate
#define ApplicationDelegate                 ((AppDelegate *)[[UIApplication sharedApplication] delegate])


//  主要单例
#define UserDefaults                        [NSUserDefaults standardUserDefaults]
#define NotificationCenter                  [NSNotificationCenter defaultCenter]
#define SharedApplication                   [UIApplication sharedApplication]


#define Bundle                              [NSBundle mainBundle]

#define MainScreen                          [UIScreen mainScreen]


//  网络指示
#define ShowNetworkActivityIndicator()      [UIApplication sharedApplication].networkActivityIndicatorVisible = YES
#define HideNetworkActivityIndicator()      [UIApplication sharedApplication].networkActivityIndicatorVisible = NO
#define NetworkActivityIndicatorVisible(x)  [UIApplication sharedApplication].networkActivityIndicatorVisible = x


//  主要控件
#define NavBar                              self.navigationController.navigationBar
#define TabBar                              self.tabBarController.tabBar


//  大小尺寸
#define ScreenWidth                         [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight                        [[UIScreen mainScreen] bounds].size.height

#define NavBarHeight                        self.navigationController.navigationBar.bounds.size.height
#define TabBarHeight                        self.tabBarController.tabBar.bounds.size.height
#define StatusBarHeight                     [UIApplication sharedApplication].statusBarFrame.size.height

#define TouchHeightDefault                  44.0f
#define TouchHeightSmall                    32.0f


#define ViewWidth(v)                        v.frame.size.width
#define ViewHeight(v)                       v.frame.size.height
#define ViewX(v)                            v.frame.origin.x
#define ViewY(v)                            v.frame.origin.y


#define SelfViewWidth                       self.view.bounds.size.width
#define SelfViewHeight                      self.view.bounds.size.height


#define RectX(rect)                            rect.origin.x
#define RectY(rect)                            rect.origin.y
#define RectWidth(rect)                        rect.size.width
#define RectHeight(rect)                       rect.size.height


#define RectSetWidth(rect, w)                  CGRectMake(RectX(rect), RectY(rect), w, RectHeight(rect))
#define RectSetHeight(rect, h)                 CGRectMake(RectX(rect), RectY(rect), RectWidth(rect), h)
#define RectSetX(rect, x)                      CGRectMake(x, RectY(rect), RectWidth(rect), RectHeight(rect))
#define RectSetY(rect, y)                      CGRectMake(RectX(rect), y, RectWidth(rect), RectHeight(rect))


#define RectSetSize(rect, w, h)                CGRectMake(RectX(rect), RectY(rect), w, h)
#define RectSetOrigin(rect, x, y)              CGRectMake(x, y, RectWidth(rect), RectHeight(rect))


//  内存管理
#if ! __has_feature(objc_arc)
#define SBAutorelease(__v) ([__v autorelease])
#define SBReturnAutoreleased SBAutorelease

#define SBRetain(__v) ([__v retain])
#define SBReturnRetained SBRetain

#define SBRelease(__v) ([__v release])

#define SBDispatchQueueRelease(__v) (dispatch_release(__v))
#else
// -fobjc-arc
#define SBAutorelease(__v)
#define SBReturnAutoreleased(__v) (__v)

#define SBRetain(__v)
#define SBReturnRetained(__v) (__v)

#define SBRelease(__v)

#if TARGET_OS_IPHONE
// Compiling for iOS
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 60000
// iOS 6.0 or later
#define SBDispatchQueueRelease(__v)
#else
// iOS 5.X or earlier
#define SBDispatchQueueRelease(__v) (dispatch_release(__v))
#endif
#else
// Compiling for Mac OS X
#if MAC_OS_X_VERSION_MIN_REQUIRED >= 1080
// Mac OS X 10.8 or later
#define SBDispatchQueueRelease(__v)
#else
// Mac OS X 10.7 or earlier
#define SBDispatchQueueRelease(__v) (dispatch_release(__v))
#endif
#endif
#endif

#pragma mark - Math
// 取随机数
#define RANDOM(from, to)    (from + (arc4random() % (to - from + 1)))

#endif /* DLNMacro_h */
