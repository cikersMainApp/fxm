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
#import "LoginData.h"
@interface HLLoginViewController ()<UITextFieldDelegate,HLLoginInfoViewDelegate>
@property (nonatomic,strong) HLLoginOperation * operation;
@property (nonatomic,strong) UILabel * l;
@property (strong, nonatomic) NSString *phoneNumString;
@property (weak, nonatomic) IBOutlet HLGetVericodeButton *getVericodeButton;
@property (weak, nonatomic) IBOutlet HLLoginInfoView *inputView;
- (IBAction)getVericodeMethod:(id)sender;


@property(nonatomic,weak)IBOutlet UITextField *tf_name;
@property(nonatomic,weak)IBOutlet UITextField *tf_pwd;

@end

@implementation HLLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.l = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 320, 40)];
    [self.view addSubview:self.l];
    
    self.operation = [[HLLoginOperation alloc] init];

    self.tf_name.text = @"18610932023";
    self.tf_pwd.text = @"123";

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)generateInputView
{
    NSMutableArray * param = [[NSMutableArray alloc] init];
    [param addObject:@"请输入手机号"];
    [param addObject:@"请输入密码"];
    
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
    
    
    if ([self.tf_name.text isEqual:@""] || [self.tf_pwd.text isEqual:@""])
    {
        [APSProgress showToast:self.view withMessage:@"输入有误"];
        
        return;
    }
    
    
    [self.operation userLoginByname:self.tf_name.text pwd:self.tf_pwd.text completeBlock:^(id result,NSError *error){
    
        [APSProgress hidenIndicatorView];
        
        NSObject *json_ob = [result objectForKey:@"e"];
        
        int json_e = [(NSNumber*)json_ob intValue];
        
        if (json_e == 0) {
            
            [AppDelegate setTabRoot];
            
//            [LoginData saveValue:self.tf_name.text key:KEY_USER_LOGIN_NAME];
//            [LoginData saveValue:self.tf_pwd.text key:KEY_USER_PWD];
            
        }
        else
        {
            [APSProgress showHUDAddedTo:self.view message:[result objectForKey:@"msg"] animated:YES];
        }
        
    }];
    
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
