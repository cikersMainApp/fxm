//
//  WIkiModel.m
//  CikersApp
//
//  Created by fxm on 16/1/5.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "WIkiModel.h"


@implementation WIkiModel


-(void)parseExtra
{

    self.authorname = [self.extra objectForKey:@"authorname"];
    self.content = [self.extra objectForKey:@"content"];
    self.shortTitle = [self.extra objectForKey:@"shortTitle"];
    self.title = [self.extra objectForKey:@"title"];
    self.video = [self.extra objectForKey:@"video"];
    
    self.image = [self.extra objectForKey:@"image"];
    self.marks = [self.extra objectForKey:@"marks"];
    
    self.time = [ToolUtil tool_utcToNsstring:self.createdOn];
}

@end
