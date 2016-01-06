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
#import "DicUserinfo.h"
#import "RMMapper.h"
#import "NSUserDefaults+RMSaveCustomObject.h"
#import "ARLabel.h"

@interface HLLoginViewController ()<UITextFieldDelegate,HLLoginInfoViewDelegate>
@property (nonatomic,strong) HLLoginOperation * operation;
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
        
    self.operation = [[HLLoginOperation alloc] init];

    self.tf_name.text = @"18610932023";
    self.tf_pwd.text = @"123";
    
    
    ARLabel *test = [[ARLabel alloc] initWithFrame:CGRectMake(0, 400, 100, 100)];
    test.text=@"我是测试文我是测试文";
    [self.view addSubview:test];
    
    

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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
//    [self.navigationController setNavigationBarHidden:NO animated:YES];

}


- (IBAction)getVericodeMethod:(id)sender {
    
    
//    [AppDelegate setTabRoot];
//    
//    return;
//    
    
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
            
            //解析数据
            
            NSDictionary *data=[result objectForKey:@"data"];
            DicUserinfo *user = [RMMapper objectWithClass:[DicUserinfo class] fromDictionary:data];
            
            [[NSUserDefaults standardUserDefaults] rm_setCustomObject:user forKey:@"user"];
            
            
            [[NSUserDefaults standardUserDefaults] setValue:user.entityId forKey:@"userid"];
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"login"];
            
//            [LoginData saveValue:self.tf_name.text key:KEY_USER_LOGIN_NAME];
//            [LoginData saveValue:self.tf_pwd.text key:KEY_USER_PWD];
            
        }
        else
        {
            [APSProgress showHUDAddedTo:self.view message:[result objectForKey:@"msg"] animated:YES];
        }
        
    }];
    
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
