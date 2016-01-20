//
//  PublishActivityVC.m
//  CikersApp
//
//  Created by fxm on 16/1/11.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "PublishActivityVC.h"
#import "KTSelectDatePicker.h"

@interface PublishActivityVC ()
@property (strong, nonatomic) KTSelectDatePicker *selectPicker;

@end

@implementation PublishActivityVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.lb_phone.text = [[NSUserDefaults standardUserDefaults] objectForKey:KEY_USER_LOGIN_NAME];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)bnt_time:(id)sender
{
    _selectPicker = [[KTSelectDatePicker alloc] init];
    __weak typeof(self) weakSelf = self;
    [_selectPicker didFinishSelectedDate:^(NSDate *selectedDate) {
        
        NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setAMSymbol:@"上午"];
        [dateFormatter setPMSymbol:@"下午"];
        [dateFormatter setDateFormat:@"yyyy-MM-dd aaa hh:mm"];
        NSString * string = [dateFormatter stringFromDate:selectedDate];
        
        weakSelf.lb_time.text = string;
        weakSelf.lb_time.textColor = [UIColor blackColor];
    }];

    
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{

    if ([textView.text isEqual:@"活动描述，如训练、野球等。"]) {
        
        textView.text = @"";
    }
    
    
    return YES;
}
- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    if ([textView.text isEqual:@""]) {
        
        textView.text = @"活动描述，如训练、野球等。";
    }
    return YES;
}

@end
