//
//  GameSingUpVC.m
//  CikersApp
//
//  Created by fxm on 16/1/15.
//  Copyright © 2016年 cikers. All rights reserved.
//


#define HEIGHT_FOOTER 50

#import "GameSingUpVC.h"


@interface GameSingUpVC ()

@end

@implementation GameSingUpVC

const int section_count[] = {1,3,6,4};
const char* rowTitle[][6] = {{"个人照片"},{"姓名","手机","邮箱"},{"性别","身高","体重","生日","所在地","个性宣言"},{"身份证号","身份证照片","学生证号","学生证照片"}};

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationItem.title = @"完善个人信息";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


-(NSString*)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    NSString *str = @"";
    
    str = (section == 2)?@"赛客体育承诺为用户保密,以下信息仅主办方可见":str;
    

    return str;
}

-(void)tableView:(UITableView *)tableView didEndDisplayingFooterView:(UIView *)view forSection:(NSInteger)section
{

    UITableViewHeaderFooterView *footer = (UITableViewHeaderFooterView *)view;
    [footer.textLabel.font fontWithSize:12];
    
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
return @"";
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    CGFloat num_h = 20;
    
    num_h = (section == 2)?55:num_h;

    return num_h;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CGFloat num_h = 44;
    
    // 第一行
    num_h = (indexPath.section == 0)?100:num_h;
    
    // 第四行
    if (indexPath.section == 3)
    {
        num_h = (indexPath.row == 0 || indexPath.row == 2)?100:num_h;
    }
    
    return num_h;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return section_count[section];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [NSString stringWithUTF8String:rowTitle[indexPath.section][indexPath.row]];
    
    return cell;
}
- (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
