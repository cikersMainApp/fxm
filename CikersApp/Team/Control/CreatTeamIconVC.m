//
//  CreatTeamIconVC.m
//  CikersApp
//
//  Created by fxm on 15/12/21.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "CreatTeamIconVC.h"

@interface CreatTeamIconVC ()

@end

@implementation CreatTeamIconVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self initUI];
    
    NSArray* constrains2 = self.view.constraints;
    for (NSLayoutConstraint* constraint in constrains2) {
        if (constraint.secondItem == self. view_1) {
            //据底部0
            if (constraint.firstAttribute == NSLayoutAttributeHeight) {
                constraint.constant = 600.0;
                
            }
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initUI
{

    float width = self.view_content.frame.size.width;
    float height= self.view_content.frame.size.height;
    
    for (int y = 1; y<7; y++)
    {
        
        
        
        for (int x = 1; x<4; x++) {
            
            UIButton *bt = [[UIButton alloc] initWithFrame:CGRectMake( 50, 100,100 ,100)];

            [bt setBackgroundImage:[UIImage imageNamed:@"cover_01"] forState:UIControlStateNormal];
            [bt setTag:y*10+x];
            [self.view_content addSubview:bt];
            [bt addTarget:self action:@selector(bnt_select:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    
    
}

-(void)bnt_select:(id)sender
{

    UIButton *bt = (UIButton*)sender;
    
    NSLog(@"%ld",bt.tag);
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
