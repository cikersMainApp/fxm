//
//  WIkiModel.h
//  CikersApp
//
//  Created by fxm on 16/1/5.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WIkiModel : NSObject

@property(nonatomic,strong)NSNumber *commentCount;
@property(nonatomic,strong)NSNumber *readCount;
@property(nonatomic,strong)NSNumber *createdOn;
@property(nonatomic,strong)NSNumber *id;


@property(nonatomic,strong)NSDictionary *extra;
@property(nonatomic,strong)NSString *contenttype; //帖子类型 三种
@property(nonatomic,strong)NSString *wikitype;    //帖子种类 五种
@property(nonatomic,strong)NSString *icon;
@property(nonatomic,strong)NSString *authorname;    //作者
@property(nonatomic,strong)NSString *content;       //正文
@property(nonatomic,strong)NSString *shortTitle;    //短标题
@property(nonatomic,strong)NSString *title;         //长标题
@property(nonatomic,strong)NSString *video;         //视频类型帖子时的视频播放地址

@property(nonatomic,strong)NSArray *image; //图像集合
@property(nonatomic,strong)NSArray *marks; //@人名单




@property(nonatomic,strong)NSString *time; //转化后的时间



//--------------------


-(void)parseExtra;

@end
