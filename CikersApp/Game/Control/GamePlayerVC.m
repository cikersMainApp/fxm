//
//  GamePlayerVC.m
//  CikersApp
//
//  Created by fxm on 16/1/13.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "GamePlayerVC.h"
#import "View+Bt+Image.h"
#import "TounamentPlayerCell.h"
@interface GamePlayerVC ()

@end

@implementation GamePlayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"球员榜";
    
    self.opration = [[GameModel alloc] init];
    self.opration.delegate = self;
    [self.tableView registerClass:[TounamentPlayerCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView registerClass:[TounamentPlayerRankCell class] forCellReuseIdentifier:@"cellrank"];


}

-(void)dataPlayer_scuess:(id)dic
{

}

/*
 1 切换数据
 2 切换文本条上的文字
 */
-(void)seg_click:(UISegmentedControl*)segitem
{
    if(_num_curIndex == segitem.selectedSegmentIndex)
        return;
    
    _num_curIndex = segitem.selectedSegmentIndex;
    
    switch (segitem.selectedSegmentIndex) {
        case 0:
        {
            _lb_1.hidden = NO;
            _lb_2.center = CGPointMake(235, 15);
            _lb_2.text = @"球队";
        _lb_3.text = @"进球";
        }
            break;
        case 1:
        {
            _lb_1.hidden = YES;
            _lb_2.center = CGPointMake(ScreenWidth - 100, 15);
            _lb_2.text = @"红牌";
        _lb_3.text = @"黄牌";
        }
            break;
        default:
            break;
    }
    
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(UIView*)creat_headerView
{

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 80)];
    
    _seg = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"射手榜",@"红黄牌榜",nil]];
    [_seg addTarget:self action:@selector(seg_click:) forControlEvents:UIControlEventValueChanged];
    [_seg setFrame:CGRectMake(0, 0, ScreenWidth, 40)];
    [_seg setSelectedSegmentIndex:0];
    [view addSubview:_seg];
    
    UIView *view_titlebg = [[UIView alloc] initWithFrame:CGRectMake(0, 50, ScreenWidth, 30)];
    view_titlebg.backgroundColor = COLOR_GRAY;
    
    [view addSubview:view_titlebg];
    
    _num_curIndex = 0;
    
    
    _lb_1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 70, 30)];
    _lb_1.text = @"姓名";
    [view_titlebg addSubview:_lb_1];
    
    _lb_2 = [[UILabel alloc] initWithFrame:CGRectMake(150, 0, 70, 30)];
    _lb_2.text = @"球队";
    [view_titlebg addSubview:_lb_2];
    
    _lb_3 = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth - 60, 1, 50, view_titlebg.frame.size.height)];
    _lb_3.text = @"进球";
    [view_titlebg addSubview:_lb_3];
    

    
    return view;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
-(nullable UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (!self.view_header) {
        self.view_header = [self creat_headerView];
    }

    return self.view_header;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 70;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UITableViewCell *cell;
    
    switch (_seg.selectedSegmentIndex) {
        case 0:
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
            
            if (!cell) {
                cell = [[TounamentPlayerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            }
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            [(TounamentPlayerCell *)cell updateUI:nil];

        }
            break;
        case 1:
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"cellrank"];
            
            if (!cell) {
                cell = [[TounamentPlayerRankCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellrank"];
            }
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            ((TounamentPlayerRankCell *)cell).num_tag= indexPath.row;
            [(TounamentPlayerRankCell *)cell updateUI:nil];

        }
            break;
        default:
            break;
    }
    
    
    
    
    
    return cell;
}

@end
