//
//  MyTournamentList.m
//  CikersApp
//
//  Created by fxm on 16/2/29.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "MyTournamentList.h"
#import "NSUserDefaults+RMSaveCustomObject.h"
#import "DicGameinfo.h"
#import "UIView+SDAutoLayout.h"
@interface MyTournamentList ()

@end

@implementation MyTournamentList

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的赛事";
    
    _data_userinfo = [[NSUserDefaults standardUserDefaults] rm_customObjectForKey:@"user"];
    
    _operation = [[UserinfoModel alloc] initWithDelegate:nil needCommonProcess:NO];
    _operation.delegate = self;
    [_operation sendTournamentByid:_data_userinfo.entityId];
    
    _data_obj = [[NSMutableArray alloc] init];
    
    _selectedArrayStatus = [[NSMutableArray alloc] init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)data_scuess:(id)obj
{

    [_data_obj addObjectsFromArray:(NSArray*)obj];
    
    for (int i = 0; i<[_data_obj count]; i++) {
        [_selectedArrayStatus addObject:@"1"];
    }
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [_data_obj count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if ([_selectedArrayStatus[section] isEqualToString:@"1"])
    {
        DicGameinfo *info = [_data_obj objectAtIndex:section];

        
        return [info.array_matchs count];
    }
    
    return 0;

    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 60;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MyTournamentListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[MyTournamentListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        tableView.separatorInset = UIEdgeInsetsMake(CELL_NORMAL_HEIGHT - 2, 0, 1, 0);
    }
    
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    DicGameinfo *game = [_data_obj objectAtIndex:indexPath.section];
    
    DicMatchinfo *info = [game.array_matchs objectAtIndex:indexPath.row];

    [cell updateUI:info];

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DicGameinfo *info = [_data_obj objectAtIndex:indexPath.section];
    DicMatchinfo *match =[info.array_matchs objectAtIndex:indexPath.row];
    [SingleManageVC pushOtherModuleByNav:self.navigationController nextNav:nil type:Module_Match data:match];
}
#pragma mark - section内容
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    //每个section上面有一个button,给button一个tag值,用于在点击事件中改变_selectedArray[button.tag - 1000]的值
    
    DicGameinfo *game = [_data_obj objectAtIndex:section];
    
    UIView *sectionView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 375, 60)];
    sectionView.backgroundColor = COLOR_GRAY;
    UIButton *sectionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    sectionButton.frame = sectionView.frame;
    [sectionButton setTitle:game.name forState:UIControlStateNormal];
    [sectionButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [sectionButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    sectionButton.tag = 1000 + section;
    [sectionView addSubview:sectionButton];
    return sectionView;
}
#pragma mark button点击方法
-(void)buttonAction:(UIButton *)button
{
    if ([_selectedArrayStatus[button.tag - 1000] isEqualToString:@"0"]) {
        [_selectedArrayStatus replaceObjectAtIndex:button.tag - 1000 withObject:@"1"];
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:button.tag - 1000] withRowAnimation:UITableViewRowAnimationFade];
    }
    else
    {
        //如果当前点击的section是展开的,那么点击后就需要把它缩回,使_selectedArray对应的值为0,这样当前section返回cell的个数变成0,然后刷新这个section就行了
        [_selectedArrayStatus replaceObjectAtIndex:button.tag - 1000 withObject:@"0"];
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:button.tag - 1000] withRowAnimation:UITableViewRowAnimationFade];
    }
}



@end


#pragma mark -
#pragma mark CELL

@implementation MyTournamentListCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _icon_left = [[UIImageView alloc] initWithFrame:CGRectMake(50, 10, 50, 50)];
        
        
        _icon_right= [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth-100, 10, 50, 50)];
        
        _lb_left = [[UILabel alloc] initWithFrame:CGRectMake(0, 70, 150, 20)];
        _lb_left.textAlignment = NSTextAlignmentCenter;
        [_lb_left.font fontWithSize:12];
        
        _lb_right= [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth-150, 70, 150, 20)];
        _lb_right.textAlignment = NSTextAlignmentCenter;
        [_lb_right.font fontWithSize:12];
        
        
        _lb_score= [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 100, 30)];
        _lb_score.center = CGPointMake(ScreenWidth/2, 50);
        _lb_score.textAlignment = NSTextAlignmentCenter;
        
        _lb_time = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, 100, 30)];
        _lb_time.center = CGPointMake(ScreenWidth/2, 30);
        _lb_time.textAlignment = NSTextAlignmentCenter;
        [_lb_time.font fontWithSize:10];
        
        
        [self.contentView addSubview:_icon_left];
        [self.contentView addSubview:_icon_right];
        [self.contentView addSubview:_lb_left];
        [self.contentView addSubview:_lb_right];
        [self.contentView addSubview:_lb_score];
        [self.contentView addSubview:_lb_time];
        
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
}
-(void)updateUI:(DicMatchinfo*)dic
{
    
    
    [_icon_left sd_setImageWithURL:SDIMAGEURL(dic.teama.icon) placeholderImage:PLACEHOLDER_IMG];
    [_icon_right sd_setImageWithURL:SDIMAGEURL(dic.teamb.icon) placeholderImage:PLACEHOLDER_IMG];
    
    _lb_left.text = dic.teama.name;
    _lb_right.text= dic.teamb.name;
    _lb_time.text = dic.time_scheduletime;
    _lb_score.text = dic.resultforview;
}
-(void)bnt_click:(UIButton *)sender
{
    
    if(self.clickBlock)
        self.clickBlock(sender.tag);
}


@end
