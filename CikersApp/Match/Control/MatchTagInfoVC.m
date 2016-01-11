//
//  MatchTagInfoVC.m
//  CikersApp
//
//  Created by fxm on 16/1/3.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "MatchTagInfoVC.h"
#import "DicPlayerinfo.h"
#import "UIView+SDAutoLayout.h"
#import "Api.h"
#import "MatchTagTableVC.h"
@interface MatchTagInfoVC ()<BaseApiDelegate>

@end

@implementation MatchTagInfoVC


-(void)viewWillDisappear:(BOOL)animated
{

    if (![self.tf_tag isEqual:@""])
    {
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        [dic setValue:@"测试" forKey:@"name"];
        [dic setValue:[NSNumber numberWithInt:1] forKey:@"count"];
        
//        [self.dic_player.hottags addObject:dic];
        
    }
    
    
    [self.delegate_match.array_team replaceObjectAtIndex:self.num_index withObject:self.dic_player];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 64)];
    [view setBackgroundColor:SUBJECT_COLOR];
    
    
    UITableView *view_table = [[UITableView alloc] init];
    view_table.delegate=self;
    view_table.dataSource = self;
    
    
    
    _tf_tag = [[UITextField alloc] init];
    [_tf_tag setBackgroundColor:[UIColor orangeColor]];
    [_tf_tag setPlaceholder:@"吐槽你眼中的他吧"];
    
    UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
    [bt addTarget:self action:@selector(bnt_action:) forControlEvents:UIControlEventTouchUpInside];
    [bt setTitle:@"发送" forState:UIControlStateNormal];
    [bt setBackgroundColor:[UIColor orangeColor]];
    
    NSArray *views = @[view,view_table,_tf_tag,bt];
    
    [views enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.view addSubview:obj];
    }];
    
    
    _tf_tag.sd_layout
    .leftSpaceToView(self.view,10)
    .topSpaceToView(self.view,74)
    .heightIs(30)
    .widthIs(0.7*self.view.frame.size.width);
    
    
    bt.sd_layout
    .rightSpaceToView(self.view,10)
    .topSpaceToView(self.view,74)
    .heightIs(30)
    .widthIs(0.2*self.view.frame.size.width);
    

    view_table.sd_layout
    .topSpaceToView(_tf_tag,64)
    .leftSpaceToView(self.view,10)
    .rightSpaceToView(self.view,10)
    .heightIs(400);
    


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)bnt_action:(id)sender
{

    
    Api *api = [[Api alloc] initWithDelegate:self needCommonProcess:NO];
    [api Tag_sendByOgroupid:@"player" oid:self.dic_player.id];
    
}

-(void)finishedWithRequest:(HttpRequest *)request Response:(HttpResponse *)response AndError:(NSError *)error
{
    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:response.responseData options:NSJSONReadingAllowFragments error:nil];

    NSNumber *json_e = [dic objectForKey:@"e"];
    
    if ([json_e intValue]  == 0) {
        [APSProgress showToast:self.view withMessage:@"标记成功"];
        
    }
    else
    {
        [APSProgress showToast:self.view withMessage:[dic objectForKey:@"msg"]];
    }
    
}



#pragma mark - Table view data source

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 200;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    if ([self.dic_player.hottags isEqual:[NSNull null]]) {
        return 1;
    }
    
    NSInteger _num = [self.dic_player.hottags count];
    
    _num = (_num == 0)?1:_num;
    
    return _num;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    
    if ([self.dic_player.hottags isEqual:[NSNull null]]) {
        cell.textLabel.text = @"他还没标签，赶快给他安一个吧";
 
    }
    else
    {
    
    }
    
    return cell;
}

@end
