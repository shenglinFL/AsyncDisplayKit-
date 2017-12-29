//
//  DLNFileManager.m
//  DLNFoundation
//
//  Created by Linzh on 12/22/15.
//  Copyright © 2015 Daniel Lin. All rights reserved.
//

#import "DLNFileManager.h"

@implementation DLNFileManager
//获取Documents目录
- (NSString *)getDirDoc {
    //[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;
}

//获取Library目录
- (NSString *)getDirLib {
    //[NSHomeDirectory() stringByAppendingPathComponent:@"Library"];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *libraryDirectory = [paths objectAtIndex:0];
    return libraryDirectory;
}

//获取Cache目录
- (NSString *)getDirCache {
    NSArray *cacPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [cacPath objectAtIndex:0];
    return cachePath;
}

//获取Tmp目录
- (NSString *)getDirTmp {
    //[NSHomeDirectory() stringByAppendingPathComponent:@"tmp"];
    NSString *tmpDirectory = NSTemporaryDirectory();
    return tmpDirectory;
}

//创建文件夹
- (BOOL)createDirInDocByName:(NSString *)dirName {
    NSString *documentsPath =[self getDirDoc];
    NSString *dirPath = [documentsPath stringByAppendingPathComponent:dirName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    // 创建目录
    return [fileManager createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:nil];
}

//创建文件
- (BOOL)createFileInDocByName:(NSString *)fileName {
    NSString *documentsPath =[self getDirDoc];
    NSString *filePath = [documentsPath stringByAppendingPathComponent:fileName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return [fileManager createFileAtPath:filePath contents:nil attributes:nil];
}

//写文件
- (BOOL)writeFileInDocByName:(NSString *)fileName withContent:(NSString *)content {
    NSString *documentsPath =[self getDirDoc];
    NSString *filePath = [documentsPath stringByAppendingPathComponent:fileName];
    return [content writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
}

//读文件
-(NSString *)readFileInDocByName:(NSString *)fileName {
    NSString *documentsPath =[self getDirDoc];
    NSString *filePath = [documentsPath stringByAppendingPathComponent:fileName];
    //    NSData *data = [NSData dataWithContentsOfFile:filePath];
    return [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
}

//删除文件
- (BOOL)deleteFileInDocByName:(NSString *)fileName {
    NSString *documentsPath =[self getDirDoc];
    NSString *filePath = [documentsPath stringByAppendingPathComponent:fileName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return [fileManager removeItemAtPath:filePath error:nil];
}

//文件属性
- (NSDictionary *)getFileAttriutesInDocByName:(NSString *)fileName {
    NSString *documentsPath =[self getDirDoc];
    NSString *filePath = [documentsPath stringByAppendingPathComponent:fileName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return [fileManager attributesOfItemAtPath:filePath error:nil];
}
@end
