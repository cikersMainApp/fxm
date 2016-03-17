//
//  DicMessage.h
//  CikersApp
//
//  Created by fxm on 16/1/18.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DicMessage : NSObject
/*
authorname: "tiiyy"
content: "加入了您的球队 测试球队2016012"
icon: "/repos/player/00/09/75/97566.png"
id: 3046234
pubdate: 1456407761000
readStatus: "1"
senderId: 97566
type: "memberJoin"
*/

@property(nonatomic,strong)NSString *authorname;
@property(nonatomic,strong)NSString *content;
@property(nonatomic,strong)NSString *icon;
@property(nonatomic,strong)NSNumber *id;
@property(nonatomic,strong)NSNumber *pubdate;

@property(nonatomic,strong)NSString *readStatus;
@property(nonatomic,strong)NSNumber *senderId;
@property(nonatomic,strong)NSString *type;

//--------
@property(nonatomic,strong)NSString *time_pubdate;
@property(nonatomic,assign)BOOL bool_readstatus;
@end
