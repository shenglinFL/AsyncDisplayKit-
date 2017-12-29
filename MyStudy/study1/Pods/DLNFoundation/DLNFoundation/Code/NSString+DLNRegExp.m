//
//  NSString+DLNRegExp.m
//  DLNFoundation
//
//  Created by Linzh on 12/22/15.
//  Copyright © 2015 Daniel Lin. All rights reserved.
//

#import "NSString+DLNRegExp.h"

@implementation NSString (DLNRegExp)

- (BOOL)dln_isMobileNumber {
// Expired!
//    /**
//     * 手机号码
//     */
//    //    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
//    /**
//     * 中国移动：China Mobile
//     * 134[0-8],135,136,137,138,139,150,151,152,157,158,159,147,182,183,184,187,188,178
//     */
//    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[0-27-9]|8[2-478]|47|78)\\d)\\d{7}$";
//    /**
//     * 中国联通：China Unicom
//     * 130,131,132,155,156,185,186,176
//     */
//    NSString * CU = @"^1(3[0-2]|5[56]|8[56]|76)\\d{8}$";
//    /**
//     * 中国电信：China Telecom
//     * 133,1349,153,180,181,189,177
//     */
//    NSString * CT = @"^1((33|53|8[019]|77)[0-9]|349)\\d{7}$";
//    /**
//     * 大陆地区固话及小灵通
//     * 区号：010,020,021,022,023,024,025,027,028,029
//     * 号码：七位或八位
//     */
//    // NSString * PHS = @"^0(10|2[0-5789]|\\\\d{3})\\\\d{7,8}$";
//    
//    //    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
//    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
//    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
//    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
//    
//    if (/*[regextestmobile evaluateWithObject:self]
//         ||*/[regextestcm evaluateWithObject:self]
//        || [regextestct evaluateWithObject:self]
//        || [regextestcu evaluateWithObject:self])
//    {
//        return YES;
//    }
//    else
//    {
//        return NO;
//    }
//
    /* https://github.com/VincentSit/ChinaMobilePhoneNumberRegex
     电信
     2G/3G号段（CDMA2000网络）133、153、180、181、189
     4G号段 177、173
     联通
     2G号段（GSM网络）130、131、132、155、156
     3G上网卡145
     3G号段（WCDMA网络）185、186
     4G号段 176、185
     移动
     2G号段（GSM网络）有134x（0-8）、135、136、137、138、139、150、151、152、158、159、182、183、184。
     3G号段（TD-SCDMA网络）有157、187、188
     3G上网卡 147
     4G号段 178、184
     卫星通信 1349
     虚拟运营商号码段：
     电信 1700、1701、1702
     联通 1707、1708、1709、171
     移动 1705
     整理如下：
     ```
     130、131、132、133、134、135、136、137、138、139
     150、151、152、153、155、156、157、158、159
     173、176、177、178
     180、181、182、183、184、185、186、187、188、189
     171、1700、1701、1702、1705、1707、1708、1709
     ```
     */
//    NSString *regex = @"(^(13\\d|15[^4,\\D]|17[13678]|18\\d)\\d{8}|170[^346,\\D]\\d{7})$";
    NSString *regex = @"(^(13\\d|14[579]|15[^4,\\D]|17[13678]|18\\d)\\d{8}|170[^346,\\D]\\d{7})$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [predicate evaluateWithObject:self];
}

- (BOOL)dln_isPhoneNumber {
    NSString *regexp = @"^\\d{3,4}\\d{7,8}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexp];
    return [predicate evaluateWithObject:self];
}

- (BOOL)dln_isEmail {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

- (BOOL)dln_isCarNumber {
    NSString *carRegex = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    return [carTest evaluateWithObject:self];
}

- (BOOL)dln_isCarType {
    NSString *CarTypeRegex = @"^[\u4E00-\u9FFF]+$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CarTypeRegex];
    return [carTest evaluateWithObject:self];
}

- (BOOL)dln_isUserName {
    NSString *userNameRegex = @"^[A-Za-z0-9]{6,20}+$";
    NSPredicate *userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userNameRegex];
    return [userNamePredicate evaluateWithObject:self];
}

- (BOOL)dln_isPassword {
    NSString *passWordRegex = @"^[a-zA-Z0-9]{6,20}+$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:self];
}

- (BOOL)dln_isNickname {
    NSString *nicknameRegex = @"^[\u4e00-\u9fa5]{4,8}$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nicknameRegex];
    return [passWordPredicate evaluateWithObject:self];
}

- (BOOL)dln_isIdentityCard {
    NSString *idRegex = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",idRegex];
    return [identityCardPredicate evaluateWithObject:self];
}
@end
