//
//  NSDictionary+DLNJson.m
//  DLNFoundation
//
//  Created by Linzh on 12/22/15.
//  Copyright © 2015 Daniel Lin. All rights reserved.
//

//#import "NSDictionary+DLNJson.h"
//#import <JSONModel/JSONModel.h>
//
//@implementation NSDictionary (DLNJson)
//- (id)dln_JsonModelOfClass:(Class)cls {
//    if (![cls isSubclassOfClass:[JSONModel class]]) {
//        return nil;
//    }
//    SEL selector = NSSelectorFromString(@"initWithDictionary:error:");
//    id obj = [cls alloc];
//    if ([obj respondsToSelector:selector]) {
//        NSError *err = nil;
//        //        SuppressPerformSelectorLeakWarning(
//        //                                           return [obj performSelector:selector withObject:dictionary withObject:err]
//        //                                           );
//        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[obj methodSignatureForSelector:selector]];
//        [invocation setTarget:obj];
//        [invocation setSelector:selector];
//        __unsafe_unretained NSDictionary *unsafeSelf = self;
//        [invocation setArgument:&unsafeSelf atIndex:2];
//        [invocation setArgument:&err atIndex:3];
//        [invocation invoke];
//        [invocation getReturnValue:&obj];
//        
//        return err ? nil : obj;
//    } else {
//        return nil;
//    }
//}
//@end
