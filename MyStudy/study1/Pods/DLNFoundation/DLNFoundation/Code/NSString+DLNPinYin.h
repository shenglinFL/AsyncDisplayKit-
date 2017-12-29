//
//  NSString+DLNPinYin.h
//  DLNFoundation
//
//  Created by Linzh on 4/12/16.
//  Copyright © 2016 Daniel Lin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DLNPinYin)
- (NSString *)hzToPinYin;
- (NSString *)pinyinString;
- (NSString *)pinyinFullString;
- (NSString *)pinyinStringWithOtherCharacters;
- (NSString *)sortedCharacter;
- (BOOL)isMatchPinYinString:(NSString*)matchString MatchRange:(NSRange*)matchRange;
@end
