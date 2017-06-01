//
//  DeviceManager.h
//  CarAssistantsTest
//
//  Created by  on 15/5/12.
//  Copyright (c) 2015年 . All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DeviceManager : NSObject
///获取屏幕大小
+(CGSize)currentScreenSize;
///当前ios版本
+(NSString*)currentDeviseVersion;
///当前设备型号
+(NSString*)currentModel;
///当前程序的版本号
+(NSString*)currenVersion;
@end
