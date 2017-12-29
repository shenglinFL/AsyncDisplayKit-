//
//  DLNBundle.m
//  DLNFoundation
//
//  Created by Linzh on 7/21/16.
//  Copyright © 2016 Daniel. All rights reserved.
//

#import "DLNBundle.h"

@implementation DLNBundle

+ (NSBundle *)bundleForClass:(Class)class withName:(NSString *)name {
    NSBundle *bundle = [NSBundle bundleForClass:class];
    if (!name) {
        return bundle;
    }
    NSURL *url = [bundle URLForResource:name withExtension:@"bundle"];
    return url ? [NSBundle bundleWithURL:url] : bundle;
}
@end
