//
//  SearchVC.h
//  CikersApp
//
//  Created by fxm on 15/12/21.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "HLBaseViewController.h"
#import "HLTableView.h"
#import "HLFullButton.h"

#import "SearchViewModel.h"
#import "SearchOperation.h"
@interface SearchVC : HLBaseViewController<SearchOperationDelegate>

@property (weak, nonatomic) IBOutlet HLTableView *mainTableView;
@property (nonatomic,strong) SearchViewModel * viewModel;
@property (weak, nonatomic) IBOutlet HLFullButton *searchButton;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIView *searchbarBGView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *searchbarWidthConstrait;
@property (weak, nonatomic) IBOutlet UISegmentedControl *seg_bt;
@property (strong,nonatomic) NSString *str_type;

@property(nonatomic,strong)SearchOperation *operation;


- (IBAction)searchMethod:(id)sender;
-(void)segMethod:(id)sender;


@end
