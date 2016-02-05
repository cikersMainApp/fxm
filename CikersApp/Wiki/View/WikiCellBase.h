//
//  WikiCellBase.h
//  CikersApp
//
//  Created by fxm on 16/1/27.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DicWikiInfo.h"
#import "WikiPhotoView.h"
@interface WikiCellBase : UITableViewCell
// 头像
@property(nonatomic,strong)UIImageView *img_icon;
// 姓名
@property(nonatomic,strong)UILabel *lb_name;
// 发表于xxx
@property(nonatomic,strong)UILabel *lb_source;
// 发帖文本内容
@property(nonatomic,strong)UILabel *lb_content;
// message类型帖子的图片九宫格背景
@property(nonatomic,strong)WikiPhotoView *_picContainerView;
// 发帖时间
@property(nonatomic,strong)UILabel *lb_time;
// 发帖文本查看更多按钮
@property(nonatomic,strong)UIButton *_moreButton;
// 发帖文本查看更多按钮状态
@property(nonatomic,assign)BOOL _shouldOpenContentLabel;
// 底部按钮背景
@property(nonatomic,strong)UIView *view_footer;
// 底部




// event背景
@property(nonatomic,strong)UIView *view_eventbg;
// event时间
@property(nonatomic,strong)UILabel *lb_eventtime;






@property (nonatomic, strong) DicWikiInfo *model;



+(NSString *)cellIdentifierForRow:(DicWikiInfo *)info;


@end
