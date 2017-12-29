//
//  DLNApplicationContext.m
//  DLNFoundation
//
//  Created by Linzh on 12/17/15.
//  Copyright © 2015 Horizon. All rights reserved.
//

#import "DLNApplicationContext.h"

@interface DLNApplicationContext ()
@property (strong, nonatomic) NSHashTable *alertViewHashTable;
@end

@implementation DLNApplicationContext

static DLNApplicationContext *sharedInstance = nil;
#pragma mark - Override
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        sharedInstance = [super allocWithZone:zone];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _alertViewHashTable = [NSHashTable weakObjectsHashTable];
    }
    return self;
}

#pragma mark - Public
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!sharedInstance) {
            sharedInstance = [[self alloc] init];
        }
    });
    return sharedInstance;
}

- (void)dismissAllAlertViews {
    if (self.alertViewHashTable.allObjects.count > 0) {
        [self.alertViewHashTable.allObjects enumerateObjectsUsingBlock:^(UIAlertView *obj, NSUInteger idx, BOOL *stop) {
            [obj dismissWithClickedButtonIndex:obj.cancelButtonIndex animated:NO];
        }];
    }
    [self.alertViewHashTable removeAllObjects];
}

- (void)addAlertViewObject:(UIAlertView *)alertView {
    [self.alertViewHashTable addObject:alertView];
}
#pragma mark - Private

#pragma mark - G/S
- (NSArray *)availableAlertViews {
    return [[self.alertViewHashTable allObjects] copy];
}
@end
