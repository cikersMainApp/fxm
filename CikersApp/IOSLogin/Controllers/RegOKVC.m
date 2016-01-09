//
//  RegOKVC.m
//  CikersApp
//
//  Created by fxm on 15/12/20.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "RegOKVC.h"
#import "AppDelegate.h"
#import "Api.h"
#import "FollowVC.h"
#import "JCAlertView.h"
#import "PasswordChangeVC.h"
@interface RegOKVC ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate,BaseApiDelegate,UITextFieldDelegate>

@end

@implementation RegOKVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _api = [[Api alloc] initWithDelegate:self needCommonProcess:NO];

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

-(IBAction)bnt_selectOver
{
    if ([self.tf_name.text isEqual:@""]) {
        
        
        [APSProgress showToast:self.view withMessage:@"请输入姓名"];
        
        return;
    }
    
    
    [APSProgress showIndicatorView];
    
    [self.api register_first:[[NSUserDefaults standardUserDefaults] objectForKey:KEY_USER_LOGIN_NAME]
                         pwd:[[NSUserDefaults standardUserDefaults] objectForKey:KEY_USER_PWD]
                   validCode:[[NSUserDefaults standardUserDefaults] objectForKey:KEY_USER_VCODE]
                        name:self.tf_name.text
                       token:@"123"];
    

    
}
-(IBAction)bnt_selectImg
{

    UIActionSheet *ac = [[UIActionSheet alloc] initWithTitle:@"选择图片的来源" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"相机" otherButtonTitles:@"相册", nil];
    
    [ac showInView:self.view];
    
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{

    switch (buttonIndex) {
        case 2:
        {
        
        }
            break;
        case 1:
        {
            UIImagePickerController * picker = [[UIImagePickerController alloc]init];
            
            picker.delegate = self;
            
            picker.allowsEditing = YES;  //是否可编辑
            
            //相册
            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            
            [self presentViewController:picker animated:YES completion:nil];

        }
            break;
        case 0:
        {
            UIImagePickerController * picker = [[UIImagePickerController alloc]init];
            
            picker.delegate = self;
            
            picker.allowsEditing = YES;  //是否可编辑
            
            //摄像头
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            
            [self presentViewController:picker animated:YES completion:nil];

        }
            break;
        default:
            break;
    }
    
}

#pragma mark -
#pragma mark pic


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo {
    // ios 图片压缩
    
    NSData *imgData = UIImageJPEGRepresentation(image, 0.5);
    
    
    
    
    _encodedImageStr = [imgData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    
    
    [self.bt_img setBackgroundImage:[UIImage imageWithData:imgData] forState:UIControlStateNormal];
    
    
    NSArray  *cachePaths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    
    NSString *cachePathsDir = [cachePaths objectAtIndex:0];
    
    NSDate *  senddate=[NSDate date];
    
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    
    [dateformatter setDateFormat:@"YYYYMMddHHmmss"];
    
    NSString *  locationString=[dateformatter stringFromDate:senddate];
    
    
    NSString* imgFileFullPathWithName = [cachePathsDir stringByAppendingString:[NSString stringWithFormat:@"/%@.jpg",locationString]];
    
    
    if ([imgData writeToFile:imgFileFullPathWithName atomically:YES]) {
        
    }
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}



#pragma mark -
#pragma mark network

-(void)finishedWithRequest:(HttpRequest *)request Response:(HttpResponse *)response AndError:(NSError *)error
{
    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:response.responseData options:NSJSONReadingAllowFragments error:&error];
    
    
    
    if (dic == nil) {
        
        [APSProgress hidenIndicatorView];

        if (DEBUGSTATE) {
            
            [APSProgress showToast:self.view withMessage:@"接口错误"];
            
        }
        return;
    }
    
    
    NSObject *_object = [dic objectForKey:@"e"];
    
    NSLog(@"_object :%@",dic);
    
    int json_e = [(NSNumber*)_object intValue];
    
    
    NSString *httpTag = request.apiName;
    
    if ([httpTag isEqual:@"uploadavatar"]) {

        
        if (json_e!=0)
        {
            [APSProgress hidenIndicatorView];
            
            
            return;
        }

        
        [APSProgress hidenIndicatorView];

        //跳转到下一个页面
        
        FollowVC *vc_next  = [[UIStoryboard storyboardWithName:@"Login" bundle:nil] instantiateViewControllerWithIdentifier:@"select"];
        
        [self.navigationController showViewController:vc_next sender:NULL];
    }
    
    if ([httpTag isEqual:@"reg"]) {
        

        if (json_e==201)
        {
            [APSProgress hidenIndicatorView];

            [JCAlertView showTwoButtonsWithTitle:@"提示" Message:@"该手机号已经注册过" ButtonType:JCAlertViewButtonTypeWarn ButtonTitle:@"返回上一页" Click:^{
                
                [self.navigationController popViewControllerAnimated:YES];
                
            } ButtonType:JCAlertViewButtonTypeDefault ButtonTitle:@"找回密码" Click:^{
                
                
                PasswordChangeVC *vc_next  = [[UIStoryboard storyboardWithName:@"Login" bundle:nil] instantiateViewControllerWithIdentifier:@"passwordchangevc"];
                
                [self.navigationController showViewController:vc_next sender:NULL];
                
            }];
            

            return;
        }

        [self.api user_uploadUserPhoto:[[NSUserDefaults standardUserDefaults] objectForKey:KEY_USER_LOGIN_NAME] image64data:[NSString stringWithFormat:@"%@%@",@"data:image/jpeg;base64,",_encodedImageStr]];


    }
    
    
}

#pragma mark -
#pragma mark textfield

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField        // return NO to disallow editing.
{


    
    return true;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{

    return true;
}
@end
