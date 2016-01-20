//
//  SearchVC.m
//  CikersApp
//
//  Created by fxm on 15/12/21.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "SearchVC.h"
#import "Api.h"

@interface SearchVC ()<UISearchBarDelegate,BaseApiDelegate>
@property(nonatomic,strong)Api *api;
@end

@implementation SearchVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [DataSingleton Instance].viewType = VIEW_SEARCH_GAME;
    
    self.api = [[Api alloc] initWithDelegate:self needCommonProcess:NO];
    
    [self dataInit];
    [self dataLoad];
    [self viewInit];
    
    self.str_type=@"game";
    [self.seg_bt addTarget:self action:@selector(segMethod:) forControlEvents:UIControlEventValueChanged];
    
}
- (void) viewInit
{
//    self.searchbarBGView.backgroundColor = [UIColor colorWithRed:249.f/255.f green:249.f/255.f blue:1.f/255.f alpha:1.f];
//    self.searchBar.backgroundImage = [self imageWithColor:[UIColor clearColor] size:self.searchBar.frame.size];
}

- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (void) dataInit
{
    self.viewModel = [[SearchViewModel alloc] init];
    self.viewModel.dataSource = [[NSMutableArray alloc] init];
    self.viewModel.delegate = self;
    self.mainTableView.delegate = self.viewModel;
    self.mainTableView.dataSource = self.viewModel;
    self.mainTableView.hlDelegate = self.viewModel;
    
    self.viewModel.vc_search = self;
    
}

-(void)dataLoad
{

}
- (void) showResultBy:(id) result
{
    AppDelegate * app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [[HLAlertManager shareInstance] showNoCancelAlertByTitle:@"提示" message:[result objectForKey:@"result"] delegate:nil presentBaseVC:app.window.rootViewController sureBlock:^(id sureResult) {
        
    }];

    
    [self dataLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark search



- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    if (self.searchbarWidthConstrait.constant < 0) {
        [UIView animateWithDuration:0.3
                         animations:^{
                             self.searchbarWidthConstrait.constant = self.searchbarWidthConstrait.constant + _searchButton.frame.size.width + 10;
                             [self.searchButton.superview layoutIfNeeded];
                         }];
    }
    
    return YES;
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    if (self.searchbarWidthConstrait.constant > 0) {
        [UIView animateWithDuration:0.3
                         animations:^{
                             self.searchbarWidthConstrait.constant = self.searchbarWidthConstrait.constant - _searchButton.frame.size.width - 10;
                             [self.searchButton.superview layoutIfNeeded];
                         }];
    }
    
    return YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}

- (IBAction)searchMethod:(id)sender {
    [self.searchBar resignFirstResponder];
    if (self.searchbarWidthConstrait.constant > 0) {
        [UIView animateWithDuration:0.3
                         animations:^{
                             self.searchbarWidthConstrait.constant = self.searchbarWidthConstrait.constant - _searchButton.frame.size.width - 10;
                             [self.searchButton.superview layoutIfNeeded];
                         }];
    }

    
    //发送网络
        
    
    [APSProgress showIndicatorView];
    
    [self.api searchByType:self.str_type keyword:self.searchBar.text];
    
    
//    [self.operation searchUsedMachines:@"machine" keywords:self.searchBar.text completeBlock:^(id result, NSError *error) {
//        [self.viewModel.dataSource removeAllObjects];
//        [self.viewModel.dataSource setArray:result];
//        [self.mainTableView reloadData];
//    }];
}

//- (void)selectData:(RecentUse *) use
//{
////    [self.navigationController pushViewController:StoryboardAcquireController(@"HLCommonlyUsed", @"chooseDrink") animated:YES];
//}

- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    
    return YES;
}


-(void)finishedWithRequest:(HttpRequest *)request Response:(HttpResponse *)response AndError:(NSError *)error
{
    [APSProgress hidenIndicatorView];
    
    NSDictionary * resultDic = [NSJSONSerialization JSONObjectWithData:response.responseData options:NSJSONReadingAllowFragments error:&error];
        
    NSObject *json_e = [resultDic objectForKey:JSON_KEY_E];
    
    NSObject *json_total = [resultDic objectForKey:JSON_KEY_TOTAL];
    
    NSArray *json_data = [resultDic objectForKey:@"data"];
    

    NSLog(@"e :%@  total :%@",json_e , json_total);
    
    for (NSDictionary *dic_elem in json_data)
    {
        
        NSString * name = [dic_elem objectForKey:@"field1"];
        NSString * url = [dic_elem objectForKey:@"field2"];
        NSString * oid = [dic_elem objectForKey:@"oid"];
        
        NSLog(@"name-:%@  oid:%@ url :%@",name,oid,url);
        
    }
    
    [self.viewModel.dataSource removeAllObjects];
    [self.viewModel.dataSource setArray:json_data];
    [self.mainTableView reloadData];

    
}

//player team game

-(void)segMethod:(id)sender
{
    UISegmentedControl *seg = (UISegmentedControl*)sender;
    
    //发送网络
    
    
    switch (seg.selectedSegmentIndex) {
        case 0:
        {
        self.str_type=@"game";
            
            [DataSingleton Instance].viewType = VIEW_SEARCH_GAME;

        }
            break;
        case 1:
        {
            self.str_type=@"team";
            [DataSingleton Instance].viewType = VIEW_SEARCH_TEAM;

        }
            break;
        case 2:
        {
            self.str_type=@"player";
            [DataSingleton Instance].viewType = VIEW_SEARCH_PLAYER;

        }
            break;
        default:
            break;
    }
    
    if ([self.searchBar.text isEqual:@""]) {
        
        return;
    }
    
    [APSProgress showIndicatorView];
    [self.api searchByType:self.str_type keyword:self.searchBar.text];
}




@end
