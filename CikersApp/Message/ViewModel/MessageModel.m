//
//  MessageModel.m
//  CikersApp
//
//  Created by fxm on 16/1/18.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "MessageModel.h"

@implementation MessageModel


-(id)initWithDelegate:(id<BaseApiDelegate>)newDelegate needCommonProcess:(BOOL)need
{
    if (self = [super initWithDelegate:self needCommonProcess:need]) {
        
        
    }    
    return self;
}

-(void)finishedWithRequest:(HttpRequest *)request Response:(HttpResponse *)response AndError:(NSError *)error
{

}



@end
