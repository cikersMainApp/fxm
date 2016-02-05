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
#import "HLNavgationController.h"
#import "VOSegmentedControl.h"

@interface WikiMainVC ()

@end

@implementation WikiMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    VOSegmentedControl *segctrl1 = [[VOSegmentedControl alloc] initWithSegments:@[@{VOSegmentText: @"推荐"},
                                                                                  @{VOSegmentText: @"圈子"},
                                                                                  @{VOSegmentText: @"专区"}]];
    segctrl1.contentStyle = VOContentStyleTextAlone;
    segctrl1.indicatorStyle = VOSegCtrlnon;
    segctrl1.textColor = [UIColor whiteColor];
    segctrl1.selectedTextColor = [UIColor orangeColor];
    segctrl1.backgroundColor = [UIColor clearColor];
    segctrl1.selectedBackgroundColor = segctrl1.backgroundColor;
    segctrl1.allowNoSelection = NO;
    segctrl1.frame = CGRectMake(10, 100, ScreenWidth/2, 44);
    [segctrl1 setCenter:CGPointMake(ScreenWidth/2, 20)];

    segctrl1.indicatorThickness = 4;
    segctrl1.tag = 1;
    [self.navigationController.navigationBar addSubview:segctrl1];
    [segctrl1 setIndexChangeBlock:^(NSInteger index) {
        NSLog(@"1: block --> %@", @(index));
    }];
    [segctrl1 addTarget:self action:@selector(segment_action:) forControlEvents:UIControlEventValueChanged];
    

    
    
//    self.view_content = [[UIView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight-64)];
//    [self.view addSubview:self.view_content];
//    
//    self.table_list = [[WikiListTabview alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 64)];
//    [self.view_content addSubview:self.table_list];
//
//    
//    
//    
//    self.view_follow  = [[UIStoryboard storyboardWithName:@"Login" bundle:nil] instantiateViewControllerWithIdentifier:@"select"];
//    [self.view_content addSubview:self.view_follow.view];
//
//    self.table_list.hidden = NO;
//    self.view_follow.view.hidden = YES;
//    
//    // Do any additional setup after loading the view.
//
//    self.wikiModel = [[WikiViewModel alloc] init];
//
//    self.wikiModel.dataSource = [[NSMutableArray alloc] init];
//
//    
//    self.wikiModel.cellTypeNews = YES;
//    self.table_list.dataSource = self.wikiModel;
//    self.table_list.delegate = self.wikiModel;
//    self.wikiModel.tableView = self.table_list;
//    
//    [self.wikiModel initData];

}

-(void)viewWillAppear:(BOOL)animated
{

//    [self.navigationController setNavigationBarHidden:YES animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)segment_action:(VOSegmentedControl*)sender
{

    switch (sender.selectedSegmentIndex) {
        case 0:
        {
            self.table_list.hidden = NO;
            self.view_follow.view.hidden = YES;
            self.wikiModel.cellTypeNews = YES;
            [self.table_list reloadData];

        }
            break;
        case 1:
        {
            self.table_list.hidden = NO;
            self.view_follow.view.hidden = YES;
            self.wikiModel.cellTypeNews = NO;
            [self.table_list reloadData];

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
