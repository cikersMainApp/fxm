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
#import "VOSegmentedControl.h"
#import "DicTeaminfo.h"
#import "RMMapper.h"
#import "NSUserDefaults+RMSaveCustomObject.h"
@interface CreatTeam ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate,UITextFieldDelegate,BaseApiDelegate,UIActionSheetDelegate>

@property(nonatomic,strong)Api *api;


@end

@implementation CreatTeam
{
    NSInteger row1;
    NSInteger row2;
    
    NSString *proviceStr;  //省
    NSString *districtStr; //区
}

-(void)viewWillAppear:(BOOL)animated
{

    if (self.selectIcon == nil) {
        return;
    }
    
    if (!self.isSelectOther)
    {
        return;
    }
    
    
    
    self.isSelectOther = NO;
    
    [self.bt_img setBackgroundImage:[UIImage imageNamed:self.selectIcon] forState:UIControlStateNormal];

    UIImage *image1 = [UIImage imageNamed:self.selectIcon];
    NSData *data = UIImagePNGRepresentation(image1);
    _encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    
    self.selectIcon = @"";
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.api = [[Api alloc] initWithDelegate:self needCommonProcess:nil];

    self.isSelectOther = NO;
    
    proviceStr = @"北京市";
    districtStr = @"海淀区";
    [self.bt_address setTitle:[NSString stringWithFormat:@"%@-%@",proviceStr,districtStr] forState:UIControlStateNormal];

    NSString * dic = [[NSBundle mainBundle] pathForResource:@"city" ofType:@"plist"];
    
    NSArray *data = [[NSArray alloc] initWithContentsOfFile:dic];
    self.clity =[[ClityListDatePick alloc] initWithFrame:self.view.bounds];
    self.clity.dataArr = data;
    
    
    
    __typeof (self) __weak weakSelf = self;

    self.clity.block = ^(NSString *cityList1,NSString *cityList2){
        
        proviceStr = cityList1;
        districtStr= cityList2;
        [weakSelf.bt_address setTitle:[NSString stringWithFormat:@"%@-%@",cityList1,cityList2] forState:UIControlStateNormal];
        weakSelf.clity.hidden = YES;

    };
    
    [self.view addSubview:self.clity];
    
    self.clity.hidden = YES;


    
    
    
//    VOSegmentedControl *segctrl1 = [[VOSegmentedControl alloc] initWithSegments:@[@{VOSegmentText: @"足球"},
//                                                                                  @{VOSegmentText: @"篮球"},
//                                                                                  @{VOSegmentText: @"其它"}]];
//    segctrl1.contentStyle = VOContentStyleTextAlone;
//    segctrl1.indicatorStyle = VOSegCtrlIndicatorStyleBox;
//    segctrl1.textColor = [UIColor whiteColor];
//    segctrl1.selectedTextColor = [UIColor orangeColor];
//    segctrl1.backgroundColor = [UIColor clearColor];
//    segctrl1.selectedBackgroundColor = [UIColor orangeColor];
//    segctrl1.allowNoSelection = NO;
//
//    segctrl1.frame = CGRectMake(90, 10, ScreenWidth-130, self.view_segbg.frame.size.height);
//    
//    segctrl1.indicatorThickness = 4;
//    segctrl1.tag = 1;
//    [self.view_segbg addSubview:segctrl1];
//    [segctrl1 setIndexChangeBlock:^(NSInteger index) {
//        NSLog(@"1: block --> %@", @(index));
//        
//        self.seg_type.selectedSegmentIndex = index;
//        
//    }];
//    [segctrl1 addTarget:self action:@selector(segment_action1:) forControlEvents:UIControlEventValueChanged];
//    
    
    
//    self.seg_type.hidden = YES;

}
-(void)segment_action1:(id)sender
{

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
    
    
    [APSProgress showIndicatorView];
    
    
    
    [self.api user_creatTeam:@"-1"
                  phone:@""
                address:proviceStr
                   tags:districtStr
              sportscat:[NSString stringWithFormat:@"%ld",self.seg_type.selectedSegmentIndex+1]
                   name:self.tf_name.text
              portraint:@""];
    
    
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


    if ([self.api.http_tag isEqual:NET_TEAM_REG])
    {
        
        if (json_e != 0) {
            
            [APSProgress showToast:self.view withMessage:[dic objectForKey:@"msg"]];
            
            [APSProgress hidenIndicatorView];
            
            return;
        }
        
    
        NSDictionary *data = [dic objectForKey:@"data"] ;
        DicTeaminfo *teaminfo = [RMMapper objectWithClass:[DicTeaminfo class] fromDictionary:data];
        
        

        [self.api team_uploadByid:teaminfo.id img:[NSString stringWithFormat:@"%@%@",@"data:image/jpeg;base64,",_encodedImageStr]];
        
    }
    
    if ([self.api.http_tag  isEqual:NET_TEAM_LOGO])
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
            
            self.isSelectOther = YES;
            
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


-(IBAction)showAddressPic
{
    
    self.clity.hidden = NO;
    
}

-(void)returnSelectContent:(NSString *)address
{
    
    [_bt_address setTitle:[NSString stringWithFormat:@"%@-%@",proviceStr,districtStr] forState:UIControlStateNormal];
    
}


@end
