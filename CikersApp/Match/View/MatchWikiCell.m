//
//  MatchWikiCell.m
//  CikersApp
//
//  Created by fxm on 16/1/3.
//  Copyright © 2016年 cikers. All rights reserved.
//
#define FONTNAME @""
#define FONTTITLESIZE 14
#define FONTTIMESIZE 12
#define FONTCONTENTSIZE 12

#import "MatchWikiCell.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import "SDWebImage/UIButton+WebCache.h"
#import "WikiLookVC.h"
@implementation MatchWikiCell

- (void)awakeFromNib {
    // Initialization code
    
//    [self initUI];
    
//    self.array_imgs = [[NSMutableArray alloc] init];
    
}
- (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

-(void)initUI
{
    self.img_photo = [[UIImageView alloc] initWithFrame:CGRectMake(8, 8, 40, 40)];
    [self addSubview:self.img_photo];
    
    self.lb_name = [[UILabel alloc] initWithFrame:CGRectMake(8+self.img_photo.frame.size.width + 10, 17, 100, 30)];
    self.lb_name.font = [UIFont systemFontOfSize:FONTTITLESIZE];
    [self addSubview:self.lb_name];
    
    
    self.lb_time = [[UILabel alloc] init];
    [self.lb_time setFrame:CGRectMake(50 + self.lb_name.frame.origin.x + self.lb_name.frame.size.width, 17, 100, 30)];
    self.lb_time.font = [UIFont systemFontOfSize:FONTTIMESIZE];
    [self addSubview:self.lb_time];
    
    
    
    self.lb_content = [[UILabel alloc] initWithFrame:CGRectMake(5, 50, ScreenWidth-10, 30)];
    self.lb_content.font = [UIFont systemFontOfSize:FONTCONTENTSIZE];
    self.lb_content.numberOfLines = 2;
    [self addSubview:self.lb_content];
    
    
}
-(void)update:(NSDictionary *)dic type:(NSUInteger)type index:(NSUInteger)index
{

    self._index = index;
    
    NSString *url = [NSString stringWithFormat:@"http://www.cikers.com%@",[dic objectForKey:@"icon"]];
    [self.img_photo sd_setImageWithURL:[NSURL URLWithString:url]];

    
    NSDictionary *extra = [dic objectForKey:@"extra"];
    self.lb_name.text = [extra objectForKey:@"authorname"];
    
    self.lb_content.text = [extra objectForKey:@"content"];
    
    
    if ([[dic objectForKey:@"contenttype"] isEqual:Wiki_type_image])
    {
        
        [self.array_imgs removeAllObjects];
        NSArray *temp_array = [extra objectForKey:@"image"];
        [self.array_imgs addObjectsFromArray:temp_array];
        [self updateTypeImg:self];
    }

    
    
    NSNumber *createdOn = [dic objectForKey:@"createdOn"];
    NSString *time = [ToolUtil tool_utcToNsstring:createdOn];
    self.lb_time.text = time;
    
}

-(void)updateTypeImg:(UIView *)view
{
    float b_width = (ScreenWidth - 30 - 30 - 15 - 15)/3.0f;
    
    for (int i = 0; i< [self.array_imgs count]; i++)
    {
        
        int w = i;
        
        if (i>=3) {
            w = i - 3;
        }
        
        NSString *url1 = [NSString stringWithFormat:@"http://www.cikers.com%@",[self.array_imgs objectAtIndex:i]];
        
        UIButton *bt = [[UIButton alloc] initWithFrame:CGRectMake(30+w*(b_width+1), b_width + (i/3)*b_width, b_width, b_width)];
        
        [bt setTitle:[NSString stringWithFormat:@"%d",i+1] forState:UIControlStateNormal];
        [bt setTag:i];
        [bt sd_setBackgroundImageWithURL:[NSURL URLWithString:url1] forState:UIControlStateNormal];
        [bt addTarget:self action:@selector(bnt_action:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:bt];
        
    }

}


-(void)bnt_action:(UIButton*)sender
{
    [self.delegate bnt_lookImg:self.array_imgs];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
