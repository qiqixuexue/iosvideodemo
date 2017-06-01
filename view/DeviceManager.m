//
//  DeviceManager.m
//  CarAssistantsTest
//
//  Created by  on 15/5/12.
//  Copyright (c) 2015年 . All rights reserved.
//

#import "DeviceManager.h"

@implementation DeviceManager
+(CGSize)currentScreenSize{
//    NSLog(@"%f",[[UIScreen mainScreen]bounds].size.width);
   return [[UIScreen mainScreen]bounds].size;
    
}
+(NSString*)currentDeviseVersion{
    return [UIDevice currentDevice].systemVersion;
}
+(NSString*)currentModel{
    return [UIDevice currentDevice].model;
}
+(NSString*)currenVersion{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}
@end
