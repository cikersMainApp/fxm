//
//  TeamMainVC.m
//  CikersApp
//
//  Created by fxm on 15/12/20.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "TeamMainVC.h"
#import "TeamPlayerVC.h"
@interface TeamMainVC ()

@end

@implementation TeamMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 
    [self initData];
}

-(void)initData
{

    _opration = [[TeamModel alloc] initWithDelegate:nil needCommonProcess:NO];
    _opration.delegate = self;

    [_opration sendInfo:_data_obj_info.id];
    [_opration sendTags:_data_obj_info.id];
    [_cell_1 updateInfo:_data_obj_info];

    
}

-(void)dataInfo_scuess:(id)dic
{
    _data_obj_info = (DicTeaminfo*)dic;
    
    NSLog(@"name:%@",_data_obj_info.cnname);
    
    [_cell_1 updateInfo:_data_obj_info];
    
}

-(void)dataTags_scuess:(id)dic
{
    [_cell_2 updateTag:(NSArray*)dic];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)bnt_publish
{

}

-(IBAction)bnt_back
{

    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(IBAction)bnt_share
{

//    [self shareSNS];
    
}
-(IBAction)bnt_manager
{

    [self.drawer open];

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    id nextvc = segue.destinationViewController;
    [nextvc setValue:_data_obj_info.id forKey:@"num_teamid"];
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
