//
//  HLLoginViewController.m
//  TeaLife
//
//  Created by Local on 15/12/6.
//  Copyright © 2015年 administrater. All rights reserved.
//

#import "HLLoginViewController.h"
#import "HLVericodeViewController.h"
#import "HLTFContainerView.h"
#import "HLLoginOperation.h"
#import "HLLoginInfoView.h"
#import "HLGetVericodeButton.h"
@interface HLLoginViewController ()<UITextFieldDelegate,HLLoginInfoViewDelegate>
@property (nonatomic,strong) HLLoginOperation * operation;
@property (nonatomic,strong) UILabel * l;
@property (strong, nonatomic) NSString *phoneNumString;
@property (weak, nonatomic) IBOutlet HLGetVericodeButton *getVericodeButton;
@property (weak, nonatomic) IBOutlet HLLoginInfoView *inputView;
- (IBAction)getVericodeMethod:(id)sender;
@end

@implementation HLLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.l = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 320, 40)];
    [self.view addSubview:self.l];
    self.operation = [[HLLoginOperation alloc] init];
    [self generateInputView];
    
    
//    [AppDelegate setTabRoot];

    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)generateInputView
{
    NSMutableArray * param = [[NSMutableArray alloc] init];
    [param addObject:@"请输入手机号"];
    [param addObject:@"请输入验证码"];
    
    _inputView.delegate = self;
    [_inputView initInputViewByParam:param];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)getVericodeMethod:(id)sender {
    
    
    [AppDelegate setTabRoot];

    
    return;
    
//vericode
    
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"HLLogin" bundle:nil];
    HLVericodeViewController *_vericode = [mainStoryboard instantiateViewControllerWithIdentifier:@"vericode"];

    [self.navigationController pushViewController:_vericode animated:YES];
    
    
//    
//    [self.operation vericodeGetByPhone:self.phoneNumString completeBlock:^(id result, NSError *error) {
//        if (!error) {
//            if ([result isKindOfClass:[NSString class]] && [result isEqualToString:@"发送成功"]) {
//                __weak typeof(self) weakSelf = self;
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    weakSelf.getVericodeButton.userInteractionEnabled = NO;
//                    [weakSelf.getVericodeButton setTitle:@"60秒后重发" forState:UIControlStateNormal];
//                    [weakSelf.getVericodeButton changeStatus];
//                    [weakSelf countDown];
//                });
//            }
//        }
//    }];
}

- (void) countDown
{
    __block int timeout=60; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_object_t _o = (_timer);
            _dispatch_object_validate(_o);
            dispatch_async(dispatch_get_main_queue(), ^{
                self.getVericodeButton.userInteractionEnabled = YES;
                [self.getVericodeButton changeStatus];
                [self.getVericodeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
                self.getVericodeButton.countDownLabel.text = @"";
                self.getVericodeButton.userInteractionEnabled = YES;
            });
        }else{
            int seconds = timeout;
            NSString *strTime = [NSString stringWithFormat:@"%d秒后重发", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.getVericodeButton setTitle:@"" forState:UIControlStateNormal];
                self.getVericodeButton.countDownLabel.text = strTime;
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}

- (void) recallForCanGetVericode:(BOOL) canGet
{
    if (self.getVericodeButton.userInteractionEnabled)
        self.getVericodeButton.enabled = canGet;
}

- (void) callbackWithFields:(NSArray *) fields;
{
    
}

- (void) sendPhone:(NSString *) phoneNumber
{
    self.phoneNumString = phoneNumber;
}

- (void) autoLoginWithVericode:(NSString *) vericode
{
    [self.operation verifyVericodeByPhone:self.phoneNumString vericode:vericode completeBlock:^(id result, NSError *error) {
        NSUserDefaults * config = [NSUserDefaults standardUserDefaults];
        [config setObject:self.phoneNumString forKey:PHONE_NUMBER];
        [config synchronize];
    }];
}
@end
