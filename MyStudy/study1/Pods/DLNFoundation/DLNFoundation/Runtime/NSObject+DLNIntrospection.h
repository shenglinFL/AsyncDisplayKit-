//
//  NSObject+DLNIntrospection.h
//  DLNFoundation
//
//  Created by Linzh on 1/13/16.
//  Copyright © 2016 Daniel Lin. All rights reserved.
//
#ifdef DEBUG
#import <Foundation/Foundation.h>

@interface NSObject (DLNIntrospection)
+ (NSArray *)dln_classes;
+ (NSArray *)dln_properties;

+ (NSArray *)dln_instanceVariables;
+ (NSArray *)dln_instanceMethods;
+ (NSArray *)dln_classMethods;

+ (NSArray *)dln_protocols;
+ (NSDictionary *)dln_descriptionForProtocol:(Protocol *)proto;

+ (NSString *)dln_parentClassHierarchy;
@end
#endif