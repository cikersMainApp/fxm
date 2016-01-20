//
//  TounamentPlayerCell.h
//  CikersApp
//
//  Created by fxm on 16/1/15.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TounamentPlayerCell : UITableViewCell


@property(nonatomic,strong)UIImageView *image1;
@property(nonatomic,strong)UILabel *lb_1;
@property(nonatomic,strong)UIImageView *image2;
@property(nonatomic,strong)UILabel *lb_2;

@property(nonatomic,strong)UILabel *lb_score;


-(void)updateUI:(id)dic;


@end


@interface TounamentPlayerRankCell : UITableViewCell

@property(nonatomic,strong)UIImageView *image;
@property(nonatomic,strong)UILabel *lb;

@property(nonatomic,strong)UILabel *lb_red;
@property(nonatomic,strong)UILabel *lb_yellow;

@property(nonatomic,assign)NSInteger num_tag;

-(void)updateUI:(id)dic;


@end
