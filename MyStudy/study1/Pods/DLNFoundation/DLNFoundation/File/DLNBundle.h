//
//  DLNBundle.h
//  DLNFoundation
//
//  Created by Linzh on 7/21/16.
//  Copyright © 2016 Daniel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DLNBundle : NSBundle
/**
 *  Return a bundle with the specified name.
 *
 *  @param name the name of bundle or nil
 *
 *  @return If the bundle with specified name can not be found, it will return the bundle with self class is associated.
 */
+ (NSBundle *)bundleForClass:(Class)class withName:(NSString *)name;
@end
