//
//  MyFollowContent.m
//  CikersApp
//
//  Created by fxm on 16/3/1.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "MyFollowContent.h"

@implementation MyFollowContent

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{

    if (self = [super initWithFrame:frame style:style]) {
                
        self.dataSource = self;
        self.delegate = self;
    }
    
    return self;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    
    switch (_type_follow) {
        case FOLLOW_PLAYER:
        {
        }
            break;
        case FOLLOW_TEAM:
        {
        
        }
            break;
        case FOLLOW_TOURNAME:
        {
        
        }
            break;
        case FOLLOW_USER:
        {
        
        }
            break;
        default:
            break;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    
    cell.textLabel.text = @"123";
    
    
    return cell;
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CELL_NORMAL_HEIGHT;
}



@end
