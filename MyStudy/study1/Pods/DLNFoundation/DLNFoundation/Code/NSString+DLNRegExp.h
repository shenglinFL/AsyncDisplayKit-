//
//  NSString+DLNRegExp.h
//  DLNFoundation
//
//  Created by Linzh on 12/22/15.
//  Copyright © 2015 Daniel Lin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DLNRegExp)
/**
 *  判断手机号码 (only in China)
 *
 *  @return <#return value description#>
 */
- (BOOL)dln_isMobileNumber;

/**
 *  判断固定电话 (only in China)
 *
 *  @return <#return value description#>
 */
- (BOOL)dln_isPhoneNumber;

/**
 *  判断邮箱
 *
 *  @return <#return value description#>
 */
- (BOOL)dln_isEmail;

/**
 *  判断车牌号
 *
 *  @return <#return value description#>
 */
- (BOOL)dln_isCarNumber;

/**
 *  判断车型
 *
 *  @return <#return value description#>
 */
- (BOOL)dln_isCarType;

/**
 *  判断用户名
 *
 *  @return <#return value description#>
 */
- (BOOL)dln_isUserName;

/**
 *  判断密码
 *
 *  @return <#return value description#>
 */
- (BOOL)dln_isPassword;

/**
 *  判断昵称
 *
 *  @return <#return value description#>
 */
- (BOOL)dln_isNickname;

/**
 *  判断身份证
 *
 *  @return <#return value description#>
 */
- (BOOL)dln_isIdentityCard;
@end
