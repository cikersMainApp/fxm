//
//  WikiCellMatch.h
//  CikersApp
//
//  Created by fxm on 16/1/27.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "WikiCellBase.h"

@interface WikiCellMatch : WikiCellBase


@property(nonatomic,strong)UIView *viewmatch;

@property(nonatomic,strong)UILabel *lbAname;
@property(nonatomic,strong)UILabel *lbBname;
@property(nonatomic,strong)UILabel *lbScore;
@property(nonatomic,strong)UIImageView *img_iconA;
@property(nonatomic,strong)UIImageView *img_iconB;

-(void)initData;

@end
