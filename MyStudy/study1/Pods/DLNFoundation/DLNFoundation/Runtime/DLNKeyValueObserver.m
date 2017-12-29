//
//  DLNKeyValueObserver.m
//  DLNFoundation
//
//  Created by Linzh on 12/4/15.
//  Copyright © 2015 Daniel Lin. All rights reserved.
//

#import "DLNKeyValueObserver.h"

@interface DLNKeyValueObserver ()
@property (weak, nonatomic) id observedObject;
@property (copy, nonatomic) NSString *keyPath;
@end

@implementation DLNKeyValueObserver
#pragma mark - Overide
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (context == (__bridge void *)(self)) {
        [self didChange:change];
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)dealloc {
    [self.observedObject removeObserver:self forKeyPath:self.keyPath context:(__bridge void *)(self)];
}

#pragma mark - Private
- (instancetype)initWithObject:(id)object keyPath:(NSString*)keyPath target:(id)target selector:(SEL)selector options:(NSKeyValueObservingOptions)options {
    if (object == nil) {
        return nil;
    }
    NSParameterAssert(target != nil);
    NSParameterAssert([target respondsToSelector:selector]);
    self = [super init];
    if (self) {
        self.target = target;
        self.selector = selector;
        self.observedObject = object;
        self.keyPath = keyPath;
        [object addObserver:self forKeyPath:keyPath options:options context:(__bridge void *)(self)];
    }
    return self;
}

- (void)didChange:(NSDictionary *)change {
    id strongTarget = self.target;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [strongTarget performSelector:self.selector withObject:change];
#pragma clang diagnostic pop
}

#pragma mark - Public
+ (instancetype)observeObject:(id)object keyPath:(NSString*)keyPath target:(id)target selector:(SEL)selector __attribute__((warn_unused_result)) {
    return [self observeObject:object keyPath:keyPath target:target selector:selector options:0];
}

+ (instancetype)observeObject:(id)object keyPath:(NSString*)keyPath target:(id)target selector:(SEL)selector options:(NSKeyValueObservingOptions)options __attribute__((warn_unused_result)) {
    return [[self alloc] initWithObject:object keyPath:keyPath target:target selector:selector options:options];
}
@end
