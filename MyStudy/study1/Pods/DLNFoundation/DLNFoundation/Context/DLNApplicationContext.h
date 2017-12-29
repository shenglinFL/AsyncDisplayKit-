//
//  DLNApplicationContext.h
//  DLNFoundation
//
//  Created by Linzh on 12/17/15.
//  Copyright © 2015 Horizon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DLNApplicationContext : NSObject
@property(nonatomic, copy, readonly) NSArray *availableAlertViews;

+ (instancetype)sharedInstance;

- (void)addAlertViewObject:(UIAlertView *)alertView;
- (void)dismissAllAlertViews;
@end
