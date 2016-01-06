//
//  TeamMainVC.m
//  CikersApp
//
//  Created by fxm on 15/12/20.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "TeamMainVC.h"
#import "CreatTeam.h"
@interface TeamMainVC ()

@end

@implementation TeamMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view_scrollow initUI];
    
    
//    self.view_left.hidden = YES;
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)bnt_publish
{
    CreatTeam *nextvc = [[UIStoryboard storyboardWithName:@"TeamCreat" bundle:nil] instantiateViewControllerWithIdentifier:@"teamcreat"];
    
    [[DataSingleton Instance].curVC showViewController:nextvc sender:nil];
}

-(IBAction)bnt_back
{

    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(IBAction)bnt_share
{

    [self shareSNS];
    
}
-(IBAction)bnt_manager
{

    [self.drawer open];

    
//    [self.view_left setFrame:CGRectMake(0, 0, self.view_left.frame.size.width, self.view_left.frame.size.height)];
    
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    self.tempTableView = tableView;
    return 94.f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString  *CellIdentiferId = @"HLCommonUsedCell";
    UITableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentiferId];
    if (cell == nil) {
        
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentiferId];
        
    }
    
    
    cell.textLabel.text=@"球队名";
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark -
#pragma mark Left


-(IBAction)bnt_join:(id)sender
{

}
-(IBAction)bnt_creat:(id)sender
{

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
