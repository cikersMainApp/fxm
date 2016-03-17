//
//  MyTagsCell.m
//  CikersApp
//
//  Created by fxm on 16/3/1.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "MyTagsCell.h"
#import "UIButton+WebCache.h"
@implementation MyTagsCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        _bt_support = [UIButton buttonWithType:UIButtonTypeCustom];
        _bt_support.frame = CGRectMake(ScreenWidth-40, 10, 30, 30);
        [_bt_support setImage:[UIImage imageNamed:@"red"] forState:UIControlStateNormal];
        [_bt_support addTarget:self action:@selector(bnt_support) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_bt_support];
        
        

        UIView *separatorView = [[UIView alloc] initWithFrame:CGRectMake(5, 130 - 3, ScreenWidth-10, 1)];
        separatorView.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:separatorView];
        
    }
    
    return self;
}


-(void)cell_init
{
    
    _bt_del = [UIButton buttonWithType:UIButtonTypeCustom];
    _bt_del.frame = CGRectMake(ScreenWidth - 40, 60, 30, 30);
    [_bt_del setImage:[UIImage imageNamed:@"circleclose"] forState:UIControlStateNormal];
    [_bt_del addTarget:self action:@selector(bnt_del) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_bt_del];
    
}

-(void)bnt_del
{

    self.celldelblock(self.tag);
    
}

-(void)bnt_support
{
    self.cellsupport(self.tag);
}

-(void)bnt_player:(UIButton*)sender
{
    DicPlayerinfo *player = [_data_obj.array_players objectAtIndex:sender.tag];

    self.cellPlayerblock(player);
}

-(void)layoutSubviews
{

    CGRect tmpFrame = self.textLabel.frame;
    tmpFrame.origin.x = 10;
    tmpFrame.origin.y = 10;
    tmpFrame.size.width = 200;
    tmpFrame.size.height = 20;
    self.textLabel.frame = tmpFrame;



}


-(void)cell_updata:(DicTags *)dic
{
    
    _data_obj = dic;
    
    self.textLabel.text = dic.tag;
    
    UIScrollView *scrollow = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth/5*4, 100)];
    scrollow.showsHorizontalScrollIndicator = YES;
    
    
    UIView *bgview = [[UIView alloc] init];
    
    for (int i = 0; i<[dic.array_players count]; i++) {
        
        DicPlayerinfo *player = [dic.array_players objectAtIndex:i];
        
        UIButton *bticon = [UIButton buttonWithType:UIButtonTypeCustom];
        [bticon setFrame:CGRectMake(ScreenWidth/5*i, 30, 60, 60)];
        [bticon sd_setImageWithURL:SDIMAGEURL(player.icon) forState:UIControlStateNormal placeholderImage:PLACEHOLDER_IMG];
        [bticon addTarget:self action:@selector(bnt_player:) forControlEvents:UIControlEventTouchUpInside];
        [bticon setTag:i];
        [bgview addSubview:bticon];
        
    }
    
    bgview.frame = CGRectMake(0, 20, ScreenWidth/5*[dic.array_players count], 100);
    
    [scrollow addSubview:bgview];
    scrollow.contentSize = CGSizeMake(ScreenWidth/5*[dic.array_players count], 100);
    
    [self.contentView addSubview:scrollow];


}


@end
