//
//  YMUtils.m
//  YMCityPicker
//
//  Created by 于淼 on 14-11-26.
//  Copyright (c) 2014年 CMCM. All rights reserved.
//

#import "YMUtils.h"

@implementation YMUtils
+ (NSMutableArray *)getCityData
{
    NSArray *jsonArray = [[NSArray alloc]init];
    NSData *fileData = [[NSData alloc]init];
    NSUserDefaults *UD = [NSUserDefaults standardUserDefaults];
    if ([UD objectForKey:@"city"] == nil) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"zh_CN" ofType:@"json"];
        fileData = [NSData dataWithContentsOfFile:path];
        
        [UD setObject:fileData forKey:@"city"];
        [UD synchronize];
        
//        NSLog(@"1 == %@",fileData);
        
    }
    else {
        fileData = [UD objectForKey:@"city"];
        
//        NSLog(@"2 == %@",fileData);

    }
    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:0];
    jsonArray = [NSJSONSerialization JSONObjectWithData:fileData options:NSJSONReadingMutableLeaves error:nil];
    for (NSDictionary *dict in jsonArray) {
        [array addObject:dict];
        
//        NSLog(@"1 == %@",dict);

    }
    
    return array;
}


@end
