//
//  DLNFileManager.h
//  DLNFoundation
//
//  Created by Linzh on 12/22/15.
//  Copyright © 2015 Daniel Lin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DLNFileManager : NSObject
/**
 *  获取Documents目录
 *
 *  @return <#return value description#>
 */
- (NSString *)getDirDoc;

/**
 *  获取Library目录
 *
 *  @return <#return value description#>
 */
- (NSString *)getDirLib;

/**
 *  获取Cache目录
 *
 *  @return <#return value description#>
 */
- (NSString *)getDirCache;

/**
 *  获取Tmp目录
 *
 *  @return <#return value description#>
 */
- (NSString *)getDirTmp;

/**
 *  创建文件夹
 *
 *  @param dirName <#dirName description#>
 *
 *  @return <#return value description#>
 */
- (BOOL)createDirInDocByName:(NSString *)dirName;

/**
 *  创建文件
 *
 *  @param fileName <#fileName description#>
 *
 *  @return <#return value description#>
 */
- (BOOL)createFileInDocByName:(NSString *)fileName;

/**
 *  写文件
 *
 *  @param fileName <#fileName description#>
 *  @param content  <#content description#>
 *
 *  @return <#return value description#>
 */
- (BOOL)writeFileInDocByName:(NSString *)fileName withContent:(NSString *)content;

/**
 *  读文件
 *
 *  @param fileName <#fileName description#>
 *
 *  @return <#return value description#>
 */
-(NSString *)readFileInDocByName:(NSString *)fileName;

/**
 *  删除文件
 *
 *  @param fileName <#fileName description#>
 *
 *  @return <#return value description#>
 */
- (BOOL)deleteFileInDocByName:(NSString *)fileName;

/**
 *  文件属性
 *
 *  @param fileName <#fileName description#>
 *
 *  @return <#return value description#>
 */
- (NSDictionary *)getFileAttriutesInDocByName:(NSString *)fileName;
@end
