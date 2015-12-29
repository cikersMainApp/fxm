//
//  PasswordChangeVC.m
//  TeaLife
//
//  Created by fxm on 15/12/15.
//  Copyright © 2015年 administrater. All rights reserved.
//


#import "PasswordChangeVC.h"
#import "Api.h"
#import "AppDelegate.h"
@interface PasswordChangeVC ()<BaseApiDelegate,UITextFieldDelegate>

@end

@implementation PasswordChangeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.operation = [[HLLoginOperation alloc] init];

    self.bt_send.hidden = YES;
    self.tf_phone.tag=TAG_TF_PHONE;
    self.tf_pwd.tag=TAG_TF_PWD;
    self.tf_vcode.tag=TAG_TF_VCODE;
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

    [self.operation vericodeGetByPhone:self.tf_phone.text completeBlock:^(id result, NSError *error) {

        
        NSString *e = [result objectForKey:@"e"];
        int valeu = (int)[e intValue];
        
        //不管发送成功与失败，都要等待60秒
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
    [APSProgress showIndicatorView];
    
    Api * api = [[Api alloc] initWithDelegate:self needCommonProcess:NO];

    [api user_rebackpwd:_tf_pwd.text phone:_tf_phone.text vcode:_tf_vcode.text];
    
}


#pragma mark -
#pragma mark network

- (void)finishedWithRequest:(HttpRequest *)request
                   Response:(HttpResponse *)response
                   AndError:(NSError *)error

{
    [APSProgress hidenIndicatorView];

    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:response.responseData options:NSJSONReadingAllowFragments error:nil];
    
    NSObject *json_ob = [dic objectForKey:@"e"];

    if ([(NSNumber*)json_ob intValue]==0)
    {
        
        [APSProgress showToast:self.view withMessage:@"修改完成"];
        
        [AppDelegate setLoginRoot];

    }
    else
    {
    
        [APSProgress showHUDAddedTo:self.view message:[dic objectForKey:@"msg"] animated:NO];
        
    }
    
    
    
    
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
                
                return NO;
            }
        }
            break;
        case TAG_TF_PWD:
        {
        
            if (![self.tf_phone.text isEqual:@""]  && ![self.tf_vcode.text isEqual:@""])
            {
                self.bt_send.hidden = NO;

            }
            
            
        }
            break;
        case TAG_TF_VCODE:
        {
            if (![self.tf_phone.text isEqual:@""]  && ![self.tf_pwd.text isEqual:@""])
            {
                self.bt_send.hidden = NO;
                
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


    textField.text=@"";
    
    return true;
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
    switch (textField.tag) {
        case TAG_TF_PHONE:
        {
            if ([self.tf_phone.text isEqual:@""]) {
                self.tf_phone.text = @"请输入手机号";
            }

        }
            break;
        case TAG_TF_PWD:
        {
            if ([self.tf_pwd.text isEqual:@""]) {
                self.tf_pwd.text = @"请输入新密码";
            }

        }
            break;
        case TAG_TF_VCODE:
        {
            if ([self.tf_vcode.text isEqual:@""]) {
                self.tf_vcode.text = @"请输入验证码";
            }

        }
            break;
        default:
            break;
    }
    
    


}


@end
