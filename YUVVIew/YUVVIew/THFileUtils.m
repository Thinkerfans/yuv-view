//
//  THFileUtils.m
//  YUVVIew
//
//  Created by apple on 15/3/10.
//  Copyright (c) 2015年 thinker. All rights reserved.
//

#import "THFileUtils.h"

@implementation THFileUtils

+(NSString *)getFileDir{
    NSArray *directoryPaths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryPath = [directoryPaths objectAtIndex:0];
    return documentsDirectoryPath;
}


+(BOOL)writeToFile:fileName data:(NSData *)data{
    NSString *dir = [THFileUtils getFileDir];
    fileName = [dir stringByAppendingPathComponent:fileName];
    [data writeToFile:fileName atomically:TRUE];
    return TRUE;
}


+(void)test:fileName data:(NSData *)data{
    NSFileHandle * fileHandle = [NSFileHandle fileHandleForWritingAtPath:fileName];
    if(fileHandle == nil)
    {
        NSLog(@"File not exists");
        return;
    }
    [fileHandle seekToEndOfFile];
    
    [fileHandle writeData:data];
    
    [fileHandle closeFile];
}


@end
