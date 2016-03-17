//
//  MainWikiVC.m
//  CikersApp
//
//  Created by fxm on 16/1/27.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "MainWikiVC.h"
#import "UITableView+SDAutoTableViewCellHeight.h"
#import "UIView+SDAutoLayout.h"
#import "AFNetworking.h"
#import "MJRefresh.h"
#import "MJExtension.h"
#import "XYString.h"

#import "ThreeBaseCell.h"
#import "ThreeFirstCell.h"
#import "ThreeSecondCell.h"
#import "ThreeThirdCell.h"
#import "ThreeFourthCell.h"


#import "DicWikiInfo.h"
#import "RMMapper.h"

#import "WikiInfoMessage.h"
#import "WikiInfoTableVC.h"

#import "WikiWebVC.h"

@interface MainWikiVC ()<UITableViewDelegate, UITableViewDataSource,UIScrollViewDelegate>
{
    MJRefreshComponent *myRefreshView;
    NSInteger page;
}
@property(nonatomic ,strong) UITableView *view_recommand;
@property(nonatomic ,strong) NSMutableArray *listArry;
@property(nonatomic,strong)NSMutableArray *controllers;
@end

@implementation MainWikiVC


-(void)viewDidAppear:(BOOL)animated
{

    if (_seg_ment) {
        _seg_ment.hidden = NO;
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = YES;
    

//    _controllers = [NSMutableArray array];
//    
//    [_controllers addObject:self.view_recommand];
//    
//    
//    
//    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 124, ScreenWidth, ScreenHeight-124)];
//    _scrollView.showsVerticalScrollIndicator = NO;
//    _scrollView.showsHorizontalScrollIndicator = NO;
//    _scrollView.bounces = NO;
//    _scrollView.pagingEnabled = YES;
//    _scrollView.delegate = self;
//    
//    self.view_recommand.frame = CGRectMake(0, 0, ScreenWidth, _scrollView.frame.size.height);
//    self.view_circle.frame = CGRectMake(0, 0, ScreenWidth, _scrollView.frame.size.height);
//    self.view_follow.view.frame = CGRectMake(0, 0, ScreenWidth, _scrollView.frame.size.height);
//    
//    [_scrollView addSubview:_view_recommand];
//    [_scrollView addSubview:_view_circle];
//    [_scrollView addSubview:_view_follow.view];
//    
//    
//
//    _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width * _controllers.count, _scrollView.frame.size.height);
//    [self.view addSubview:_scrollView];
    

    
    [self.view addSubview:self.view_recommand];
    self.view_recommand.sd_layout.spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));
    
    [self.view addSubview:self.view_circle];
    _view_circle.nextvc = self;
    self.view_circle.sd_layout
    .topSpaceToView(self.view,64)
    .rightSpaceToView(self.view,0)
    .leftSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,0);
    _view_circle.hidden = YES;
    
    
    
    self.view_follow  = [[UIStoryboard storyboardWithName:@"Login" bundle:nil] instantiateViewControllerWithIdentifier:@"select"];
    [self.view addSubview:self.view_follow.view];
    self.view_follow.view.hidden = YES;

    
    _seg_ment = [[VOSegmentedControl alloc] initWithSegments:@[@{VOSegmentText: @"推荐"},
                                                                                  @{VOSegmentText: @"圈子"},
                                                                                  @{VOSegmentText: @"专区"}]];
    _seg_ment.contentStyle = VOContentStyleTextAlone;
    _seg_ment.indicatorStyle = VOSegCtrlnon;
    _seg_ment.textColor = [UIColor whiteColor];
    _seg_ment.selectedTextColor = [UIColor orangeColor];
    _seg_ment.backgroundColor = [UIColor clearColor];
    _seg_ment.selectedBackgroundColor = _seg_ment.backgroundColor;
    _seg_ment.allowNoSelection = NO;
    _seg_ment.frame = CGRectMake(10, 100, ScreenWidth/2, 44);
    [_seg_ment setCenter:CGPointMake(ScreenWidth/2, 20)];
    
    _seg_ment.indicatorThickness = 4;
    _seg_ment.tag = 1;
    [self.navigationController.navigationBar addSubview:_seg_ment];
    [_seg_ment setIndexChangeBlock:^(NSInteger index) {
        NSLog(@"1: block --> %@", @(index));
    }];
    [_seg_ment addTarget:self action:@selector(segment_action:) forControlEvents:UIControlEventValueChanged];
    

    
}
-(void)segment_action:(VOSegmentedControl*)sender
{
    
    switch (sender.selectedSegmentIndex) {
        case 0:
        {
            self.view_recommand.hidden = NO;
            self.view_circle.hidden = YES;
            self.view_follow.view.hidden = YES;
          
        }
            break;
        case 1:
        {
            self.view_recommand.hidden = YES;
            self.view_circle.hidden = NO;
            self.view_follow.view.hidden = YES;
           
        }
            break;
        case 2:
        {
            self.view_recommand.hidden = YES;
            self.view_circle.hidden = YES;
            self.view_follow.view.hidden = NO;
        }
            break;
        default:
            break;
    }
    
}


#pragma mark - getter

-(WikiFollowVC*)view_follow
{

    if (!_view_follow) {
        
        _view_follow = [[WikiFollowVC alloc] init];
    }
    
    return _view_follow;
}

-(UITableView *)view_circle
{
    if (!_view_circle) {
        
        _view_circle = [[WikiCircleTableview alloc] initWithFrame:self.view.bounds];
        
    }
    return _view_circle;

}

- (UITableView *)view_recommand{
    
    if (!_view_recommand) {
        
        _view_recommand = [[UITableView alloc] initWithFrame:self.view.bounds];
        _view_recommand.separatorColor = [UIColor clearColor];
        _view_recommand.delegate = self;
        _view_recommand.dataSource = self;
        
        //..下拉刷新
        _view_recommand.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            page = 0;
            myRefreshView = _view_recommand.mj_header;
            [self loadData];
        }];
        // 马上进入刷新状态
        [_view_recommand.mj_header beginRefreshing];
        
        //..上拉刷新
        _view_recommand.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            page = page + 1;
            myRefreshView = _view_recommand.mj_footer;
            [self loadData];
        }];
        _view_recommand.mj_footer.hidden = YES;
        
        
    }
    return _view_recommand;
}

-(NSMutableArray *)listArry{
    
    if (!_listArry) {
        _listArry = [[NSMutableArray alloc] init];
    }
    return _listArry;
}

#pragma mark - 请求数据
-(void)loadData{
    NSString * urlString = [NSString stringWithFormat:@"%@wiki/listrecommand?limit=30&offset=%ld",HOST,page*30];
    NSLog(@"______%@",urlString);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dict = [XYString getObjectFromJsonString:operation.responseString];
        //..keyEnumerator 获取字典里面所有键  objectEnumerator得到里面的对象  keyEnumerator得到里面的键值
//        NSString *key = [dict.keyEnumerator nextObject];//.取键值
        NSArray *temArray = [dict objectForKey:@"data"];
        
        // 数组>>model数组
        NSMutableArray *arrayM = [NSMutableArray arrayWithArray:[DicWikiInfo mj_objectArrayWithKeyValuesArray:temArray]];
        
        //..下拉刷新
        if (myRefreshView == _view_recommand.mj_header) {
            self.listArry = arrayM;
            _view_recommand.mj_footer.hidden = self.listArry.count==0?YES:NO;
            
        }else if(myRefreshView == _view_recommand.mj_footer){
            [self.listArry addObjectsFromArray:arrayM];
        }
        
        
        [self doneWithView:myRefreshView];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"请求失败");
        [myRefreshView endRefreshing];
    }];
}

#pragma mark -  回调刷新
-(void)doneWithView:(MJRefreshComponent*)refreshView{
    [_view_recommand reloadData];
    [myRefreshView  endRefreshing];
}


#pragma mark - 表的协议方法

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.listArry.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ThreeBaseCell * cell = nil;
    DicWikiInfo * threeModel = self.listArry[indexPath.row];
    
    NSString * identifier = [ThreeBaseCell cellIdentifierForRow:threeModel];
    Class mClass =  NSClassFromString(identifier);
    
    cell =  [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[mClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.threeModel = threeModel;
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // cell自适应设置
    DicWikiInfo * threeModel = self.listArry[indexPath.row];
    [threeModel parseExtra];
    NSString * identifier = [ThreeBaseCell cellIdentifierForRow:threeModel];
    Class mClass =  NSClassFromString(identifier);
    
    // 返回计算出的cell高度（普通简化版方法，同样只需一步设置即可完成）
    return [self.view_recommand cellHeightForIndexPath:indexPath model:threeModel keyPath:@"threeModel" cellClass:mClass contentViewWidth:[self cellContentViewWith]];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    [WikiInfoTableVC pushInfoTableViewVC:0];

    _seg_ment.hidden = YES;
    
    DicWikiInfo * model = self.listArry[indexPath.row];

    WikiInfoMessage *nextvc = [[WikiInfoMessage alloc] init];
    nextvc.data_obj_wiki = model;
    [nextvc initOperation];
    [self.navigationController pushViewController:nextvc animated:YES];


//    WikiWebVC *vc = [[WikiWebVC alloc] init];
//    [vc initUrl:model.wikiId];
//    [self.navigationController pushViewController:vc animated:YES];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (CGFloat)cellContentViewWith
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    // 适配ios7
    if ([UIApplication sharedApplication].statusBarOrientation != UIInterfaceOrientationPortrait && [[UIDevice currentDevice].systemVersion floatValue] < 8) {
        width = [UIScreen mainScreen].bounds.size.height;
    }
    return width;
}

@end
