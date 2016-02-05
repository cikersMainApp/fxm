//
//  DicWikiInfo.m
//  CikersApp
//
//  Created by fxm on 16/1/26.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "DicWikiInfo.h"

@implementation DicWikiInfo


//-(void)setExtra:(NSDictionary *)extra
//{
//    self.extra = extra;
// 
//    if (self.extra)
//    {
//        self.authorname = [self.extra objectForKey:@"authorname"];
//        self.content = [self.extra objectForKey:@"content"];
//        self.shortTitle = [self.extra objectForKey:@"shortTitle"];
//        self.title = [self.extra objectForKey:@"title"];
//        self.video = [self.extra objectForKey:@"video"];
//        
//        self.image = [self.extra objectForKey:@"image"];
//        self.marks = [self.extra objectForKey:@"marks"];
//        if ([self.image isEqual:[NSNull null]])
//        {
//            self.image = [[NSMutableArray alloc] init];
//        }
//    }
//}

//-(void)setCreatedOn:(NSNumber *)createdOn
//{
//
//    self.createdOn = createdOn;
//    if (![self.createdOn isEqual:[NSNull null]]) {
//        self.time_createdon = [ToolUtil tool_utcToNsstring:self.createdOn];
//    }
//
//}


-(void)setTeam:(NSDictionary *)team
{

    if (team)
    {
        self.cnname = [team objectForKey:@"cnname"];
    }
    
}

-(void)parseExtra
{
    self.isNull = NO;
    
    self.authorname = [self.extra objectForKey:@"authorname"];
    self.content = [self.extra objectForKey:@"content"];
    self.shortTitle = [self.extra objectForKey:@"shortTitle"];
    self.title = [self.extra objectForKey:@"title"];
    self.video = [self.extra objectForKey:@"video"];
    
    self.imgextra = [self.extra objectForKey:@"image"];
    self.marks = [self.extra objectForKey:@"marks"];
    
    
    self.time_createdon = [ToolUtil tool_utcToNsstring:self.createdOn];
    

    if ([self.authorname isEqual:[NSNull null]])
    {
        self.authorname = @"";
    }
    
    
    if ([self.imgextra isEqual:[NSNull null]])
    {
        self.imgextra = [[NSMutableArray alloc] init];
    }
    
    
    
    
    if ([self.wikitype isEqualToString:WIKI_TYPE_EVENT]) {
        self.eventOn = [self.extra objectForKey:@"eventOn"];
        self.time_eventOn = [ToolUtil tool_utcToNsstring:self.eventOn];
    }
    
    if ([self.wikitype isEqualToString:WIKI_TYPE_MATCH])
    {
        
        if (self.match == nil) {
            self.isNull = YES;
            return;
        }
        
        self.favora = [self.extra objectForKey:@"favora"];
        self.favorb = [self.extra objectForKey:@"favorb"];
        self.scorea = [self.extra objectForKey:@"scorea"];
        self.scoreb = [self.extra objectForKey:@"scoreb"];
        self.tid = [self.extra objectForKey:@"tid"];
        self.tname = [self.extra objectForKey:@"tname"];
        self.match = [self.extra objectForKey:@"match"];
        self.matchId = [self.match objectForKey:@"id"];
        NSDictionary *teamA = [self.match objectForKey:@"teamA"];
        NSDictionary *teamB = [self.match objectForKey:@"teamB"];
        
        self.teamAid = [teamA objectForKey:@"id"];
        self.teamAicon = [teamA objectForKey:@"portrait"];
        self.teamAname = [teamA objectForKey:@"cnname"];
        
        self.teamBid = [teamB objectForKey:@"id"];
        self.teamBicon = [teamB objectForKey:@"portrait"];
        self.teamBname = [teamB objectForKey:@"cnname"];
    }
    
}


@end
