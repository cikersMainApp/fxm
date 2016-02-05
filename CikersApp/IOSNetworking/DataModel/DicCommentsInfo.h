//
//  DicCommentsInfo.h
//  CikersApp
//
//  Created by fxm on 16/1/29.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DicCommentsInfo : NSObject

@property(nonatomic,strong)NSString *author;
@property(nonatomic,strong)NSString *authorportrait; //头像
@property(nonatomic,strong)NSString *cdate;// 时间
@property(nonatomic,strong)NSNumber *eid;//作者的id

//{"content":"回复+AT  [@付喜民]","to":11919,"toname":"胡景龙","marks":[{"id":442,"name":"付喜民"}]}
@property(nonatomic,strong)NSString *content;//外层的content


@property(nonatomic,strong)NSDictionary *extra; //扩展信息
//回复+AT  <a href='javascript:gotoplayerprofile(442);'>@付喜民</a>
@property(nonatomic,strong)NSString *extraContent;
@property(nonatomic,strong)NSArray *extraMarks;
@property(nonatomic,strong)NSNumber *extraTo; //引用评论人的id 例如 我回复了xxx的言论,这个id就是xxx的id
@property(nonatomic,strong)NSString *extraToname;//引用评论人的姓名



@property(nonatomic,strong)NSNumber *favorcount;//点赞数
@property(nonatomic,strong)NSNumber *id;
@property(nonatomic,strong)NSNumber *status;
@end
