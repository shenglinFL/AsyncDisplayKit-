//
//  DLNKeyValueObserver.h
//  DLNFoundation
//
//  Created by Linzh on 12/4/15.
//  Copyright © 2015 Daniel Lin. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  A ObjC Key-Value observer helper class.
 */
@interface DLNKeyValueObserver : NSObject
@property (weak, nonatomic) id target;
@property (assign, nonatomic) SEL selector;

/**
 *  Registers anObserver to receive KVO notifications for the specified key-path relative to the receiver.
 *
 *  Example: self.nameObserveToken = [DLNKeyValueObserver observeObject:self.person
 *                                                              keyPath:@"name"
 *                                                               target:self
 *                                                             selector:@selector(nameDidChange:)];
 *
 *  @param object   The object to register for KVO notifications. The observer must implement the key-value observing method observeValueForKeyPath:ofObject:change:context:.
 *  @param keyPath  The key path, relative to the receiver, of the property to observe. This value must not be nil.
 *  @param target   The receiver of the selector below.
 *  @param selector A selector will be performed after the key-value did change.
 *
 *  @return This return value should be used to retain as a property. It makes the KVO can be unregistered when object of this return value dealloc.
 */
+ (instancetype)observeObject:(id)object keyPath:(NSString*)keyPath target:(id)target selector:(SEL)selector __attribute__((warn_unused_result));

/**
 *  Registers anObserver to receive KVO notifications for the specified key-path relative to the receiver.
 *
 *  @param object   The object to register for KVO notifications. The observer must implement the key-value observing method observeValueForKeyPath:ofObject:change:context:.
 *  @param keyPath  The key path, relative to the receiver, of the property to observe. This value must not be nil.
 *  @param target   The receiver of the selector below.
 *  @param selector A selector will be performed after the key-value did change.
 *  @param options  A combination of the NSKeyValueObservingOptions values that specifies what is included in observation notifications. For possible values, see NSKeyValueObservingOptions.
 *
 *  @return This return value should be used to retain as a property. It makes the KVO can be unregistered when object of this return value dealloc.
 */
+ (instancetype)observeObject:(id)object keyPath:(NSString*)keyPath target:(id)target selector:(SEL)selector options:(NSKeyValueObservingOptions)options __attribute__((warn_unused_result));
@end
