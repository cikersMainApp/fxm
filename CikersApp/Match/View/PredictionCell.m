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
#import "DicMatchinfo.h"
#import "NSUserDefaults+RMSaveCustomObject.h"
#import "DicTeaminfo.h"
#import "ARLabel.h"
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
    
    
    const char * title[] = {"胜","平","负"};
    
    // 胜负 第一排
    
    for (int i = 0; i< 3; i++)
    {
        
        
        UIButton *bt = [[UIButton alloc] initWithFrame:CGRectMake(30+i*(b_width+15), 80 + (i/3)*100, b_width, 32)];
        
        [bt setTitle:[NSString stringWithUTF8String:title[i]] forState:UIControlStateNormal];
        [bt setTag:i];
        [bt addTarget:self action:@selector(bnt_action:) forControlEvents:UIControlEventTouchUpInside];
        [bt setBackgroundColor:[UIColor grayColor]];
        [self.view_vsbg addSubview:bt];
        
        [bt.layer setMasksToBounds:YES];
        [bt.layer setCornerRadius:10.0f];
        [bt.layer setBorderWidth:1.0];
        
        
        ARLabel *lable = [[ARLabel alloc] initWithFrame:CGRectMake(30+i*(b_width+15), 55+ (i/3)*100, b_width, 15)];
        [lable setBackgroundColor:[UIColor orangeColor]];
        lable.tag = 20+i;
        [lable setTextAlignment:NSTextAlignmentCenter];
        [lable setText:@"已获得投票数量"];
        [lable setFont:[UIFont fontWithName:@"Helvetica" size:12]];
        [lable setTextColor:[UIColor blackColor]];
        [self.view_vsbg addSubview:lable];
        
    }

    
    
    // 进球数 第一排
    
    for (int i = 0; i< 6; i++)
    {
        
        int w = i;
        
        if (i>=3) {
            w = i - 3;
        }
        
        
        UIButton *bt = [[UIButton alloc] initWithFrame:CGRectMake(30+w*(b_width+15), 60 + (i/3)*80, b_width, 32)];

        [bt setTitle:[NSString stringWithFormat:@"%d",i+1] forState:UIControlStateNormal];
        [bt setTag:i+BNT_3+1];
        [bt setBackgroundColor:[UIColor grayColor]];
        [bt addTarget:self action:@selector(bnt_action:) forControlEvents:UIControlEventTouchUpInside];
        [self.view_bg addSubview:bt];
        
        
        
        ARLabel *lable = [[ARLabel alloc] initWithFrame:CGRectMake(30+w*(b_width+15), 35+ (i/3)*80, b_width, 15)];
        [lable setBackgroundColor:[UIColor orangeColor]];
        lable.tag = 20+i+BNT_3+1;
        [lable setTextAlignment:NSTextAlignmentCenter];
        [lable setText:@"已获得投票数量"];
        [lable setFont:[UIFont fontWithName:@"Helvetica" size:12]];
        [lable setTextColor:[UIColor blackColor]];
        [self.view_bg addSubview:lable];
        
    }
    
    
    
}


-(IBAction)bnt_action:(id)sender
{

    UIButton *bt = (UIButton*)sender;
    
    if (bt.tag < 3) {
        
        
        switch (bt.tag) {
            case 0:
            {
                [self.delegate sendNet:@"A"];
            }
                break;
            case 1:
            {
                [self.delegate sendNet:@"O"];
            }
                break;
            case 2:
            {
                [self.delegate sendNet:@"B"];
            }
                break;
                
            default:
                break;
        }
        
        
    }
    else
    {
        NSString *str = [NSString stringWithFormat:@"%d",(bt.tag - 3)];
        
        [self.delegate sendNet:str];
        
    }
    
    
}

-(void)updateUI:(id)sender
{

    //更新双方球队名称
    
    DicMatchinfo *info = (DicMatchinfo*)[[NSUserDefaults standardUserDefaults] rm_customObjectForKey:[NSString stringWithFormat:@"match%@",[DataSingleton Instance].id_cur_match]];
    
    
    if (info==nil) {
        return;
    }
    
    
    self.lb_namebyhome.text = info.teama.name;
    self.lb_namebyguest.text= info.teamb.name;
    self.lb_score.text = info.score;
    
    
    //更新文本
    
    NSDictionary *dic = (NSDictionary*)sender;
    
    NSDictionary *data = [dic objectForKey:@"data"];
    
    
    
//    NSArray *myops = [data objectForKey:@"myops"];
    

    
    
    NSArray *stats = [data objectForKey:@"stats"];
    
    
    NSArray *array_str = [NSArray arrayWithObjects:@"A",@"O",@"B",@"1",@"2",@"3",@"4",@"5",@"6", nil];
    
    for (NSDictionary *elem in stats)
    {
        NSLog(@"%@",elem);
        
        NSString *name = [elem objectForKey:@"name"];
        NSNumber *count = [elem objectForKey:@"count"];
        
        
        NSUInteger _index = [array_str indexOfObject:name];
        
        if (_index < 3)
        {
            UILabel * lable = [self.view_vsbg viewWithTag:_index+20];
            lable.text = [NSString stringWithFormat:@"已获得投票%@",count];
        }
        else
        {
            UILabel * lable = [self.view_bg viewWithTag:_index+20];
            lable.text = [NSString stringWithFormat:@"已获得投票%@",count];
        }
        
        
        
    }
    
}

@end
