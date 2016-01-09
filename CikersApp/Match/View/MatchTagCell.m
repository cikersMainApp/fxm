//
//  MatchTagCell.m
//  CikersApp
//
//  Created by fxm on 15/12/29.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "MatchTagCell.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import "DicPlayerinfo.h"
@implementation MatchTagCell


#define testurl @"http://static.cikers.com/repos/thumbnail/s70/repos/1/uploads/2015/03/08/5975.jpg"

- (void)awakeFromNib {
    // Initialization code
        
    _img_photo.layer.masksToBounds =YES;
    
    _img_photo.layer.cornerRadius =_img_photo.frame.size.height/2;
    
    
    self.lb_teamname = [[UILabel  alloc] initWithFrame:CGRectMake(5, 2, 300, 24)];
    [self.view_sectionbg addSubview:self.lb_teamname];
    

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:NO animated:animated];

    // Configure the view for the selected state
}
-(IBAction)bnt_action:(UIButton*)sender
{
    [self.delegate data_back:[NSNumber numberWithLong:self.i_index]];
}

-(void)showSectionState:(BOOL)show bgcolor:(int)color name:(NSString*)name
{

    self.view_sectionbg.hidden = !show;
    
    self.view_sectionbg.backgroundColor = [UIColor orangeColor];
    
    self.lb_teamname.text = name;
}

-(void)updateUI:(DicPlayerinfo *)dic
{
    
    if ([dic isEqual:[NSNull null]]) {
        
        return;
    }
    
    NSString *url = [NSString stringWithFormat:@"http://static.cikers.com%@",dic.icon];
    
    [self.img_photo sd_setImageWithURL:[NSURL URLWithString:url]];

    self.lb_name.text = dic.name;
    
    self.lb_tag1.text = @"没有热门";
    
    if (![dic.hottags isEqual:[NSNull null]])
    {
        //hottags 里面的内容有三个

        NSLog(@"%@",[dic.hottags objectAtIndex:0]);
        
//        self.lb_tag1.text = [dic.hottags objectAtIndex:0];
    }
}

@end
