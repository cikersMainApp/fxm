//
//  FollowVC.m
//  CikersApp
//
//  Created by fxm on 15/12/20.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "FollowVC.h"
#import "AppDelegate.h"
#import "Api.h"
#import "FollowTableCell.h"
@interface FollowVC ()<BaseApiDelegate,UITableViewDataSource,UITableViewDelegate>

@end

@implementation FollowVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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

-(IBAction)bnt_follow
{

//    [APSProgress showIndicatorView];
    
    [AppDelegate setTabRoot];
    
}
-(IBAction)bnt_switch:(UIButton*)sender
{

    
    [sender setBackgroundImage:[UIImage imageNamed:@"button_select"] forState:UIControlStateNormal];
    
}


- (void)finishedWithRequest:(HttpRequest *)request
                   Response:(HttpResponse *)response
                   AndError:(NSError *)error
{

//    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:response.responseData options:NSJSONReadingAllowFragments error:nil];

    [AppDelegate setTabRoot];

    
}
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString  *CellIdentiferId = @"cell";
    FollowTableCell  *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentiferId];

    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
