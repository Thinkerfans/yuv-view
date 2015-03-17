//
//  THFileUtils.h
//  YUVVIew
//
//  Created by apple on 15/3/10.
//  Copyright (c) 2015年 thinker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface THFileUtils : NSObject

+(BOOL)writeToFile:fileName data:(NSData *)data;

@end
