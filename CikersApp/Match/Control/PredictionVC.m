//
//  PredictionVC.m
//  CikersApp
//
//  Created by fxm on 15/12/28.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "PredictionVC.h"

@interface PredictionVC ()

@end

@implementation PredictionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.str_matchiid = [NSNumber numberWithInt:-1];
    
    
    self.opration = [[MatchOpration alloc] init];
    self.opration.delegate = self;

    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getData:(NSNumber *)matchid
{
    [self.opration getDataForPredictionBymatchid:matchid];

    self.str_matchiid = matchid;
}

-(void)data_scuess:(id)dic
{
    self.net_dic = (NSDictionary*)dic;
    
    NSNumber *e = [dic objectForKey:@"e"];
    
    if ([e intValue] == -1)
    {
        
        [APSProgress showToast:self.view withMessage:[dic objectForKey:@"msg"]];
        
        return;
    }
    
    
    [self.tableView reloadData];

}

-(void)data_prediction:(id)dic
{
    
    NSNumber *e = [(NSDictionary*)dic objectForKey:@"e"];
    
    if ([e intValue] == -1)
    {
        
        [APSProgress showToast:self.view withMessage:[(NSDictionary*)dic objectForKey:@"msg"]];
        
        return;
    }
    

    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
    
    PredictionCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

    [self.cell_predic updateUIByUser:self.str_predictionTag];
    
}

#pragma mark - Table view data source
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 600.0f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
-(NSString *)segmentTitle
{
    return @"竞猜";
}

-(UIScrollView *)streachScrollView
{
    return self.tableView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.cell_predic = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    self.cell_predic.delegate = self;
    
    self.cell_predic.data_obj_matchinfo = self.data_obj_matchinfo;
    
    [self.cell_predic updateUI:self.net_dic matchid:self.str_matchiid];
    
    return self.cell_predic;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

-(void)sendNet:(NSString *)code
{

    self.str_predictionTag = code;
    
    [self.opration sendForPredictionBymatchid:self.str_matchiid code:code];
    
}

@end
