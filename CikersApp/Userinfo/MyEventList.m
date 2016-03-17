//
//  MyEventList.m
//  CikersApp
//
//  Created by fxm on 16/2/29.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "MyEventList.h"
#import "UITableView+SDAutoTableViewCellHeight.h"
#import "UIView+SDAutoLayout.h"

#import "AFNetworking.h"
#import "MJRefresh.h"
#import "MJExtension.h"
#import "XYString.h"
#import "DicWikiInfo.h"


#import "FDCalendar.h"


@interface MyEventList ()

@end

@implementation MyEventList

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = YES;
    
    FDCalendar *calendar = [[FDCalendar alloc] initWithCurrentDate:[NSDate date]];
    CGRect frame = calendar.frame;
    frame.origin.y = 60;
    calendar.frame = frame;
    
    
    [self.view addSubview:self.view_circle];
    
    [self.view addSubview:calendar];

    _view_circle.nextvc = self;
    self.view_circle.sd_layout
    .topSpaceToView(self.view,ScreenHeight-calendar.frame.size.height)
    .rightSpaceToView(self.view,0)
    .leftSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,0);

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - getter
-(UITableView *)view_circle
{
    if (!_view_circle) {
        
        _view_circle = [[WikiCircleTableview alloc] initWithFrame:self.view.bounds];
        
    }
    return _view_circle;
    
}


@end
