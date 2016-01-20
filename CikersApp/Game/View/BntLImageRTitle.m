//
//  BntLImageRTitle.m
//  CikersApp
//
//  Created by fxm on 16/1/19.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "BntLImageRTitle.h"

@implementation BntLImageRTitle


-(CGRect)titleRectForContentRect:(CGRect)contentRect
{

    

    
    CGFloat titleH = contentRect.size.height;
    
    return CGRectMake(contentRect.size.width/2,0, contentRect.size.width, titleH);
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{

    
    return CGRectMake(5, 0, contentRect.size.height, contentRect.size.height);
}


@end
