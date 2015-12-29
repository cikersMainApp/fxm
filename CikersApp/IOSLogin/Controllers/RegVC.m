//
//  RegVC.m
//  TeaLife
//
//  Created by fxm on 15/12/15.
//  Copyright © 2015年 administrater. All rights reserved.
//

#import "RegVC.h"

@interface RegVC ()

@end

@implementation RegVC

- (void)viewDidLoad {
    [super viewDidLoad];
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

- (IBAction)getVercodeAction:(UIButton *)sender
{
    //检测是否是有效手机号码
    
    if (_tf_phone.text.length < 11 || _tf_phone.text.length > 13)
    {
        
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入有效手机号码" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alert show];
        
        return;
    }
    
    [APSProgress showIndicatorView];
    //设置为NO的时候，走本类的delegate，设置为YES的时候，就走的CommonCallback里的delegate，CommonCallbackDelegate作为接收result用
    Api* _api = [[Api alloc] initWithDelegate:self needCommonProcess:NO];
    [_api getVerityCode:_tf_phone.text];
    
}


- (void)finishedWithRequest:(HttpRequest *)request
                   Response:(HttpResponse *)response
                   AndError:(NSError *)error
{
    
    [APSProgress hidenIndicatorView];
    
    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:response.responseData options:NSJSONReadingAllowFragments error:&error];
    
    NSObject *_object = [dic objectForKey:@"e"];
    
    NSLog(@"_object :%@",dic);
    
    NSString *_message = [dic objectForKey:@"msg"];
    
    int json_e = [(NSNumber*)_object intValue];
    
    if (json_e==0)
    {
        
        
    }
    else
    {
        
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"提示" message:_message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alert show];
        
    }
    
}

- (void) callbackResult:(id) result
{
    
}

#pragma mark -
#pragma mark TextFile
- ( BOOL )textField:( UITextField  *)textField shouldChangeCharactersInRange:( NSRange )range replacementString:( NSString  *)string
{
    
    if (textField.tag != 10) {
        
        return YES;
    }
    
    //判断验证码是否正确
    
    NSMutableString *_temp_vcode = [NSMutableString stringWithString:_tf_phone.text];
    
    [_temp_vcode appendString:string];
    
    if (_temp_vcode.length > 4)
    {
        _tf_phone.text = _temp_vcode;
    }
    
    
    return YES;
}

@end
