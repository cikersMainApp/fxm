//
//  ARSegmentPageHeader.m
//  ARSegmentPager
//
//  Created by August on 15/3/28.
//  Copyright (c) 2015年 August. All rights reserved.
//

#import "ARSegmentPageHeader.h"
#import "SDWebImage/UIImageView+WebCache.h"
@interface ARSegmentPageHeader ()

@property (nonatomic, strong) NSLayoutConstraint *imageTopConstraint;

@end

@implementation ARSegmentPageHeader

-(instancetype)init
{
    self = [super init];
    if (self) {
        [self _baseConfigs];
    }
    return self;
}

-(void)_baseConfigs
{
    self.imageView = [[UIImageView alloc] init];
    self.imageView.image = [UIImage imageNamed:@"haibao"];
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.clipsToBounds = YES;
    [self addSubview:self.imageView];
    
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
    self.imageTopConstraint = [NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    [self addConstraint:self.imageTopConstraint];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];

    self.view_bg = [[[NSBundle mainBundle] loadNibNamed:@"CustomHeader" owner:nil options:nil] lastObject];
    
    [self addSubview:self.view_bg];
    
    

    //增加mini显示
    self.img_left = [[UIImageView alloc] initWithFrame:CGRectMake(100, 20, 40, 40)];
    [self.img_left sd_setImageWithURL:[NSURL URLWithString:@"http://static.cikers.com/repos/thumbnail/s90/repos/1/uploads/2015/10/20/54752.png"]];
    [self.view_bg addSubview:self.img_left];
    

    
    //增加mini显示
    self.img_right = [[UIImageView alloc] initWithFrame:CGRectMake(300, 20, 40, 40)];
    [self.img_right sd_setImageWithURL:[NSURL URLWithString:@"http://static.cikers.com/repos/thumbnail/s90/repos/1/uploads/2015/10/20/54752.png"]];
    [self.view_bg addSubview:self.img_right];
    

}

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *view = [super hitTest:point withEvent:event];
    if (view == self) {
        return nil;
    }
    return view;
}

@end
