//
//  CreatTeam.m
//  CikersApp
//
//  Created by fxm on 15/12/21.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "CreatTeam.h"
#import "Api.h"
#import "CreatTeamIconVC.h"
#import "YMUtils.h"
#import "AddressPickerViewC.h"
#import "TeamMainVC.h"
#import "HLNavgationController.h"
#import "ClityListDatePick.h"
@interface CreatTeam ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate,UITextFieldDelegate,BaseApiDelegate,UIActionSheetDelegate>

@end

@implementation CreatTeam
{
    NSInteger row1;
    NSInteger row2;
    
    NSString *proviceStr;  //省
    NSString *districtStr; //区
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    proviceStr = @"北京市";
    districtStr = @"海淀区";
    
    NSString * dic = [[NSBundle mainBundle] pathForResource:@"city" ofType:@"plist"];
    
    NSArray *data = [[NSArray alloc] initWithContentsOfFile:dic];
    self.clity =[[ClityListDatePick alloc] initWithFrame:self.view.bounds];
    self.clity.dataArr = data;
    
    self.clity.block = ^(NSString *cityList1,NSString *cityList2){
        
        proviceStr = cityList1;
        districtStr= cityList2;
        
    };
    
    [self.view addSubview:self.clity];
    
    self.clity.hidden = YES;


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
-(IBAction)bnt_back
{

    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(IBAction)bnt_selectImg
{
    UIActionSheet *ac = [[UIActionSheet alloc] initWithTitle:@"选择图片的来源" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"相机" otherButtonTitles:@"相册",@"选择队徽", nil];
    
    [ac showInView:self.view];
    
}
-(IBAction)bnt_selectAddress
{
    self.clity.hidden = NO;

}

-(IBAction)bnt_send
{
    
    if ([self.tf_name.text isEqual:@""] || [self.tf_name.text isEqual:@"请输入球队名称"])
    {
        [APSProgress showToast:self.view withMessage:@"请填写球队名"];
        return;
    }
    if (self.encodedImageStr == nil) {
        
        [APSProgress showToast:self.view withMessage:@"请上传队徽"];
        return;
    }
    
    Api *api = [[Api alloc] initWithDelegate:self needCommonProcess:nil];
    
    
    [api user_creatTeam:@"-1" phone:@"" address:proviceStr tags:districtStr sportscat:@"0" name:self.tf_name.text portraint:@""];
    
    
}


#pragma mark -
#pragma mark network

-(void)finishedWithRequest:(HttpRequest *)request Response:(HttpResponse *)response AndError:(NSError *)error
{

    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:response.responseData options:NSJSONReadingAllowFragments error:&error];

    
    if (dic == nil) {
        
        [APSProgress showToast:self.view withMessage:@"接口错误"];
        
        return;
    }
    
    NSObject *_object = [dic objectForKey:@"e"];
    
    NSLog(@"_object :%@",dic);
    
    int json_e = [(NSNumber*)_object intValue];

    
    
    NSString *tag = request.apiName;
    
    if ([tag isEqual:NET_TEAM_REG])
    {
        
        if (json_e != 0) {
            
            [APSProgress showToast:self.view withMessage:[dic objectForKey:@"msg"]];
            
            [APSProgress hidenIndicatorView];
            
            return;
        }
        
        Api *api = [[Api alloc] initWithDelegate:self needCommonProcess:nil];

        [api team_uploadByid:@"" img:self.encodedImageStr];
        
    }
    
    if ([tag isEqual:NET_TEAM_LOGO])
    {
        if (json_e != 0) {
            
            [APSProgress showToast:self.view withMessage:[dic objectForKey:@"msg"]];
            
            [APSProgress hidenIndicatorView];
            
            return;
        }
        
        HLNavgationController *  loginNav =  [[UIStoryboard storyboardWithName:@"Team" bundle:nil] instantiateViewControllerWithIdentifier:@"team"];
        AppDelegate * appDele = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        appDele.window.rootViewController = loginNav;
    }
    
    
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    switch (buttonIndex) {
        case 3:
        {
        
        }
            break;
        case 2:// 添加一个新的页面
        {
            CreatTeamIconVC *nextvc = [[UIStoryboard storyboardWithName:@"TeamCreat" bundle:nil] instantiateViewControllerWithIdentifier:@"creatteamiconvc"];
            
            [self.navigationController showViewController:nextvc sender:nil];
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
#pragma mark TextFile
- ( BOOL )textField:( UITextField  *)textField shouldChangeCharactersInRange:( NSRange )range replacementString:( NSString  *)string
{
    
    
    
    return YES;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    
    textField.text=@"";
    
    return true;
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
    if ([textField.text isEqual:@""]) {
        textField.text = @"请输入球队名称";
    }
    
    
}


#pragma mark -
#pragma mark 地址选择器


//-(IBAction)returnOkaddress
//{
//    
//    _view_picbg.hidden = YES;
//    
//    //在这里隐藏该页面
//    
//    [_bt_address setTitle:[NSString stringWithFormat:@"%@-%@",proviceStr,districtStr] forState:UIControlStateNormal];
//    
//}
//-(IBAction)returnCanceladdress
//{
//    
//}

-(IBAction)showAddressPic
{
    
    self.clity.hidden = NO;
    
}

-(void)returnSelectContent:(NSString *)address
{
    
    [_bt_address setTitle:[NSString stringWithFormat:@"%@-%@",proviceStr,districtStr] forState:UIControlStateNormal];
    
}
////返回显示的列数
//- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
//{
//    if (pickerView == self.cityPicker) {
//        return 2;
//    }
//    else
//        return 1;
//}
//
////返回当前列显示的行数
//- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
//    
//    
//    switch (component) {
//        case 0:
//        {
//            NSArray *array = [YMUtils getCityData][0][@"children"];
//            if ((NSNull*)array != [NSNull null]) {
//                return array.count;
//            }
//            return 0;
//            
//        }
//            break;
//        case 1:
//        {
//            NSArray *array = [YMUtils getCityData][0][@"children"];
//            if ((NSNull*)array != [NSNull null]) {
//                NSArray *array1 = [YMUtils getCityData][0][@"children"][row1][@"children"];
//                if ((NSNull*)array1 != [NSNull null]) {
//                    return array1.count;
//                }
//                return 0;
//            }
//            return 0;
//            
//        }
//            break;
//        default:
//            break;
//    }
//    
//    return 0;
//}
////设置当前行的内容
//- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
//    
//    if(component == 0) {
//        return [YMUtils getCityData][0][@"children"][row][@"name"];
//        
//        
//    }
//    else if (component == 1) {
//        return [YMUtils getCityData][0][@"children"][row1][@"children"][row][@"name"];
//    }
//    else if (component == 3) {
//        return [YMUtils getCityData][row1][@"children"][row2][@"children"][row][@"name"];
//    }
//    return nil;
//    
//}
////选择的行数
//- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
//    if (component == 0) {
//        row1 = row;
//        row2 = 0;
//        [self.cityPicker reloadComponent:1];
//    }
//    else if (component == 1){
//        row2 = row;
//    }
//    NSInteger cityRow1 = [self.cityPicker selectedRowInComponent:0];
//    NSInteger cityRow2 = [self.cityPicker selectedRowInComponent:1];
//    NSMutableString *str = [[NSMutableString alloc]init];
//    [str appendString:[YMUtils getCityData][0][@"children"][cityRow1][@"name"]];
//    
//    
//    NSLog(@"%@",str);
//    
//    proviceStr = str;
//    
////    NSInteger a = [str replaceOccurrencesOfString:proviceStr withString:@"" options:NSLiteralSearch  range:NSMakeRange(0, [str length])];
////    
////    districtStr = str;
////    
////    
////    NSLog(@"%@",districtStr);
//    
//    
//    NSArray *array = [YMUtils getCityData][0][@"children"][cityRow1][@"children"];
//    if ((NSNull*)array != [NSNull null]) {
//        
//        districtStr =[YMUtils getCityData][0][@"children"][cityRow1][@"children"][cityRow2][@"name"];
//        
//        NSLog(@"%@",districtStr);
//        
//        
//        NSArray *array1 = [YMUtils getCityData][0][@"children"][cityRow1][@"children"][cityRow2][@"children"];
//        if ((NSNull*)array1 != [NSNull null]) {
////            [str appendString:[YMUtils getCityData][0][@"children"][cityRow1][@"children"][cityRow2][@"name"]];
//            
//        }
//    }
////    self.cityLabel.text = str;
//    
//    
//    
//}
////每行显示的文字样式
//- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
//{
//    
//    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 107, 30)];
//    titleLabel.textAlignment = NSTextAlignmentCenter;
//    titleLabel.font = [UIFont systemFontOfSize:14];
//    titleLabel.backgroundColor = [UIColor clearColor];
//    if (component == 0) {
//        titleLabel.text = [YMUtils getCityData][0][@"children"][row][@"name"];
//    }
//    else if (component == 1) {
//        titleLabel.text = [YMUtils getCityData][0][@"children"][row1][@"children"][row][@"name"];
//    }
//    else {
//        titleLabel.text = [YMUtils getCityData][row1][@"children"][row2][@"children"][row][@"name"];
//    }
//    return titleLabel;
//    
//}



@end
