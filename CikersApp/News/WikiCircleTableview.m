//
//  WikiCircleTableview.m
//  CikersApp
//
//  Created by fxm on 16/1/27.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "WikiCircleTableview.h"
#import "UITableView+SDAutoTableViewCellHeight.h"

#import "AFNetworking.h"
#import "MJRefresh.h"
#import "MJExtension.h"
#import "XYString.h"

#import "WikiCellBase.h"
#import "DicMatchinfo.h"
#import "WikiInfoTableVC.h"


#import "ThreeBaseCell.h"
#import "ThreeFirstCell.h"
#import "ThreeSecondCell.h"
#import "ThreeThirdCell.h"
#import "ThreeFourthCell.h"

@interface WikiCircleTableview ()
{
    MJRefreshComponent *myRefreshView;
    NSInteger page;
}
@end

@implementation WikiCircleTableview


//-(void)setHidden:(BOOL)hidden
//{
//
//    _hidden = hidden;
//    
//    if (!hidden && !_listArry) {
//    
//        [self.mj_header beginRefreshing];
//
//    }
//    
//}

-(instancetype)initWithFrame:(CGRect)frame
{

    if (self = [super initWithFrame:frame]) {
        
        self.separatorColor = [UIColor clearColor];
        self.delegate = self;
        self.dataSource = self;
        
        //..下拉刷新
        self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            page = 0;
            myRefreshView = self.mj_header;
            [self loadData];
        }];
        // 马上进入刷新状态
        
        //..上拉刷新
        self.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            page = page + 1;
            myRefreshView = self.mj_footer;
            [self loadData];
        }];
        self.mj_footer.hidden = YES;
        
        self.opration = [[WIkiModel alloc] initWithDelegate:nil needCommonProcess:NO];
        self.opration.delegate = self;
    }
    
    return self;
}

-(NSMutableArray *)listArry{
    
    if (!_listArry) {
        _listArry = [[NSMutableArray alloc] init];
    }
    return _listArry;
}

#pragma mark - 请求数据

-(void)data_scuess:(NSMutableArray *)dic
{
    //..下拉刷新
    if (myRefreshView == self.mj_header) {
        self.listArry = dic;
        self.mj_footer.hidden = self.listArry.count==0?YES:NO;
        
    }else if(myRefreshView == self.mj_footer){
        [self.listArry addObjectsFromArray:dic];
    }
    
    
    [self doneWithView:myRefreshView];

}

-(void)loadData{
    
    [_opration sendListCikcleByoffset:page*30];
    
}

#pragma mark -  回调刷新
-(void)doneWithView:(MJRefreshComponent*)refreshView{
    [self reloadData];
    [myRefreshView  endRefreshing];
}


#pragma mark - 表的协议方法

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.listArry.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    WikiCellBase * cell = nil;
    
    DicWikiInfo * model = self.listArry[indexPath.row];
    
    NSString * identifier = [WikiCellBase cellIdentifierForRow:model];
    Class mClass =  NSClassFromString(identifier);
    
    cell =  [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[mClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.model = model;
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // cell自适应设置
    DicWikiInfo * threeModel = self.listArry[indexPath.row];

    NSString * identifier = [WikiCellBase cellIdentifierForRow:threeModel];
    Class mClass =  NSClassFromString(identifier);
    
    // 返回计算出的cell高度（普通简化版方法，同样只需一步设置即可完成）
    return [self cellHeightForIndexPath:indexPath model:threeModel keyPath:@"model" cellClass:mClass contentViewWidth:[self cellContentViewWith]];
    
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
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DicWikiInfo * model = self.listArry[indexPath.row];

    if ([model.wikitype isEqualToString:WIKI_TYPE_MATCH])
    {
        [SingleManageVC pushOtherModuleByNav:_nextvc nextNav:nil type:Modul_WikiToMatch data:model.matchId];
    }
    if ([model.wikitype isEqualToString:WIKI_TYPE_MESSAGE])
    {
   
        [WikiInfoTableVC pushInfoTableViewVC:0 data:model];
    }
}


@end
