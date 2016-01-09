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
#import "UIView+FXM.h"
@implementation PredictionCell

- (void)awakeFromNib {
    // Initialization code
    
    [self.bt_1 setTag:BNT_1];
    
    self.array_bnts = [[NSMutableArray alloc] init];
    self.array_lbs = [[NSMutableArray alloc] init];
    
    
    
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
        
        
        UIButton *bt = [[UIButton alloc] initWithFrame:CGRectMake(30+i*(b_width+15), 100 + (i/3)*100, b_width, 32)];
        
        [bt setTitle:[NSString stringWithUTF8String:title[i]] forState:UIControlStateNormal];
        [bt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [bt setTag:i+100];
        [bt addTarget:self action:@selector(bnt_action:) forControlEvents:UIControlEventTouchUpInside];
        [bt setBackgroundColor:[UIColor colorAndAlphaWithHexString:BNT_COLOR_BLUE]];
        [self.view_vsbg addSubview:bt];
        
        [bt.layer setMasksToBounds:YES];
        [bt.layer setCornerRadius:10.0f];
        [bt.layer setBorderWidth:1.0];
        
        
        ARLabel *lable = [[ARLabel alloc] initWithFrame:CGRectMake(30+i*(b_width+15), 75+ (i/3)*100, b_width, 15)];
//        [lable setBackgroundColor:[UIColor orangeColor]];
        lable.tag = 20+i;
        [lable setTextAlignment:NSTextAlignmentCenter];
        [lable setText:@"已获得投票数量"];
        [lable setFont:[UIFont fontWithName:@"Helvetica" size:12]];
        [lable setTextColor:[UIColor blackColor]];
        [self.view_vsbg addSubview:lable];
     
        [self.array_lbs addObject:lable];
        [self.array_bnts addObject:bt];
        
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
        [bt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [bt setTag:i+BNT_3+1+100];
        [bt setBackgroundColor:[UIColor colorAndAlphaWithHexString:BNT_COLOR_BLUE]];
        [bt addTarget:self action:@selector(bnt_action:) forControlEvents:UIControlEventTouchUpInside];
        [self.view_bg addSubview:bt];
        [bt.layer setMasksToBounds:YES];
        [bt.layer setCornerRadius:10.0f];
        [bt.layer setBorderWidth:1.0];
        
        
        ARLabel *lable = [[ARLabel alloc] initWithFrame:CGRectMake(30+w*(b_width+15), 35+ (i/3)*80, b_width, 15)];
        lable.tag = 20+i+BNT_3+1;
        [lable setTextAlignment:NSTextAlignmentCenter];
        [lable setText:@"已获得投票数量"];
        [lable setFont:[UIFont fontWithName:@"Helvetica" size:12]];
        [lable setTextColor:[UIColor blackColor]];
        [self.view_bg addSubview:lable];
     
        [self.array_lbs addObject:lable];
        [self.array_bnts addObject:bt];

    }
    
    
    
}


-(IBAction)bnt_action:(id)sender
{

    UIButton *bt = (UIButton*)sender;
    
    if ((bt.tag-100) < 3) {
        
        switch ((bt.tag-100)) {
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
        NSString *str = [NSString stringWithFormat:@"%ld",(bt.tag- 100 - 2)];
        
        [self.delegate sendNet:str];
        
    }
    
    
}

-(void)updateUI:(id)sender matchid:(NSNumber*)matchid
{

    //更新双方球队名称
    
    
    if (self.data_obj_matchinfo==nil) {
        return;
    }
    
    
    self.lb_namebyhome.text = self.data_obj_matchinfo.teama.name;
    self.lb_namebyguest.text= self.data_obj_matchinfo.teamb.name;
    self.lb_score.text = self.data_obj_matchinfo.score;
    
    
    //更新文本
    NSArray *array_str = [NSArray arrayWithObjects:@"A",@"O",@"B",@"1",@"2",@"3",@"4",@"5",@"6",@"0", nil];

    NSDictionary *dic = (NSDictionary*)sender;
    
    NSDictionary *data = [dic objectForKey:@"data"];
    
    
    
    NSArray *stats = [data objectForKey:@"stats"];
    
    
    
    
    for (NSDictionary *elem in stats)
    {
        
        NSString *name = [elem objectForKey:@"name"];
        NSNumber *count = [elem objectForKey:@"count"];
        
        
        NSInteger _index = [array_str indexOfObject:name];
        
        if (_index < 3)
        {
            UILabel * lable = [self.view_vsbg viewWithTag:_index+20];
            lable.text = [NSString stringWithFormat:@"已获得投票%@",count];
            lable.userData = count;
            
            
        }
        else
        {
            UILabel * lable = [self.view_bg viewWithTag:_index+20];
            lable.text = [NSString stringWithFormat:@"已获得投票%@",count];
            lable.userData = count;
        }
        
    }
    
    
    NSLog(@"%@",self.data_obj_matchinfo);
    
    //如果比赛结束, 则置灰
    BOOL bool_isFinish = [self.data_obj_matchinfo.finished boolValue];

    if (bool_isFinish) {
        for (UIButton *bt in self.array_bnts) {
            
            [bt setBackgroundColor:[UIColor grayColor]];
            [bt setEnabled:NO];
        }
    }
    
  
    //加载我的投票
    
    NSArray *myops = [data objectForKey:@"myops"];
    
    NSMutableArray *abc = [[NSMutableArray alloc] init];
    
    [abc addObjectsFromArray:myops];
    if ([myops count] == 0)
    {
        [abc addObject:@"A"];
        [abc addObject:@"4"];
        [abc addObject:@"6"];
//        return;
    
    }
    
    for (NSString *str_select in abc) {
        
            NSUInteger _index = [array_str indexOfObject:str_select];
        
        
        NSLog(@"------%ld",_index);
        
            [self updataBnt:_index];
        }
    
      
      //如果比赛结束，加载比赛结果

    if (bool_isFinish)
    {
     
        NSString *str_result = @"A";
        
        
        NSLog(@"scorea:%@",self.data_obj_matchinfo.scorea);
        NSLog(@"scorea:%@",self.data_obj_matchinfo.scoreb);
        NSLog(@"scorea:%@",self.data_obj_matchinfo.score);
        NSLog(@"scorea:%@",self.data_obj_matchinfo.goals);
        
        str_result = (self.data_obj_matchinfo.scorea = self.data_obj_matchinfo.scoreb)?@"O":str_result;
        str_result = (self.data_obj_matchinfo.scorea < self.data_obj_matchinfo.scoreb)?@"B":str_result;
        
        NSUInteger _index = [array_str indexOfObject:str_result];
        UIButton * button = [self.array_bnts objectAtIndex:_index];
        [button setBackgroundColor:[UIColor orangeColor]];
        
        int int_result = [self.data_obj_matchinfo.goals intValue];
        if (int_result != 0) {
            
            NSUInteger _index = [array_str indexOfObject:[NSString stringWithFormat:@"%d",int_result]];
            UIButton * button = [self.array_bnts objectAtIndex:_index];
            [button setBackgroundColor:[UIColor orangeColor]];

        }
        
    }
    
        
    
}


-(void)updateUIByUser:(NSString*)sender
{
    NSArray *array_str = [NSArray arrayWithObjects:@"A",@"O",@"B",@"1",@"2",@"3",@"4",@"5",@"6",@"0", nil];

    NSUInteger _index = [array_str indexOfObject:sender];

    ARLabel *lable = [self.array_lbs objectAtIndex:_index];
    lable.text = [NSString stringWithFormat:@"已获得投票%d",[lable.userData intValue]+ 1];

    
    
    [self updataBnt:_index];
    
    
}

-(void)updataBnt:(NSUInteger)index
{

    if (index<3)
    {
        for (int i = 0; i<3; i++)
        {
            UIButton * button = [self.array_bnts objectAtIndex:i];

            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button setBackgroundColor:[UIColor grayColor]];
            [button setEnabled:NO];
            if (index == i)
            {
                [button setBackgroundColor:[UIColor whiteColor]];
                
                NSLog(@"++++++++++%d",i);
            }
        }
        
        
    }
    if (index>=3 && index <9)
    {
        for (int i = 3; i<9; i++)
        {
            UIButton * button = [self.array_bnts objectAtIndex:i];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button setBackgroundColor:[UIColor grayColor]];
            [button setEnabled:NO];
            
            if (index == i)
            {
                [button setBackgroundColor:[UIColor whiteColor]];
                
                NSLog(@"++++++++++++%d",i);

            }
        }
    }
    
}

@end
