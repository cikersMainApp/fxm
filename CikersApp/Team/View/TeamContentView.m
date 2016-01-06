//
//  TeamContentView.m
//  CikersApp
//
//  Created by fxm on 15/12/22.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "TeamContentView.h"
#import "AppDelegate.h"
#import "TeamJionVC.h"
#import "TeamMainSection1.h"
#import "TeamWikiView.h"
#define SWidth                     self.frame.size.width
#define SHeight                    self.frame.size.height

@implementation TeamContentView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(void)initUI
{
    [self setFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    
    
    // create droppy
    self.droppy = [[DroppyScrollView alloc] initWithFrame:self.frame];
    [self.droppy setDefaultDropLocation:DroppyScrollViewDefaultDropLocationBottom];
    [self addSubview:self.droppy];
    
    self.index = 6;


    [self initWiki];
//    [self initMenu];
//    [self initSecond];
    [self inithead];


}

- (void)addButtonPressed:(id)sender {
    UILabel *v = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, SWidth-20, 50 + arc4random()%100)];
    [v setBackgroundColor:[self randomColor]];
    [v setFont:[UIFont fontWithName:@"HelveticaNeue-UltraLight" size:25]];
    [v setTextAlignment:NSTextAlignmentCenter];
    [v setText:[NSString stringWithFormat:@"item %lu", self.index--]];
    
    [self.droppy dropSubview:v atIndex:[self.droppy randomIndex]];
}

- (void)removeButtonPressed:(id)sender {
    [self.droppy removeSubviewAtIndex:[self.droppy randomIndex]];
}


- (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

-(void)inithead
{

    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"TeamMainSection1" owner:nil options:nil];
    TeamMainSection1 *view = [views lastObject];
    
//    [view setFrame:CGRectMake(0, 0, ScreenWidth, 500)];
    NSLog(@"view----------%f-----%f",view.frame.size.height,view.frame.size.width);

    [view setBackgroundColor:[UIColor orangeColor]];
    
    [self.droppy dropSubview:view];
    
}
-(void)initWiki
{
    TeamWikiView *view = [[TeamWikiView alloc] initWithFrame:CGRectMake(0, 0, SWidth, 350)];
    [view setBackgroundColor:[self randomColor]];
    
    [self.droppy dropSubview:view];
    
}

-(void)bnt_action:(id)sender
{
    AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    TeamJionVC *nextvc = [[UIStoryboard storyboardWithName:@"Team" bundle:nil] instantiateViewControllerWithIdentifier:@"teamjionvc"];
    

    
    
    [app.window.rootViewController presentViewController:nextvc animated:YES completion:^(){
    
    }];
    
    
}

@end
