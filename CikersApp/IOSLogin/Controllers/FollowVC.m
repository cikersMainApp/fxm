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
#import "NSUserDefaults+RMSaveCustomObject.h"
@interface FollowVC ()<BaseApiDelegate,UITableViewDataSource,UITableViewDelegate>

@end

@implementation FollowVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    WIkiModel *wk = [[WIkiModel alloc] initWithDelegate:self needCommonProcess:NO];
    wk.delegate = self;
    [wk sendZhuanqu];
    
    
    _data_obj_left = [NSMutableArray array];
    _data_obj_right= [NSMutableArray array];
    
    _data_userinfo = [[NSUserDefaults standardUserDefaults] rm_customObjectForKey:@"user"];
}

-(void)data_scuess:(NSMutableArray *)dic
{

    for (int i = 0; i<[dic count]; i++) {
        
        [_data_obj_left addObject:[dic objectAtIndex:i]];
        
        if (i+1 != [dic count]) {
            [_data_obj_right addObject:[dic objectAtIndex:i+1]];
        }
        else
        {
            [_data_obj_right addObject:[DicPlayerinfo new]];
        }
        
        
        i++;
        _num_tableviewcount ++ ;
    }
    
    [_table_view reloadData];
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
    
}
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _num_tableviewcount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString  *CellIdentiferId = @"cell";
    
    FollowTableCell  *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentiferId];
    
    [cell cell_update:[_data_obj_left objectAtIndex:indexPath.row] right:[_data_obj_right objectAtIndex:indexPath.row] userinfo:_data_userinfo];
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
