//
//  WikiOtherBaseVC.m
//  CikersApp
//
//  Created by fxm on 16/3/10.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "WikiOtherBaseVC.h"
#import "UITableView+SDAutoTableViewCellHeight.h"
#import "UIView+SDAutoLayout.h"

#import "AFNetworking.h"
#import "MJRefresh.h"
#import "MJExtension.h"
#import "XYString.h"
#import "DicWikiInfo.h"

@interface WikiOtherBaseVC ()
{
    MJRefreshComponent *myRefreshView;
    NSInteger page;

}
@property(nonatomic ,strong) UITableView *view_recommand;
@property(nonatomic ,strong) NSMutableArray *listArry;

@end

@implementation WikiOtherBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = YES;
    

    [self.view addSubview:self.view_circle];
    _view_circle.nextvc = self;
    self.view_circle.sd_layout
    .topSpaceToView(self.view,0)
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
