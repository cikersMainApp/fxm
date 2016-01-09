//
//  CreatTeamIconVC.m
//  CikersApp
//
//  Created by fxm on 15/12/21.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "CreatTeamIconVC.h"
#import "CreatTeam.h"
@interface CreatTeamIconVC ()

@end

@implementation CreatTeamIconVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self initUI];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initUI
{

    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight - 64)];
    [self.view addSubview:scroll];
    
    UIView *view_content = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 700)];
    
    [scroll addSubview:view_content];
    
    float b_width = (ScreenWidth - 30 - 30 - 15 - 15)/3.0f;

    
    

    
    for (int i = 0; i< 6; i++)
    {
        
        int w = i;
        
        if (i>=3) {
            w = i - 3;
        }
        
        UIButton *bt = [[UIButton alloc] initWithFrame:CGRectMake(30+w*(b_width+15), 100 + (i/3)*100, b_width, b_width)];
        
        [bt setTag:i+1];
        [bt setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d",i+1]] forState:UIControlStateNormal];
        [bt addTarget:self action:@selector(bnt_select:) forControlEvents:UIControlEventTouchUpInside];
        [view_content addSubview:bt];
        [bt.layer setMasksToBounds:YES];
        [bt.layer setCornerRadius:10.0f];
        [bt.layer setBorderWidth:1.0];
        
    }

    [scroll setContentSize:CGSizeMake(ScreenWidth, view_content.frame.size.height)];
    
    
}

-(void)bnt_select:(id)sender
{

    UIButton *bt = (UIButton*)sender;
    
    NSLog(@"%ld",bt.tag);
    
    
    //此页面已经存在于self.navigationController.viewControllers中,并且是当前页面的前一页面
    
    CreatTeam
    *setPrizeVC = [self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count-2];
    
    //初始化其属性
    
    setPrizeVC.selectIcon
    = nil;
    
    //传递参数过去
    
    setPrizeVC.selectIcon = [NSString stringWithFormat:@"%ld",bt.tag];
    
    //使用popToViewController返回并传值到上一页面
    
    [self.navigationController
     popToViewController:setPrizeVC animated:true];
        
}

@end
