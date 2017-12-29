//
//  NSString+DLNShort.m
//  DLNFoundation
//
//  Created by Linzh on 12/22/15.
//  Copyright © 2015 Daniel Lin. All rights reserved.
//

#import "NSString+DLNShort.h"
#import "NSString+DLNReverse.h"

static NSString *const ALPHABET = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
static const int BASE_COUNT = 62;

@implementation NSString (DLNShort)

- (NSString *)dln_short {
    return [self encode:[self decode:self]];
}

- (int)decode:(NSString *)string {
    int num = 0;
    if (string) {
        int len = (int)[string length];
        for (int i=0; i<len; i++) {
            NSRange range = [ALPHABET rangeOfString:[string substringWithRange:NSMakeRange(i, 1)]];
            if (range.location != NSNotFound) {
                int index = (int)range.location;
                num = num * BASE_COUNT + index;
            }
        }
    }
    
    return num;
}

- (NSString *)encode:(int)num {
    NSMutableString *string = [[NSMutableString alloc] init];
    while ((num & 0x0FFFF) > 0) {
        [string appendString:[ALPHABET substringWithRange:NSMakeRange((num & 0x0FFFF) % BASE_COUNT, 1)]];
        num /= BASE_COUNT;
    }
    
    return [string dln_reverse];
}
@end
