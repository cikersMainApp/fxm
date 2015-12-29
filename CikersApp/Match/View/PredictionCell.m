//
//  PredictionCell.m
//  CikersApp
//
//  Created by fxm on 15/12/29.
//  Copyright © 2015年 cikers. All rights reserved.
//


#define bt_trailingSpace 30.0f  //右边距
#define bt_leadingSpace 30.0f //左边距
#define bt_spaceBetween 15.0f //按钮之间的间距


#import "PredictionCell.h"
#import "HLRoundButton.h"
@implementation PredictionCell

- (void)awakeFromNib {
    // Initialization code
    
    [self.bt_1 setTag:BNT_1];
    
    
    [self initUI];
    
    /*
     
     (width - 30 - 30 - 15 - 15)/3
     */
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)initUI
{

    
    float b_width = (ScreenWidth - 30 - 30 - 15 - 15)/3.0f;
    
    // 第一排
    
    for (int i = 0; i< 6; i++)
    {
        
        int w = i;
        
        if (i>=3) {
            w = i - 3;
        }
        
        
        
        
        
        
        HLRoundButton *bt = [[HLRoundButton alloc] initWithFrame:CGRectMake(30+w*(b_width+15), 100 + (i/3)*100, b_width, 32)];

        [bt setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
        [bt setTag:i+BNT_3+1];
        [bt addTarget:self action:@selector(bnt_action:) forControlEvents:UIControlEventTouchUpInside];
        [self.view_bg addSubview:bt];
        
        
        
        UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(30+w*(b_width+15), 30 + (i/3)*100, b_width, 15)];
        [lable setBackgroundColor:[UIColor orangeColor]];
        lable.tag = LABLE_TAG;
        [lable setTextAlignment:NSTextAlignmentCenter];
        [lable setText:@"已获得投票数量"];
        [lable setTextColor:[UIColor blackColor]];
        [self.view_bg addSubview:lable];
        
    }
    
    
    
}


-(IBAction)bnt_action:(id)sender
{

    UIButton *bt = (UIButton*)sender;
    
    switch (bt.tag) {
        case BNT_1:
        {
        
        }
            break;
            
        default:
            break;
    }
    
}



@end
