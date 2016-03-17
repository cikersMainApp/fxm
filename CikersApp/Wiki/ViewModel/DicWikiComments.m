//
//  DicWikiComments.m
//  CikersApp
//
//  Created by fxm on 16/3/14.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "DicWikiComments.h"

@implementation DicWikiComments

-(void)setExtra:(NSDictionary *)extra
{
    _extra = extra;
 
    _wikicontent = [_extra objectForKey:@"content"];
}

@end
