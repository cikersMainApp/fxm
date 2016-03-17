//
//  MySettingTBView.m
//  CikersApp
//
//  Created by fxm on 16/2/27.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "MySettingTBView.h"
#import "MySettingAboutUs.h"
@interface MySettingTBView ()

@end

@implementation MySettingTBView

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    if (indexPath.section == 2) {
        [AppDelegate setLoginRoot];
    }
    
    if (indexPath.section == 1 && indexPath.row == 0) {
        [self removeCache];
    }
    
    if (indexPath.section == 1 && indexPath.row == 1) {
        MySettingAboutUs *aboutus = [[MySettingAboutUs alloc] init];
        [self.navigationController pushViewController:aboutus animated:YES];
    }
    
    
}
-(void)removeCache
{
    //===============清除缓存==============
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachePath];
    //    NSLog(@"文件数 ：%d",[files count]);
    for (NSString *p in files)
    {
        NSError *error;
        NSString *path = [cachePath stringByAppendingString:[NSString stringWithFormat:@"/%@",p]];
        if([[NSFileManager defaultManager] fileExistsAtPath:path])
        {
            [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
        }
    }
}
@end
