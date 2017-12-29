//
//  DLNTimeTool.m
//  DLNFoundation
//
//  Created by Linzh on 12/22/15.
//  Copyright © 2015 Daniel Lin. All rights reserved.
//

#import "DLNTimeTool.h"

@implementation DLNTimeTool
+ (NSDate *)getLocalDate:(NSDate *)date {
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:date];
    return [date dateByAddingTimeInterval:interval];
}

+ (long long)getCurrentTimeSp {
    return [self nsdateToTimeSp:[NSDate date]];
}

+ (NSDate *)timeSpToNSDate:(long long)timeSp {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeSp/1000];
    return date;
}

+ (long long)nsdateToTimeSp:(NSDate *)date {
//    NSDate *localDate = [self getLocalDate:date];
    NSTimeInterval interval = [date timeIntervalSince1970] * 1000;
    return (long long)interval;
}

+ (long)timeDifference:(NSDate *)date {
//    NSDate *localDate = [self getLocalDate:[NSDate date]];
    long difference = fabs([[NSDate date] timeIntervalSinceDate:date]);
    return difference;
}

+ (NSString*)nsdateToString:(NSDate *)date withDateFormat:(NSString *)format {
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
    [dateFormat setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"en_US_POSIX"]];
    [dateFormat setDateFormat:format];
    NSString *string=[dateFormat stringFromDate:date];
    return string;
}

+ (long long)stringToTimeSp:(NSString *)timeStr fromDateFormat:(NSString *)format {
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc] init];
    [dateFormat setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"en_US_POSIX"]];
    [dateFormat setDateFormat:format];
    NSDate *fromdate=[dateFormat dateFromString:timeStr];
    NSTimeInterval interval = [fromdate timeIntervalSince1970]*1000;
    return (long long)interval;
}

+ (NSString *)timeSpToString:(long long)timeSp withDateFormat:(NSString *)format {
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
    [dateFormat setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"en_US_POSIX"]];
    [dateFormat setDateFormat:format];
    NSDate *date = [self timeSpToNSDate:timeSp];
    NSString *string = [dateFormat stringFromDate:date];
    return string;
}

+ (NSString *)getCurrentTimewithFormat:(NSString *)format {
    //    NSDate *localDate=[self getLocalDate:[NSDate date]];
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
    [dateFormat setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"en_US_POSIX"]];
    [dateFormat setDateFormat:format];
    NSString *string=[dateFormat stringFromDate:[NSDate date]];
    return string;
}
@end
