//
//  UIDevice+Resolutions.m
//  apos-enterprise-ios
//
//  Created by Horrace Lin on 13-9-6.
//  Copyright (c) 2013年 Horrace Lin. All rights reserved.
//

#import "TDUIDevice+Resolutions.h"
#include <sys/utsname.h>
#import <sys/sysctl.h>




@implementation UIDevice (Resolutions)

static NSDictionary *modelNameArray;
static NSDictionary *bluetoothModelNameDictionary;

+(UIDeviceResolution) currentResolution {
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
        if ([[UIScreen mainScreen] respondsToSelector: @selector(scale)]) {
            CGSize result = [[UIScreen mainScreen] bounds].size;
            result = CGSizeMake(result.width * [UIScreen mainScreen].scale, result.height * [UIScreen mainScreen].scale);
            if (result.height <= 480.0f)
                return UIDevice_iPhoneStandardRes;
            if (result.height == 1136)
                return UIDevice_iPhoneTallerHiRes;
            if (result.height == 1334)
                return UIDevice_iPhone6;
            if (result.height == 1920)
                return UIDevice_iPhone6s;
        
            return (result.height == 960 ? UIDevice_iPhoneTallerHiRes : UIDevice_iPhoneHiRes);
        } else
            return UIDevice_iPhoneStandardRes;
    } else
        return (([[UIScreen mainScreen] respondsToSelector: @selector(scale)]) ? UIDevice_iPadHiRes : UIDevice_iPadStandardRes);
}

/******************************************************************************
 函数名称 : + (UIDeviceResolution) currentResolution
 函数描述 : 当前是否运行在iPhone5端
 输入参数 : N/A
 输出参数 : N/A
 返回参数 : N/A
 备注信息 :
 ******************************************************************************/
+ (BOOL)isRunningOniPhone5{
    if ([self currentResolution] == UIDevice_iPhoneTallerHiRes) {
        return YES;
    }
    return NO;
}

/******************************************************************************
 函数名称 : + (BOOL)isRunningOniPhone
 函数描述 : 当前是否运行在iPhone端
 输入参数 : N/A
 输出参数 : N/A
 返回参数 : N/A
 备注信息 :
 ******************************************************************************/
+ (BOOL)isRunningOniPhone{
    return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone);
}



static const char* jailbreak_apps[] =
{
    "/Applications/Cydia.app",
    "/Applications/blackra1n.app",
    "/Applications/blacksn0w.app",
    "/Applications/greenpois0n.app",
    "/Applications/limera1n.app",
    "/Applications/redsn0w.app",
    NULL,
};


+(BOOL)isJailBrokeDevice
{
    // Check whether the jailbreak apps are installed
    for (int i = 0; jailbreak_apps[i] != NULL; ++i)
    {
        if ([[NSFileManager defaultManager] fileExistsAtPath:[NSString
                                                              stringWithUTF8String:jailbreak_apps[i]]])
        {
            return YES;
        }
    }
    
    return NO;
}




+(void) modelInit {
 
    
    if(!modelNameArray) {
        modelNameArray = @{
                           
                           @"i386": @"iPhone Simulator",
                           @"x86_64":@"iPhone Simulator",
                           @"iPhone1,1": @"iPhone 2G",
                           @"iPhone1,2": @"iPhone 3G",
                           @"iPhone2,1": @"iPhone 3GS",
                           @"iPhone3,1":@"iPhone 4(GSM)",
                           @"iPhone3,2":@"iPhone 4(GSM Rev A)",
                           @"iPhone3,3":@"iPhone 4(CDMA)",
                           @"iPhone4,1":@"iPhone 4S",
                           @"iPhone5,1":@"iPhone 5(GSM)",
                           @"iPhone5,2":@"iPhone 5(GSM+CDMA)",
                           @"iPhone5,3":@"iPhone 5c(GSM)",
                           @"iPhone5,4":@"iPhone 5c(Global)",
                           @"iPhone6,1":@"iphone 5s(GSM)",
                           @"iPhone6,2":@"iphone 5s(Global)",
                           @"iPhone7,2":@"iphone 6",
                           @"iPhone7,1":@"iphone 6 plus",

                           
                           @"iPod1,1": @"iPod Touch 1G",
                           @"iPod2,1": @"iPod Touch 2G",
                           @"iPod3,1": @"iPod Touch 3G",
                           @"iPod4,1": @"iPod Touch 4G",
                           @"iPod5,1": @"iPod Touch 5G",
                           
                           @"iPad1,1":@"iPad",
                           @"iPad2,1":@"iPad 2(WiFi)",
                           @"iPad2,2":@"iPad 2(GSM)",
                           @"iPad2,3":@"iPad 2(CDMA)",
                           @"iPad2,4":@"iPad 2(WiFi + New Chip)",
                           @"iPad3,1":@"iPad 3(WiFi)",
                           @"iPad3,2":@"iPad 3(GSM+CDMA)",
                           @"iPad3,3":@"iPad 3(GSM)",
                           @"iPad3,4":@"iPad 4(WiFi)",
                           @"iPad3,5":@"iPad 4(GSM)",
                           @"iPad3,6": @"iPad 4(GSM+CDMA)",
                           @"iPad4,1":@"iPad air(WiFi)",
                           @"iPad4,2":@"iPad air(GSM)",
                           @"iPad4,3": @"iPad air(GSM+CDMA)",
                           @"iPad5,3":@"iPad air2(WiFi)",
                           @"iPad5,4":@"iPad air2(GSM+CDMA)",
                           
                           @"iPad2,5":@"iPad mini (WiFi)",
                           @"iPad2,6":@"iPad mini (GSM)",
                           @"iPad2,7": @"ipad mini (GSM+CDMA)",
                           @"iPad4,4": @"iPad mini2 (WiFi)",
                           @"iPad4,5":@"iPad mini2 (GSM)",
                           @"iPad4,6": @"ipad mini2 (GSM+CDMA)",
                           @"iPad4,7":@"iPad mini3 (WiFi)",
                           @"iPad4,8":@"iPad mini3 (GSM)",
                           @"iPad4,9":@"ipad mini3 (GSM+CDMA)"
                           };
    }
    
}

+(void) bluetoothModelInit {
    
    
    if(!bluetoothModelNameDictionary) {
        bluetoothModelNameDictionary = @{
                                         
                                         @"i386": @"2.0",//模拟器
                                         @"x86_64":@"2.0",//模拟器
                                         @"iPhone1,1": @"2.0",
                                         @"iPhone1,2": @"2.0",
                                         @"iPhone2,1": @"2.1",
                                         @"iPhone3,1":@"2.1",
                                         @"iPhone3,2":@"2.1",
                                         @"iPhone3,3":@"2.1",
                                         @"iPhone4,1":@"4.0",
                                         @"iPhone5,1":@"4.0",
                                         @"iPhone5,2":@"4.0",
                                         @"iPhone5,3":@"4.0",
                                         @"iPhone5,4":@"4.0",
                                         @"iPhone6,1":@"4.0",
                                         @"iPhone6,2":@"4.0",
                                         @"iPhone7,2":@"4.0",
                                         @"iPhone7,1":@"4.0",
                                         
                                         
                                         @"iPod1,1": @"2.0",//No Bluetooth Hardware
                                         @"iPod2,1": @"2.1",
                                         @"iPod3,1": @"2.1",
                                         @"iPod4,1": @"2.1",
                                         @"iPod5,1": @"4.0",
                                         
                                         @"iPad1,1":@"2.1",
                                         @"iPad2,1":@"2.1",
                                         @"iPad2,2":@"2.1",
                                         @"iPad2,3":@"2.1",
                                         @"iPad2,4":@"2.1",
                                         @"iPad3,1":@"4.0",
                                         @"iPad3,2":@"4.0",
                                         @"iPad3,3":@"4.0",
                                         @"iPad3,4":@"4.0",
                                         @"iPad3,5":@"4.0",
                                         @"iPad3,6": @"4.0",
                                         @"iPad4,1":@"4.0",
                                         @"iPad4,2":@"4.0",
                                         @"iPad4,3": @"4.0",
                                         @"iPad5,3":@"4.0",
                                         @"iPad5,4":@"4.0",
                                         
                                         @"iPad2,5":@"4.0",
                                         @"iPad2,6":@"4.0",
                                         @"iPad2,7": @"4.0",
                                         @"iPad4,4": @"4.0",
                                         @"iPad4,5":@"4.0",
                                         @"iPad4,6": @"4.0",
                                         @"iPad4,7":@"4.0",
                                         @"iPad4,8":@"4.0",
                                         @"iPad4,9":@"4.0"
                                         };
    }
    
}

//+(int) getDeviceModelNumber {
////    [self modelInit];
////    
////    
////    struct utsname systemInfo;
////    uname(&systemInfo);
////    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
////    
////    NSInteger modelIndex = - 1;
////    
////    if([modelArray containsObject:deviceString]) {
////        modelIndex = [modelArray indexOfObject:deviceString];
////    }
//
//    return 0;
//}

+(NSString*) getBluetoothDeviceModel{
    [self bluetoothModelInit];
    
    NSString *platform = [self getSysInfoByName:"hw.machine"];
    NSString *modelNameString = [bluetoothModelNameDictionary objectForKey:platform];
    
    if(modelNameString) {
        return modelNameString;
    }
    
    
    return platform;
}

+(NSString*) getDeviceModel {
    
    [self modelInit];
    
    NSString *platform = [self getSysInfoByName:"hw.machine"];
    NSString *modelNameString = [modelNameArray objectForKey:platform];
    
    if(modelNameString) {
        return modelNameString;
    }
    
    
    return platform;
    
}

+(NSString *) getSysInfoByName:(char *)typeSpecifier
{
    size_t size;
    sysctlbyname(typeSpecifier, NULL, &size, NULL, 0);
    
    char *answer = malloc(size);
    sysctlbyname(typeSpecifier, answer, &size, NULL, 0);
    
    NSString *results = [NSString stringWithCString:answer encoding: NSUTF8StringEncoding];
    
    free(answer);
    return results;
}



@end