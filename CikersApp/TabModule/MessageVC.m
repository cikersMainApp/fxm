//
//  MessageVC.m
//  CikersApp
//
//  Created by fxm on 15/12/24.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "MessageVC.h"
#import "MatchVC.h"
//#import "CustomHeaderViewController.h"

@interface MessageVC()

- (IBAction)customHeader:(id)sender;

@end


@implementation MessageVC


- (IBAction)customHeader:(id)sender
{
    
    MatchVC *nextvc = [[UIStoryboard storyboardWithName:@"Match" bundle:nil] instantiateViewControllerWithIdentifier:@"match"];
    
    [self presentViewController:nextvc animated:YES completion:nil];
    
//    MatchVC *customHeader = [[MatchVC alloc] init];
    
//    [self.navigationController pushViewController:customHeader animated:YES];


}

- (void)viewDidLoad
{
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
