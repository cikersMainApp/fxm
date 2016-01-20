//
//  PublishPersonalVC.m
//  CikersApp
//
//  Created by fxm on 16/1/11.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "PublishPersonalVC.h"
#import "AGImagePickerController.h"
#import "AGIPCToolbarItem.h"
#import "PublishPersonalList.h"
#import "AFNetworking.h"
#import "PublishImageView.h"
#import "AFNetworkReachabilityManager.h"
#import "AFNetworking/AFHTTPSessionManager.h"
#import "TZImagePickerController.h"
#import "TZPhotoPickerController.h"
@interface PublishPersonalVC ()

@property(nonatomic,strong)AGImagePickerController *ipc;

@end



@implementation PublishPersonalVC


-(void)viewWillAppear:(BOOL)animated
{
    
    if (self.str_selectUser == nil)
    {
        return;
    }
    
    NSString *temp_str = [NSString stringWithFormat:@"%@[@%@]",self.tfview_input.text,self.str_selectUser];
    
    self.tfview_input.text = temp_str;
    
    [self.tfview_input becomeFirstResponder];

    self.str_selectUser = nil;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.array_bnt = [[NSMutableArray alloc] init];
    self.array_imgs= [[NSMutableArray alloc] init];
    [self.array_imgs addObject:@"bnt_add"];
    self.array_marks = [[NSMutableArray alloc] init];
    [self initUI];
    
    
    
    __block PublishPersonalVC *blockSelf = self;
    
//    self.ipc = [AGImagePickerController sharedInstance:self];
//    self.ipc.didFailBlock = ^(NSError *error) {
//        NSLog(@"Fail. Error: %@", error);
//        
//        if (error == nil) {
//            [blockSelf.array_imgs removeAllObjects];
//            [blockSelf.array_imgs addObject:@"bnt_add"];
//
//            NSLog(@"User has cancelled.");
//            
//            [blockSelf dismissViewControllerAnimated:YES completion:nil];
//        } else {
//            
//            // We need to wait for the view controller to appear first.
//            double delayInSeconds = 0.5;
//            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
//            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
//                [blockSelf dismissViewControllerAnimated:YES completion:nil];
//            });
//        }
//        
//        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
//        
//    };
//    self.ipc.didFinishBlock = ^(NSArray *info) {
//        [blockSelf.array_imgs setArray:info];
//        
//        if ([blockSelf.array_imgs count] <9)
//        {
//            [blockSelf.array_imgs addObject:@"bnt_add"];
//        }
//        NSLog(@"Info: %@", info);
//        
//        [blockSelf reloadImgsView];
//        
//        [blockSelf dismissViewControllerAnimated:YES completion:nil];
//        
//        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
//    };
//    
    
    
    
    
    
    
}

-(UIImage*)userSelectImg:(ALAsset*)asset
{
    // 处理被iOS自带Photos修改过的图片
    
    if ([asset isEqual:@"bnt_add"])
    {
        return [UIImage imageNamed:@"bnt_add"];
    }
    
    CGImageRef  ref = [asset thumbnail];
    
    return [[UIImage alloc]initWithCGImage:ref];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark

-(void)initUI
{

    
    self.view_imgsbg= [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 50)];
    [self.view_imgsbg setBackgroundColor:[UIColor whiteColor]];
    self.view_cell1 = [[UIView alloc] initWithFrame:CGRectMake(0, 5 + self.view_imgsbg.frame.origin.y + self.view_imgsbg.frame.size.height, ScreenWidth, 50)];
    [self.view_cell1 setBackgroundColor:[UIColor whiteColor]];
    self.view_cell2 = [[UIView alloc] initWithFrame:CGRectMake(0, 3 + self.view_cell1.frame.origin.y + self.view_cell1.frame.size.height, ScreenWidth, 80)];
    [self.view_cell2 setBackgroundColor:[UIColor whiteColor]];
    
    [self.view_cellbg addSubview:self.view_imgsbg];
    [self.view_cellbg addSubview:self.view_cell1];
    [self.view_cellbg addSubview:self.view_cell2];
    

    [self reloadImgsView];
    
}

-(void)reloadImgsView
{
    
    
    for(UIView *view in [self.view_imgsbg subviews])
    {
        [view removeFromSuperview];
    }
    
    float b_width = (ScreenWidth - 5 - 5 - 5- 5 - 5)/4.0f;
    
    for (int i = 0; i< [self.array_imgs count]; i++)
    {
        
        int w = i%4;
        
        UIImage *image = [self userSelectImg:[self.array_imgs objectAtIndex:i]];

        if ([self.array_imgs count] == 1 || ([self.array_imgs count]<9 && i == [self.array_imgs count]-1))
        {
            UIButton *bt = [[UIButton alloc] initWithFrame:CGRectMake(5+w*(b_width+5), 10 + (i/4)*b_width, b_width, b_width)];
            [bt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            
            [bt setBackgroundImage:image forState:UIControlStateNormal];
            [bt addTarget:self action:@selector(openSelect:) forControlEvents:UIControlEventTouchUpInside];
            [self.view_imgsbg addSubview:bt];
            [bt.layer setMasksToBounds:YES];
            [bt.layer setCornerRadius:10.0f];
            [bt.layer setBorderWidth:1.0];
        }
        else
        {
        
            PublishImageView *imageview = [[PublishImageView alloc] initWithFrame:CGRectMake(5+w*(b_width+5), 10 + (i/4)*b_width, b_width, b_width)];
            [imageview setImage:image];
            [self.view_imgsbg addSubview:imageview];
            imageview.userInteractionEnabled = YES;
            [imageview addButtonForUI:i];
            
            __typeof (self) __weak weakSelf = self;
            
            [imageview setClickBytag:^(int tag) {
                
                [weakSelf.array_imgs removeObjectAtIndex:tag];
                [weakSelf reloadImgsView];
            }];
            
            
        }

        
    }
    self.view_imgsbg.frame = CGRectMake(0, 0, ScreenWidth,30+([self.array_imgs count]/4+1)*b_width);
    
    self.view_cell1.frame = CGRectMake(0, 5 + self.view_imgsbg.frame.origin.y + self.view_imgsbg.frame.size.height, ScreenWidth, 50);
    self.view_cell2.frame = CGRectMake(0, 3 + self.view_cell1.frame.origin.y + self.view_cell1.frame.size.height, ScreenWidth, 80);

    
    
}


-(void)bt_del:(UIButton*)sender
{

    NSInteger index = sender.tag;
    
    [self.array_imgs removeObjectAtIndex:index];
    
    [self reloadImgsView];
    
}

-(void)openSelect:(id)sender
{
    __block PublishPersonalVC *blockSelf = self;
    
    

    
    _imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9 delegate:nil];
    
    [_imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets) {
        
        [blockSelf.array_imgs setArray:assets];
        
        if ([blockSelf.array_imgs count] <9)
        {
            [blockSelf.array_imgs addObject:@"bnt_add"];
        }
        NSLog(@"Info: %@", assets);
        
        [blockSelf reloadImgsView];
        
        
    }];

    [self presentViewController:_imagePickerVc animated:YES completion:nil];

    return;
    
    // Show saved photos on top
    self.ipc.shouldShowSavedPhotosOnTop = NO;
    self.ipc.shouldChangeStatusBarStyle = YES;
    self.ipc.selection = self.array_imgs;
    self.ipc.maximumNumberOfPhotosToBeSelected = 9;
    
    // Custom toolbar items
    AGIPCToolbarItem *selectAll = [[AGIPCToolbarItem alloc] initWithBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"全选" style:UIBarButtonItemStylePlain target:nil action:nil] andSelectionBlock:^BOOL(NSUInteger index, ALAsset *asset) {
        return YES;
    }];
    AGIPCToolbarItem *flexible = [[AGIPCToolbarItem alloc] initWithBarButtonItem:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil] andSelectionBlock:nil];
    AGIPCToolbarItem *selectOdd = [[AGIPCToolbarItem alloc] initWithBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"上次选择" style:UIBarButtonItemStylePlain target:nil action:nil] andSelectionBlock:^BOOL(NSUInteger index, ALAsset *asset) {
        return !(index % 2);
    }];
    AGIPCToolbarItem *deselectAll = [[AGIPCToolbarItem alloc] initWithBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"全部取消" style:UIBarButtonItemStylePlain target:nil action:nil] andSelectionBlock:^BOOL(NSUInteger index, ALAsset *asset) {
        return NO;
    }];
    self.ipc.toolbarItemsForManagingTheSelection = @[selectAll, flexible, selectOdd, flexible, deselectAll];
    
    [self presentViewController:self.ipc animated:YES completion:NULL];
    
    // Show first assets list, modified by springox(20140503)
    [self.ipc showFirstAssetsController];

}
#pragma mark -
#pragma mark TextView

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{

    if ([text isEqual:@"@"]) {
        
        
//        [textView resignFirstResponder];
        
        PublishPersonalList *nextvc = [[UIStoryboard storyboardWithName:@"Publish" bundle:nil] instantiateViewControllerWithIdentifier:@"publishpersonallist"];
        nextvc.preVc = self;
        
        [self presentViewController:nextvc animated:YES completion:nil];
        
        return NO;
    }
    
    
    return YES;
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    
    if ([textView.text isEqual:@"来，说点什么吧"]) {
        
        textView.text = @"";
    }
    
    
    return YES;
}
- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    if ([textView.text isEqual:@""]) {
        
        textView.text = @"来，说点什么吧";
    }
    return YES;
}


-(void)data_publish:(NSDictionary *)dic
{

}

-(IBAction)bnt_publish:(id)sender
{
    
    if ([self.tfview_input.text isEqual:@"来，说点什么吧"])
    {
        
        [APSProgress showToast:nil withMessage:@"未填写内容"];
        
        return;
    }
    
    PublishModel *model = [[PublishModel alloc] initWithDelegate:nil needCommonProcess:NO];
    model.delegate = self;
    
    //生成图片内容 images
    
    [self.array_imgs removeObject:@"bnt_add"];
    
    NSMutableString *images = [NSMutableString stringWithString:@"["];
    
    for (int i = 0; i< [self.array_imgs count] ; i++)
    {
        UIImage *image = [self userSelectImg:[self.array_imgs objectAtIndex:i]];
        
        NSData *data = UIImagePNGRepresentation(image);
        
        NSString *num1= [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        
        NSString *num = [NSString stringWithFormat:@"data:image/jpeg;base64,%@",num1];

        
        if (i+1 == [self.array_imgs count])
        {
            [images appendFormat:@"\"%@\"",num];
        }
        else
        {
            [images appendFormat:@"\"%@\",",num];
        }
    }
    
    [images appendString:@"]"];

    //生成@人员内容 marks
    
    NSMutableString *marks = [NSMutableString stringWithString:@"["];
    
    
    NSMutableDictionary *mutabledic = [[NSMutableDictionary alloc] init];
    
    for (NSDictionary *elem_dic in self.array_marks)
    {
        [mutabledic addEntriesFromDictionary:elem_dic];
    }
    

    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:mutabledic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    NSString *str = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];

    for (int i = 0; i< [self.array_marks count] ; i++)
    {
        NSDictionary * num = [self.array_marks objectAtIndex:i];
        
        if (i+1 == [self.array_marks count])
        {
            [marks appendString:@"{"];
            
            [marks appendString:@"\"id\":"];
            [marks appendFormat:@"%@,",[num objectForKey:@"id"]];
            [marks appendString:@"\"name\":"];
            [marks appendFormat:@"\"%@\"",[num objectForKey:@"name"]];
            
            [marks appendString:@"}"];
        }
        else
        {
            [marks appendString:@"{"];
            
            [marks appendString:@"\"id\":"];
            [marks appendFormat:@"%@,",[num objectForKey:@"id"]];
            [marks appendString:@"\"name\":"];
            [marks appendFormat:@"\"%@\"",[num objectForKey:@"name"]];

            [marks appendString:@"},"];
        }
    }
    
    [marks appendString:@"]"];
    
    
//    //生成文本
//    
//    [model sendWikiByPersonal:self.tfview_input.text
//                       images:images
//                        marks:str
//                      reftype:@"team"
//                        redid:[NSNumber numberWithInt:123]];
//    
//    
    
//    // 1.创建请求
//    NSURL *url = [NSURL URLWithString:@"http://newstack.cikers.com:8080/cikersapi/wiki/post/0"];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//    request.HTTPMethod = @"POST";
//    
//    // 2.设置请求头
//    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    [request setValue:@"PID_10803" forHTTPHeaderField:@"_CIKERS_KEY_"];
//    
//    // 3.设置请求体
//    
//    NSDictionary *params=@{@"wikitype":@"message",
//                           @"content":self.tfview_input.text,
//                           @"images":self.array_imgs,
//                           @"marks":self.array_marks,
//                           @"reftype":@"team",
//                           @"refid":@"1",
//                           };

    NSString *str1 = @"{wikitype: \"message\", content: \"123 [@球员1237号]\", images: [], marks: \"[]\", reftype: \"\", refid: \"\"}";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *str12 = @"{wikitype: \"message\", content: \"123 [@球员1237号]\", images: [], marks: \"[]\", reftype: \"\", refid: \"\"}";

    
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:@"PID_10803" forHTTPHeaderField:@"_CIKERS_KEY_"];
    
    NSLog(@"manager :%@",manager);
    
    
    [manager POST:@"http://newstack.cikers.com:8080/cikersapi/wiki/post/0"
       parameters:str12
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
              
              NSLog(@"===%@",task);
              
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              NSLog(@"===error%@",error);

          }];
    
    
}
@end
