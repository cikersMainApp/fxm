//
//  BaoyuLeftViewController.m
//  测拉测试_1
//
//  Created by qianfeng on 15/12/21.
//  Copyright (c) 2015年 Muzibaoyu. All rights reserved.
//

#import "BaoyuLeftViewController.h"

static NSString * const BaoyuCellReuseId = @"baoyucell";



@interface BaoyuLeftViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tabelView;

@property (nonatomic,strong) NSArray *tabelArr;

@end

@implementation BaoyuLeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    self.tabelArr = @[@"1",@"2",@"3",@"4"];
    
    [self.view addSubview:self.tabelView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark ----------------tableView协议--------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tabelArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:BaoyuCellReuseId];
    cell.textLabel.text = self.tabelArr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.drawer reloadCenterViewControllerUsingBlock:^{
        
        //执行点击事件，如果传值可以将plainViewController作成单例传值
        
//        BaoyuPlainViewController *plainVC = [BaoyuPlainViewController defaultPlainViewController];
//        plainVC.showLabel.text = self.tabelArr[indexPath.row];
        
        
        
        
        
    }];
}


#pragma mark ----------------懒加载--------------------
- (UITableView *)tabelView{
    if (!_tabelView) {
        _tabelView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tabelView.delegate = self;
        _tabelView.dataSource = self;
        [_tabelView registerClass:[UITableViewCell class] forCellReuseIdentifier:BaoyuCellReuseId];
    }
    return _tabelView;
}


#pragma mark - ICSDrawerControllerPresenting

- (void)drawerControllerWillOpen:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = NO;
}

- (void)drawerControllerDidOpen:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = YES;
}

- (void)drawerControllerWillClose:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = NO;
}

- (void)drawerControllerDidClose:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = YES;
}



@end
