//
//  RegVC.m
//  TeaLife
//
//  Created by fxm on 15/12/15.
//  Copyright © 2015年 administrater. All rights reserved.
//

#import "RegVC.h"
#import "LoginData.h"
#import "RegOKVC.h"
@interface RegVC ()

@end

@implementation RegVC

- (void)viewDidLoad {
    [super viewDidLoad];
    

    // Do any additional setup after loading the view.
    self.tf_phone.tag=TAG_TF_PHONE;
    self.tf_pwd.tag=TAG_TF_PWD;
    self.tf_vcode.tag=TAG_TF_VCODE;
    
    self.bt_send.hidden = YES;
    self.operation = [[HLLoginOperation alloc] init];
    
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

- (IBAction)getVercodeAction:(UIButton *)sender
{
    
    
    if (self.tf_phone.text.length < 11) {
        
        [APSProgress showToast:self.view withMessage:@"请输入有效手机号码"];
        return;
    }
    
    
    [self.operation vericodeGetByPhone:self.tf_phone.text completeBlock:^(id result, NSError *error) {
        
        NSString *e = [result objectForKey:@"e"];
        int valeu = (int)[e intValue];
        if (valeu != -1) {
            __weak typeof(self) weakSelf = self;
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.bt_getVcode.userInteractionEnabled = NO;
                [weakSelf.bt_getVcode setTitle:@"60秒后重发" forState:UIControlStateNormal];
                [weakSelf.bt_getVcode changeStatus];
                [weakSelf countDown];
            });
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
                self.bt_getVcode.userInteractionEnabled = YES;
                [self.bt_getVcode changeStatus];
                [self.bt_getVcode setTitle:@"获取验证码" forState:UIControlStateNormal];
                self.bt_getVcode.countDownLabel.text = @"";
                self.bt_getVcode.userInteractionEnabled = YES;
            });
        }else{
            int seconds = timeout;
            NSString *strTime = [NSString stringWithFormat:@"%d秒后重发", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.bt_getVcode setTitle:@"" forState:UIControlStateNormal];
                self.bt_getVcode.countDownLabel.text = strTime;
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}


- (IBAction)getSend:(UIButton *)sender
{

    [LoginData saveValue:_tf_vcode.text key:KEY_USER_VCODE];
    [LoginData saveValue:_tf_pwd.text key:KEY_USER_PWD];
    [LoginData saveValue:_tf_phone.text key:KEY_USER_LOGIN_NAME];
    
    
    //跳转到下一个页面
    
    RegOKVC *vc_next  = [[UIStoryboard storyboardWithName:@"Login" bundle:nil] instantiateViewControllerWithIdentifier:@"regokvc"];
    
    [self.navigationController showViewController:vc_next sender:NULL];
    
}


#pragma mark -
#pragma mark network

- (void)finishedWithRequest:(HttpRequest *)request
                   Response:(HttpResponse *)response
                   AndError:(NSError *)error

{
    [APSProgress hidenIndicatorView];
}

#pragma mark -
#pragma mark TextFile
- ( BOOL )textField:( UITextField  *)textField shouldChangeCharactersInRange:( NSRange )range replacementString:( NSString  *)string
{
    
    switch (textField.tag) {
        case TAG_TF_PHONE:
        {
            NSMutableString *_temp_vcode = [NSMutableString stringWithString:_tf_phone.text];
            
            [_temp_vcode appendString:string];
            
            if (_temp_vcode.length > 11)
            {
                _tf_phone.text = _temp_vcode;
                
                return YES;
            }
        }
            break;
        case TAG_TF_PWD:
        {
            
            if (![self.tf_phone.text isEqual:@""]  && ![self.tf_vcode.text isEqual:@""])
            {
                self.bt_send.hidden = NO;
                return YES;

            }
            
            
        }
            break;
        case TAG_TF_VCODE:
        {
            if (![self.tf_phone.text isEqual:@""]  && ![self.tf_pwd.text isEqual:@""])
            {
                self.bt_send.hidden = NO;
                return YES;

            }
            
        }
            break;
        default:
            break;
    }
    
    
    
    
    return YES;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    
//    textField.text=@"";
    
    return true;
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
    
}
@end
