//
//  TeamBaseVC.m
//  CikersApp
//
//  Created by fxm on 16/1/20.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "TeamBaseVC.h"

@interface TeamBaseVC ()

@end

@implementation TeamBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //添加分享、管理按钮
    UIBarButtonItem *shareItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action: @selector(bnt_share)];
    
    UIBarButtonItem *cameraItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action: @selector(bnt_manager)];
    NSArray *itemsArr = @[shareItem,cameraItem];
    
    self.navigationItem.rightBarButtonItems = itemsArr;
    
    
}
-(void)bnt_share
{
    
}
-(void)bnt_manager
{
    
    [self open];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
