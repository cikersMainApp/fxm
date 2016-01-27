//
//  DicWikiInfo.m
//  CikersApp
//
//  Created by fxm on 16/1/26.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "DicWikiInfo.h"

@implementation DicWikiInfo

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
    
    
    if ([self.authorname isEqual:[NSNull null]])
    {
        self.authorname = @"";
    }
    
    
    if ([self.image isEqual:[NSNull null]])
    {
        self.image = [[NSMutableArray alloc] init];
    }
    
}


@end
