//
//  NSString+DLNReverse.m
//  DLNFoundation
//
//  Created by Linzh on 12/22/15.
//  Copyright © 2015 Daniel Lin. All rights reserved.
//

#import "NSString+DLNReverse.h"

@implementation NSString (DLNReverse)

- (NSString *)dln_reverse {
    NSInteger  i = 0;
    NSInteger j = self.length - 1;
    
    unichar *characters = malloc(sizeof([self characterAtIndex:0]) * self.length);
    while (i < j) {
        characters[j] = [self characterAtIndex:i];
        characters[i] = [self characterAtIndex:j];
        i ++;
        j --;
    }
    if (i == j) {
        characters[i] = [self characterAtIndex:i];
    }
    NSString *string = [NSString stringWithCharacters:characters length:self.length];
    free(characters);
    return string;
}
@end
