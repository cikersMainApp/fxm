//
//  MyFollowList.m
//  CikersApp
//
//  Created by fxm on 16/2/29.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "MyFollowList.h"
#import "NSUserDefaults+RMSaveCustomObject.h"
@interface MyFollowList ()
@property (nonatomic, strong) NSMutableArray *controllers;

@end

@implementation MyFollowList




- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的关注";
    
    _array_status = [[NSMutableArray alloc] initWithObjects:@"1",@"0",@"0",@"0", nil];

    
    
    NSArray *segmentedArray = [[NSArray alloc]initWithObjects:@"关注球员",@"关注球队",@"关注赛事",@"粉丝",nil];
    //初始化UISegmentedControl
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedArray];
    segmentedControl.frame = CGRectMake(0, 64, ScreenWidth, 60);
    segmentedControl.selectedSegmentIndex = 0;//设置默认选择项索引
    segmentedControl.tintColor = COLOR_GRAY;
    [segmentedControl addTarget:self action:@selector(seg_action:) forControlEvents:UIControlEventValueChanged];
    
    
    [self.view addSubview:segmentedControl];
//
//    _view_content = [[MyFollowContent alloc] initWithFrame:CGRectMake(0, 124, ScreenWidth, ScreenHeight - 124) style:UITableViewStylePlain];
//    [self.view addSubview:_view_content];
    
    _data_user = [[NSUserDefaults standardUserDefaults] rm_customObjectForKey:@"user"];
    
    _operation = [[UserinfoModel alloc] initWithDelegate:nil needCommonProcess:NO];
    _operation.delegate = self;
    [_operation sendFollowByid:_data_user.entityId type:0];
    
    
    
    _controllers = [NSMutableArray array];
    
    for (int i = 0; i<4; i++) {
        
        MyFollowContent *tempview = [[MyFollowContent alloc] initWithFrame:CGRectMake(0, 124, ScreenWidth, ScreenHeight-124) style:UITableViewStylePlain];
        [_controllers addObject:tempview];
        
    }
    
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 124, ScreenWidth, ScreenHeight-124)];
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.bounces = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    
    [_controllers enumerateObjectsUsingBlock:^(MyFollowContent  * VC , NSUInteger index, BOOL * stop) {
        VC.frame = CGRectMake(index * _scrollView.frame.size.width, 0, _scrollView.frame.size.width, _scrollView.frame.size.height);
        [_scrollView addSubview:VC];
    }];
    _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width * _controllers.count, _scrollView.frame.size.height);
    [self.view addSubview:_scrollView];

    
    self.blok =  ^(NSInteger index)
    {
        [segmentedControl setSelectedSegmentIndex:index];
    };
    
}

- (void)scrollViewIndex:(NSInteger)index {
    CGPoint scrollOfSet = CGPointMake(index * _scrollView.frame.size.width, 0);
    [_scrollView setContentOffset:scrollOfSet animated:YES];
}

#pragma mark UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    _scrollView.scrollEnabled = YES;
    NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
    if (self.blok) {
        self.blok(index);
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    _scrollView.scrollEnabled = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)seg_action:(UISegmentedControl*)seg
{
//    if ([[_array_status objectAtIndex:seg.selectedSegmentIndex] isEqualToString:@"1"]) {
//        return;
//    }
    
    [_array_status replaceObjectAtIndex:seg.selectedSegmentIndex withObject:@"1"];
    
    
    _view_content.type_follow = seg.selectedSegmentIndex;
 
    
    [self scrollViewIndex:seg.selectedSegmentIndex];
    
//    [_operation sendFollowByid:_data_user.entityId type:seg.selectedSegmentIndex];
}

@end
