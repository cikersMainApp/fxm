//
//  GameMainContent.m
//  CikersApp
//
//  Created by fxm on 15/12/31.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "GameMainContent.h"
#import "GameSection1.h"
#import "GameTableView.h"
@implementation GameMainContent
-(void)initUI
{
    [self setFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    
    
    // create droppy
    self.droppy = [[DroppyScrollView alloc] initWithFrame:self.frame];
    [self.droppy setDefaultDropLocation:DroppyScrollViewDefaultDropLocationBottom];
    [self addSubview:self.droppy];
    
    self.index = 6;
    
    
    [self initWiki];
    [self inithead];
    
    
}

- (void)addButtonPressed:(id)sender {
    UILabel *v = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, ScreenHeight-20, 50 + arc4random()%100)];
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
    
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"GameSection1" owner:nil options:nil];
    GameSection1 *view = [views lastObject];
    
    [view setFrame:CGRectMake(0, 0, ScreenWidth, 500)];
    
    
    NSLog(@"view----------%f-----%f",view.frame.size.height,view.frame.size.width);

    
    [self.droppy dropSubview:view];
    
}
-(void)initWiki
{
    GameTableView *view = [[GameTableView alloc] initWithFrame:CGRectMake(0, 0, ScreenHeight, ScreenHeight)];

    view.delegate = view;
    view.dataSource = view;
    
    [self.droppy dropSubview:view];
    
}

-(void)bnt_action:(id)sender
{
    AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
//    TeamJionVC *nextvc = [[UIStoryboard storyboardWithName:@"Team" bundle:nil] instantiateViewControllerWithIdentifier:@"teamjionvc"];
    
    
    
    
//    [app.window.rootViewController presentViewController:nextvc animated:YES completion:^(){
//        
//    }];
    
    
}

@end
