//
//  MatchMVPTableVC.m
//  CikersApp
//
//  Created by fxm on 15/12/29.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "MatchMVPTableVC.h"
#import "MatchMVPCell.h"
#import "DicPlayerinfo.h"
#import "DicTeaminfo.h"
#import "MatchMVPResultCell.h"
@interface MatchMVPTableVC ()

@end

@implementation MatchMVPTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.opration = [[MatchOpration alloc] init];
    self.opration.delegate = self;
    
    
    
    self.array_teamA = [[NSMutableArray alloc] init];
    self.array_teamB = [[NSMutableArray alloc] init];
    self.array_team = [[NSMutableArray alloc] init];
    self.array_teamrank=[[NSMutableArray alloc] init];
    
    
    self.opration = [[MatchOpration alloc] init];
    self.opration.delegate = self;

    
    self.isShowResult = [self.dic_data.mvpsettle boolValue];
    
    //获取投票信息
    
    [self.opration getPlayersInfoByteamid:self.dic_data.teama.id matchid:self.dic_data.matchid httpTag:@"A" tags:@"0" mvp:@"1"];
 
    //获取结果信息
    
    
    
    self.int_length = 0;
    
    
    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)cell_click:(NSNumber *)playerid
{
    [self.opration sendPlayerMvpBymatchid:self.dic_data.matchid playerid:playerid];
}

-(void)dataMvp_scuess:(id)dic
{


    if ([[dic objectForKey:@"e"] intValue] == 0)
    {
        [APSProgress showToast:self.view withMessage:@"支持成功"];
    }
    
    
    
}

-(void)dataTag_scuess:(id)dic
{

    NSMutableDictionary *dic_temp = (NSMutableDictionary*)dic;
    
    if ([dic_temp count] == 2) {
        
        self.array_teamA = [dic_temp objectForKey:@"A"];
        self.array_teamB = [dic_temp objectForKey:@"B"];
        [self.array_team addObjectsFromArray:self.array_teamA];
        [self.array_team addObjectsFromArray:self.array_teamB];
        
        
        self.int_length = [self.array_teamA count];
        
        self.int_length = (self.int_length < [self.array_teamB count])?[self.array_teamB count]:[self.array_teamA count];

        
        
        self.isShowResult = false;
        
        if (self.isShowResult)
        {
            
            [self.array_teamrank addObjectsFromArray:self.array_teamA];
            [self.array_teamrank addObjectsFromArray:self.array_teamB];
            
            
            NSArray *array_temp = [NSArray arrayWithArray:self.array_teamrank];
            array_temp = [array_temp sortedArrayUsingComparator:(NSComparator)^(DicPlayerinfo* obj1, DicPlayerinfo* obj2) {
                
                return [obj1.votecount intValue] > [obj1.votecount intValue];
                
            }];
            
            
            [self.array_teamrank removeAllObjects];
            [self.array_teamrank addObjectsFromArray:array_temp];
            
            self.int_length = 10; //只显示前10名
            
        }
        
        [self.tableView reloadData];
        
    }
    else
    {
        [self.opration getPlayersInfoByteamid:self.dic_data.teamb.id matchid:self.dic_data.matchid httpTag:@"B" tags:@"0" mvp:@"1"];
    }
    
    
    

    
}


#pragma mark - Table view data source
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90.0f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.int_length;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    
    
    MatchMVPCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if (self.int_length == 0) return cell;
    
    DicPlayerinfo *playea;
    DicPlayerinfo *playeb;
    
    playea = (indexPath.row < [self.array_teamA count])?[self.array_teamA objectAtIndex:indexPath.row]:playea;
    playeb = (indexPath.row < [self.array_teamB count])?[self.array_teamB objectAtIndex:indexPath.row]:playeb;
    
    
    if (self.isShowResult) {
        
        [(MatchMVPCell *)cell updateUI:[self.array_teamrank objectAtIndex:indexPath.row]];
        cell.lb_rank.text = [NSString stringWithFormat:@"%ld",indexPath.row];
        
    }
    else{
    
        [(MatchMVPCell *)cell updateUI:playea playerb:playeb];
    }
    
    
    return cell;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

-(NSString *)segmentTitle
{
    return @"MVP";
}

-(UIScrollView *)streachScrollView
{
    return self.tableView;
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
