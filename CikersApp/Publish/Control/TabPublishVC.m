//
//  TabPublishVC.m
//  CikersApp
//
//  Created by fxm on 15/12/21.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "TabPublishVC.h"
#import "CreatTeam.h"
@interface TabPublishVC ()

@end

@implementation TabPublishVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    UIImage *image1 = [UIImage imageNamed:@"publish_bt1"];
    UIImage *image2 = [UIImage imageNamed:@"publish_bt2"];
    UIImage *image3 = [UIImage imageNamed:@"publish_bt3"];
    
    
    CKRadialMenu *radialView = [[CKRadialMenu alloc] initWithFrame:CGRectMake(self.view.center.x-25, self.view.frame.size.height - 120, 100, 100)];
    radialView.delegate = self;
    radialView.centerView.backgroundColor = [UIColor grayColor];
    [radialView addPopoutView:[[UIImageView alloc] initWithImage:image1] withIndentifier:@"ONE"];
    [radialView addPopoutView:[[UIImageView alloc] initWithImage:image2] withIndentifier:@"TWO"];
    [radialView addPopoutView:[[UIImageView alloc] initWithImage:image3] withIndentifier:@"THREE"];
    [self.view addSubview:radialView];
//    [radialView enableDevelopmentMode];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)radialMenu:(CKRadialMenu *)radialMenu didSelectPopoutWithIndentifier:(NSString *)identifier{
    NSLog(@"Delegate notified of press on popout \"%@\"", identifier);
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



-(IBAction)bnt_creatTeam
{

    CreatTeam *nextvc = [[UIStoryboard storyboardWithName:@"TeamCreat" bundle:nil] instantiateViewControllerWithIdentifier:@"teamcreat"];

    [self presentViewController:nextvc animated:YES completion:nil];
    
    
}

@end
