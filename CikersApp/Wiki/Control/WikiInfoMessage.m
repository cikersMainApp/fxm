//
//  WikiInfoMessage.m
//  CikersApp
//
//  Created by fxm on 16/1/28.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "WikiInfoMessage.h"
#import "WikiInfoCellMessage.h"
#import "UITableView+SDAutoTableViewCellHeight.h"
#import "DicWikiFavor.h"
#import "DicPlayerinfo.h"
#import "SDWebImage/UIButton+WebCache.h"
#import "WikiCellComment.h"
@interface WikiInfoMessage ()

@end

@implementation WikiInfoMessage

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"帖子正文";
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(barShare)];
    
    self.navigationItem.rightBarButtonItem = item;
    
    _array_favor = [NSMutableArray array];
    _array_comment = [NSMutableArray array];
    
}

-(void)initOperation
{
    _operation = [[WIkiModel alloc] initWithDelegate:nil needCommonProcess:NO];
    _operation.delegate = self;
    [_operation sendWikiInfo:_data_obj_wiki.id];
    
}

-(void)data_info:(id)dic
{

    NSArray *temparray = (NSArray*)dic;
    
    [_array_favor addObjectsFromArray:[temparray objectAtIndex:0]];
    [_array_comment addObjectsFromArray:[temparray objectAtIndex:1]];
    
    
    [self.tableView reloadData];
    
}

-(void)barShare
{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell*)creatRowOne:(UITableViewCell*)cell
{

    return cell;
}
-(UITableViewCell*)creatRowTwo:(UITableViewCell*)cell
{
    return cell;
}
-(UITableViewCell*)creatRowThree:(UITableViewCell *)cell
{
    return cell;
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSInteger num = 1;
    
//    num = (section == 1)?[_array_favor count]:num;
    num = (section == 2)?[_array_comment count]:num;
    
    return num;
}


-(NSString*)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{

    NSString *str = [NSString stringWithFormat:@"%ld个赞",[_array_favor count]];
    
    str = (section == 1)?@"热门评论":str;
    str = (section == 2)?@"":str;
    

    
    return str;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 20;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSInteger num = CELL_NORMAL_HEIGHT;
    
    switch (indexPath.section) {
        case 0:
        {
            Class mClass =  NSClassFromString(@"WikiInfoCellMessage");
            
            // 返回计算出的cell高度（普通简化版方法，同样只需一步设置即可完成）
            return [self.tableView cellHeightForIndexPath:indexPath model:_data_obj_wiki keyPath:@"data_obj_wiki" cellClass:mClass contentViewWidth:[self cellContentViewWith]];
        }
            break;
        case 2:
        {
//            Class mClass =  NSClassFromString(@"elemcell");
//            
//            // 返回计算出的cell高度（普通简化版方法，同样只需一步设置即可完成）
//            return [self.tableView cellHeightForIndexPath:indexPath model:_data_obj_wiki keyPath:@"data_obj_wiki" cellClass:mClass contentViewWidth:[self cellContentViewWith]];
        }
            break;
        default:
            break;
    }
    
    return num;
}

- (CGFloat)cellContentViewWith
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    // 适配ios7
    if ([UIApplication sharedApplication].statusBarOrientation != UIInterfaceOrientationPortrait && [[UIDevice currentDevice].systemVersion floatValue] < 8) {
        width = [UIScreen mainScreen].bounds.size.height;
    }
    return width;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell;

    
    //帖子正文
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        cell = [tableView dequeueReusableCellWithIdentifier:@"wikicell"];
        
        if (!cell) {
            cell = [[WikiInfoCellMessage alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"wikicell"];
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
        }
        
        ((WikiInfoCellMessage*)cell).data_obj_wiki = _data_obj_wiki;
        
        
        return (WikiInfoCellMessage*)cell;
    
    }

    // 点赞
    
    if (indexPath.section == 1 && indexPath.row == 0) {

        cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];

        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

        }
        
        if ([_array_favor count] == 0)
        {
            cell.textLabel.text = @"还没有小伙伴点赞";
        }
        else
        {
            
            cell.textLabel.text = @"";
            
            UIScrollView *scrollow = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 100)];
            scrollow.showsHorizontalScrollIndicator = YES;
            
            
            UIView *bgview = [[UIView alloc] init];
            
            for (int i = 0; i<[_array_favor count]; i++) {
                
                DicWikiFavor *player = [_array_favor objectAtIndex:i];
                
                UIButton *bticon = [UIButton buttonWithType:UIButtonTypeCustom];
                [bticon setFrame:CGRectMake(ScreenWidth/5*i, 30, 60, 60)];
                [bticon sd_setImageWithURL:SDIMAGEURL(player.icon) forState:UIControlStateNormal placeholderImage:PLACEHOLDER_IMG];
                [bticon addTarget:self action:@selector(bnt_player:) forControlEvents:UIControlEventTouchUpInside];
                [bticon setTag:i];
                [bgview addSubview:bticon];
                
            }
            
            bgview.frame = CGRectMake(0, 1, ScreenWidth/5*[_array_favor count], 100);
            
            [scrollow addSubview:bgview];
            scrollow.contentSize = CGSizeMake(ScreenWidth/5*[_array_favor count], 100);
            
            [cell.contentView addSubview:scrollow];
        }
        


        
        
    }
    

    // 评论
    
    
    if (indexPath.section == 2)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"elemcell"];
        
        if (!cell) {
            cell = [[WikiCellComment alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"elemcell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

        }
        
        DicWikiComments *obj = [_array_comment objectAtIndex:indexPath.row];
        
    }

    
    return cell;
}

-(void)bnt_player:(UIButton*)sender
{
    DicWikiFavor *favor = [_array_favor objectAtIndex:sender.tag];
    
    DicPlayerinfo *obj = [DicPlayerinfo new];
    
    obj.id = favor.id;
    obj.name = favor.name;
    obj.icon = favor.icon;
    obj.portrait = favor.icon;
    
    [SingleManageVC pushOtherModuleByNav:self.navigationController nextNav:nil type:Module_Player data:obj];

}

@end
