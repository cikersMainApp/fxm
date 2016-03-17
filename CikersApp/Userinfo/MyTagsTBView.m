//
//  MyTagsTBView.m
//  CikersApp
//
//  Created by fxm on 16/2/27.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "MyTagsTBView.h"
#import "DicTags.h"
#import "UIImageView+WebCache.h"
#import "DicPlayerinfo.h"
#import "NSUserDefaults+RMSaveCustomObject.h"
#import "MyTagsCell.h"
@interface MyTagsTBView ()

@end

@implementation MyTagsTBView


-(instancetype)init
{

    if (self = [super init]) {
        
        _data_userinfo = [[NSUserDefaults standardUserDefaults] rm_customObjectForKey:@"user"];

    }
    
    return self;
}


-(instancetype)initWithCoder:(NSCoder *)aDecoder
{

    if (self = [super initWithCoder:aDecoder]) {
        
        _data_userinfo = [[NSUserDefaults standardUserDefaults] rm_customObjectForKey:@"user"];

        _num_userid = _data_userinfo.entityId;
        
        [self initOperation:@"player"];
        
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的标签";
    
    _num_delTxag = 0;
    
    _data_userinfo = [[NSUserDefaults standardUserDefaults] rm_customObjectForKey:@"user"];

    
    _data_obj = [[NSMutableArray alloc] init];
    
    
    
    
    _view_footerbg = [[UIView alloc] init];
    _view_footerbg.backgroundColor = [UIColor lightGrayColor];
    
    _tf_tag = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, ScreenWidth-70, 40)];
    
    _tf_tag.placeholder = @"吐槽一下你眼中的他";
    
    _tf_tag.borderStyle = UITextBorderStyleRoundedRect;
    
    [_view_footerbg addSubview:_tf_tag];
    
    UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [bt setFrame:CGRectMake(ScreenWidth - 60, 10, 50, 40)];

    [bt setTitle:@"吐槽" forState:UIControlStateNormal];
    
    [bt addTarget:self action:@selector(bnt_confirm) forControlEvents:UIControlEventTouchUpInside];
    
    [_view_footerbg addSubview:bt];
}

-(void)initOperation:(NSString*)urlTag
{
    _operation = [[UserinfoModel alloc] initWithDelegate:nil needCommonProcess:NO];
    _operation.delegate = self;
    _operation.tagString = urlTag;
    [_operation sendTagsByid:_num_userid];

}

-(void)bnt_confirm
{
    [_operation sendAddTagsBytag:_tf_tag.text uid:_num_userid];
    
    [_tf_tag becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)data_scuess:(id)obj
{
 
    [_data_obj addObjectsFromArray:(NSArray*)obj];

    [self.tableView reloadData];
    
    
}

-(void)data_delScuess:(id)obj
{

    [_data_obj removeObjectAtIndex:_num_delTxag];
    
    [self.tableView reloadData];
}

-(void)data_support:(id)obj
{

}

#pragma mark - Table view data source



-(nullable UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{

    return _view_footerbg;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{

    return 60;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 130;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_data_obj count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyTagsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        
        cell =  [[MyTagsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
        
        if ([_num_userid isEqual:_data_userinfo.entityId]) {
            [cell cell_init];
        }
        
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    
    cell.tag = indexPath.row;
    
    DicTags *elem_tag = [_data_obj objectAtIndex:indexPath.row];
    
    [cell cell_updata:elem_tag];
    
    [cell setCelldelblock:^(NSInteger tag) {
        
        _num_delTxag = tag;
        
        DicTags *elem_tag1 = [_data_obj objectAtIndex:indexPath.row];

        [_operation  sendDelTagBytag:elem_tag1.tag uid:_num_userid];
        
    }];

    
    [cell setCellPlayerblock:^(DicPlayerinfo *obj) {
        
        [SingleManageVC pushOtherModuleByNav:self.navigationController nextNav:nil type:Module_Player data:obj];
        
    }];
    
    [cell setCellsupport:^(NSInteger tag) {
        
        _num_delTxag = tag;
        
        DicTags *elem_tag1 = [_data_obj objectAtIndex:indexPath.row];
        
        [_operation  sendAddTagsBytag:elem_tag1.tag uid:_num_userid];
        
    }];
    return cell;
}



@end
