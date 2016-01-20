//
//  MessageInfoTBVC.m
//  CikersApp
//
//  Created by fxm on 16/1/2.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "MessageInfoTBVC.h"
#import "MessageVC.h"
#import "MessageCell.h"
@interface MessageInfoTBVC ()

@end

@implementation MessageInfoTBVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    NSArray *views = self.navigationController.viewControllers;
    
    for (UIViewController *vc in views) {
        
        NSLog(@"%@",[vc restorationClass]);
        
    }
    
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    
    CGRect bar = self.navigationController.navigationBar.frame;
    
    
    NSLog(@"width :%f",rectStatus.size.width);
    NSLog(@"height :%f",rectStatus.size.height);
    NSLog(@"width :%f",bar.size.width);
    NSLog(@"height :%f",bar.size.height);
    
    NSArray *array_temp =self.navigationController.viewControllers;
    
    for (UIViewController *vc in array_temp) {
        if ([vc isKindOfClass:[MessageVC class]])
        {
            ((MessageVC*)vc).str_updateCount = @"";
            ((MessageVC*)vc).num_selectTag = self.num_selectCellTag;
        }
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CELL_NORMAL_HEIGHT;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString  *CellIdentiferId = @"cell";
    
    MessageCell  *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentiferId];
    
    //添加向右箭头
    
    cell.imageView.image = [UIImage imageNamed:@"bnt_rankbyplayer"];
    cell.textLabel.text =@"我是标题";
    cell.detailTextLabel.text = @"您有10个新消息我在测试这个文本的内容能有多长，到底有多长呢，我再试试";

    UILabel *lb_time = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth - 105, 0, 100, 30)];
    lb_time.textAlignment = NSTextAlignmentRight;
    lb_time.textAlignment = NSTextAlignmentCenter;
    lb_time.font = [UIFont systemFontOfSize:10];
    lb_time.text = @"2015-01-12 13::00";
    [cell addSubview:lb_time];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
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
