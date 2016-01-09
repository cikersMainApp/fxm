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
    
    self.opration = [[MatchOpration alloc] init];
    self.opration.delegate = self;

    [self.opration getPlayersInfoByteamid:self.dic_data.teama.id matchid:self.dic_data.matchid httpTag:@"A" tags:@"0" mvp:@"1"];
 
    
    self.int_length = 0;
    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    
    [cell updateUI:playea playerb:playeb];
    
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
