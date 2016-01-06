//
//  MatchTagCell.m
//  CikersApp
//
//  Created by fxm on 15/12/29.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "MatchTagCell.h"
#import "SDWebImage/UIImageView+WebCache.h"
@implementation MatchTagCell


#define testurl @"http://static.cikers.com/repos/thumbnail/s70/repos/1/uploads/2015/03/08/5975.jpg"

- (void)awakeFromNib {
    // Initialization code
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(IBAction)bnt_action:(UIButton*)sender
{

}

-(void)showSectionState:(BOOL)show bgcolor:(int)color
{

    self.view_sectionbg.hidden = !show;
    
    self.view_sectionbg.backgroundColor = [UIColor blueColor];
    
    self.lb_sectionTitle.text = @"湖南大学老乡队";
}

-(void)updateUI:(NSDictionary *)dic
{
    
    NSArray *data = [dic objectForKey:@"data"];
    

    NSDictionary *dic_elem = [data objectAtIndex:self.i_index];

    NSString *url = [NSString stringWithFormat:@"http://static.cikers.com%@",[dic_elem objectForKey:@"icon"]];
    
    [self.img_photo sd_setImageWithURL:[NSURL URLWithString:url]];

    self.lb_name.text = [dic_elem objectForKey:@"name"];
}

@end
