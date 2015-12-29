//
//  HLVericodeViewController.m
//  TeaLife
//
//  Created by administrater on 15/12/7.
//  Copyright © 2015年 administrater. All rights reserved.
//

#import "HLVericodeViewController.h"
#import "HLLoginOperation.h"
@interface HLVericodeViewController ()
@property (nonatomic,strong) HLLoginOperation * operation;
@property (weak, nonatomic) IBOutlet UITextField *vericodeTF;
- (IBAction)loginMethod:(id)sender;
@end

@implementation HLVericodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.operation = [[HLLoginOperation alloc] init];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)loginMethod:(id)sender {
    NSUserDefaults * config = [NSUserDefaults standardUserDefaults];
    [self.operation verifyVericodeByPhone:[config objectForKey:PHONE_NUMBER] vericode:self.vericodeTF.text completeBlock:^(id result, NSError *error) {
        
    }];
}
@end
