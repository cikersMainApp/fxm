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
    // Do any additional setup after loading the view.

    self.wikiModel = [[WikiViewModel alloc] init];

    self.wikiModel.dataSource = [[NSMutableArray alloc] init];

    
    
    self.mainTableView.dataSource = self.wikiModel;
    self.mainTableView.delegate = self.wikiModel;
    self.wikiModel.tableView = self.mainTableView;
    
    [self.wikiModel initData];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
