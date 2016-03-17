//
//  MySettingPassword.m
//  CikersApp
//
//  Created by fxm on 16/2/28.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "MySettingPassword.h"
#import "NSUserDefaults+RMSaveCustomObject.h"
@interface MySettingPassword ()

@end

@implementation MySettingPassword

- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.navigationItem.title = @"修改账号信息";
    
    _data_userinfo = [[NSUserDefaults standardUserDefaults] rm_customObjectForKey:@"user"];
    
    _lb_name.text = _data_userinfo.username;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.section == 1) {
        
        
        
    }
    
}

@end
