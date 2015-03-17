//
//  ViewController.m
//  YUVVIew
//
//  Created by apple on 15/3/10.
//  Copyright (c) 2015年 thinker. All rights reserved.
//

#import "ViewController.h"
#import "OpenGLView20.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    

}

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
     NSString *file = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"jpgimage1_image_640_480.yuv"];

    NSData *reader = [NSData dataWithContentsOfFile:file];
    
    NSLog(@"the reader %@ length is %i",file, reader.length);
    
    UInt32 * pFrameRGB = (UInt32*)[reader bytes];
    
    
    OpenGLView20 * myview = [[OpenGLView20 alloc]initWithFrame:CGRectMake(10, 10, 320, 240)];
    
    [self.view addSubview:myview];
    NSLog(@"window before added %@", myview.window);
//    [myview setVideoSize:100 height:50];
    [myview setVideoSize:320 height:240];

//    [myview displayYUV420pData:pFrameRGB width:100 height:100];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        sleep(1);
        NSLog(@"start");
        [myview displayYUV420pData:pFrameRGB width:640 height:480];
        NSLog(@"end");

        [self saveFile:@"test.yuv" data:reader];

    });
}

-(void)saveFile:(NSString  *)fileName data:(NSData *)data{
    
     NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *directoryPaths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    for(int i = 0;i<[directoryPaths count];i++){
        NSLog(@"path =%@",[[directoryPaths objectAtIndex:i] description]);
    }
    NSString *documentsDirectoryPath = [directoryPaths objectAtIndex:0];
    if ([fileManager fileExistsAtPath:@""]==YES) {
        NSLog(@"File exists");
    }
    fileName = [documentsDirectoryPath stringByAppendingPathComponent:fileName];

    [fileManager createFileAtPath:fileName contents:data attributes:nil];
    
    
    NSLog(@"saveFile %@， filename =%@",[fileManager currentDirectoryPath],fileName);
    
    fileName = [documentsDirectoryPath stringByAppendingPathComponent:@"tt"];

    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
