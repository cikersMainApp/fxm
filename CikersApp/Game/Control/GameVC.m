//
//  GameVC.m
//  CikersApp
//
//  Created by fxm on 15/12/31.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "GameVC.h"

@interface GameVC ()

@end

@implementation GameVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view_scrollow initUI];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)bnt_manager:(id)sender
{

    [self.drawer open];
    
}

-(IBAction)bnt_back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(IBAction)bnt_share
{

}
-(IBAction)bnt_manager
{

}
-(IBAction)bnt_publish
{

}

#pragma mark ----------------view’s layout behavior--------------------
- (BOOL)prefersStatusBarHidden{
    return NO;
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

#pragma mark ----------------ICSDrawerControllerPresenting--------------------
- (void)drawerControllerWillOpen:(ICSDrawerController *)drawerController{
    self.view.userInteractionEnabled = NO;
}

- (void)drawerControllerDidClose:(ICSDrawerController *)drawerController{
    self.view.userInteractionEnabled = YES;
}

@end
