//
//  MatchWikiVC.m
//  CikersApp
//
//  Created by fxm on 16/1/3.
//  Copyright © 2016年 cikers. All rights reserved.
//

#define Height_soild 80.0f
#define Height_img 300.0f

#define kCell @"cell"

#import "MatchWikiVC.h"
#import "MatchWikiCell.h"
#import "WikiLookVC.h"
#import "MJRefresh/MJRefresh.h"
#import "RMMapper.h"
#import "WIkiModel.h"
#import "UITableView+SDAutoTableViewCellHeight.h"

@interface MatchWikiVC ()

@end

@implementation MatchWikiVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.automaticallyAdjustsScrollViewInsets = NO;
    

    
    
    self.array_data = [[NSMutableArray alloc] init];
    self.array_netdata = [[NSMutableArray alloc] init];
    self.array_wikidata= [[NSMutableArray alloc] init];
    
    self.opration = [[MatchOpration alloc] init];
    self.opration.delegate = self;
    
    [self.opration getWikiBymatchid:@"9294" offset:@"0"];
    
    self.tableView.estimatedRowHeight = 44.0f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.tableView.mj_footer.hidden = NO;
//    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
//        // 进入刷新状态后会自动调用这个block
//        
//    }];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];

    
    [self.tableView registerClass:[MatchWikiCell class] forCellReuseIdentifier:kCell];

}

-(void)loadMoreData
{

     [self.tableView.mj_footer endRefreshing];
    
    [self.opration getWikiBymatchid:@"9294" offset:[NSString stringWithFormat:@"%u",[self.array_wikidata count]-1]];

}

-(void)dataWiki_scuess:(id)dic
{
    
//    self.array_netdata = [dic objectForKey:@"data"];
    NSArray *ar = [dic objectForKey:@"data"];
  
    [self.array_netdata addObjectsFromArray:ar];
    
//    @"solid",@"image",@"video"
    
    for (NSDictionary *elem_dic in ar) {
        
//        [self.array_netdata addObject:elem_dic];
        
        NSString *contenttype = [elem_dic objectForKey:@"contenttype"];
        

        NSLog(@"wikitype:%@  type:%@",[elem_dic objectForKey:@"wikitype"],contenttype);
        
        NSDictionary *extra = [elem_dic objectForKey:@"extra"];
        
        
        if ([contenttype isEqual:Wiki_type_solid]) {
            
            [self.array_data addObject:[NSNumber numberWithFloat:Height_soild]];
        }
        if ([contenttype isEqual:Wiki_type_image])
        {
            NSArray *temp_array = [extra objectForKey:@"image"];
            
            NSLog(@"count : %d",[temp_array count]);
            
            float _height = Height_img;
            
            _height = ([temp_array count] <4)?(Height_img - 120.0f):Height_img;
            
            _height = ([temp_array count] >3 && [temp_array count]<7)?(Height_img - 30):Height_img;
            
            
            [self.array_data addObject:[NSNumber numberWithFloat:_height]];
        }
        if ([contenttype isEqual:Wiki_type_video])
        {
            [self.array_data addObject:[NSNumber numberWithFloat:Height_img]];
        }
        
        NSString *name = [extra objectForKey:@"authorname"];
        
        if ([name isEqual:[NSNull null]])
        {
            [self.array_data removeLastObject];
            
            [self.array_netdata removeObject:elem_dic];
        }
        
        
        
        WIkiModel *model = [RMMapper objectWithClass:[WIkiModel class] fromDictionary:elem_dic];

        [model parseExtra];
        
        [self.array_wikidata addObject:model];
        
    }
    
    
    
    
    
    
    [self.tableView reloadData];
    
}

-(void)bnt_lookImg:(NSMutableArray *)imgs
{

//    WikiLookVC *nextvc = [[WikiLookVC alloc] init];
//    nextvc.array_imgs = imgs;
//    
//    [self showViewController:nextvc sender:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array_wikidata.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MatchWikiCell *cell = [tableView dequeueReusableCellWithIdentifier:kCell];
    
    cell.model = self.array_wikidata[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // >>>>>>>>>>>>>>>>>>>>> * cell自适应 * >>>>>>>>>>>>>>>>>>>>>>>>
    CGFloat h = [self cellHeightForIndexPath:indexPath cellContentViewWidth:[UIScreen mainScreen].bounds.size.width];
    return h;
}
-(NSString *)segmentTitle
{
    return @"报道";
}

-(UIScrollView *)streachScrollView
{
    return self.tableView;
}
@end
