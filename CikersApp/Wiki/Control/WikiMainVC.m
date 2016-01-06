//
//  WikiMainVC.m
//  CikersApp
//
//  Created by fxm on 15/12/23.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "WikiMainVC.h"
#import "WikiViewModel.h"
#import "MJRefresh.h"
#import "UIScrollView+MJExtension.h"
#import "UIScrollView+MJRefresh.h"
@interface WikiMainVC ()

@end

@implementation WikiMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.seg_topbnt = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"推荐",@"圈子",@"专区", nil]];
    
    [self.seg_topbnt setFrame:CGRectMake(0, 20, ScreenWidth, 44)];
    
    self.seg_topbnt.selectedSegmentIndex = 0;
    
    [self.seg_topbnt addTarget:self action:@selector(segment_action:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:self.seg_topbnt];
    
    
    self.view_content = [[UIView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight-64)];
    [self.view addSubview:self.view_content];
    
    self.table_list = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 64)];
    [self.view_content addSubview:self.table_list];
    
    
    self.view_follow  = [[UIStoryboard storyboardWithName:@"Login" bundle:nil] instantiateViewControllerWithIdentifier:@"select"];
    [self.view_content addSubview:self.view_follow.view];
    
    self.table_list.hidden = NO;
    self.view_follow.view.hidden = YES;
    
    // Do any additional setup after loading the view.

    self.wikiModel = [[WikiViewModel alloc] init];

    self.wikiModel.dataSource = [[NSMutableArray alloc] init];

    
    
    self.table_list.dataSource = self.wikiModel;
    self.table_list.delegate = self.wikiModel;
    self.wikiModel.tableView = self.table_list;
    
    [self.wikiModel initData];

}

-(void)viewWillAppear:(BOOL)animated
{

    [self.navigationController setNavigationBarHidden:YES animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)segment_action:(UISegmentedControl*)sender
{

    switch (sender.tag) {
        case 0:
        {
            self.table_list.hidden = NO;
            self.view_follow.view.hidden = YES;
        }
            break;
        case 1:
        {
            self.table_list.hidden = NO;
            self.view_follow.view.hidden = YES;
        }
            break;
        case 2:
        {
            self.table_list.hidden = YES;
            self.view_follow.view.hidden = NO;
        }
            break;
        default:
            break;
    }
    
}

@end
