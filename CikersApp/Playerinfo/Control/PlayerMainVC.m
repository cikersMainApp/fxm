//
//  PlayerMainVC.m
//  CikersApp
//
//  Created by fxm on 16/1/20.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "PlayerMainVC.h"

@interface PlayerMainVC ()

@end

@implementation PlayerMainVC

- (void)viewDidLoad {
    [super viewDidLoad];

     [self initData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initData
{
    _opration = [[PlayerModel alloc] initWithDelegate:nil needCommonProcess:NO];
    _opration.delegate = self;
    
    [_opration sendInfoByid:_num_id];
    [_opration sendTagsByid:_num_id];
    
}

-(void)datainfo_scuess:(id)dic
{

    [_cell_contentview_1 updateInfo:(DicPlayerinfo *)dic];
    
}
-(void)dataTags_scuess:(id)dic
{
    [_cell_contentview_2 updateTag:(NSArray *)dic];
}

#pragma mark -
#pragma mark openDeaw

/**
 *  openDeaw注册事件
 */
- (void)openDrawer:(UIButton *)button{
    [self.drawer open];
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
