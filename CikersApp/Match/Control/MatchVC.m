//
//  MatchVC.m
//  CikersApp
//
//  Created by fxm on 15/12/28.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "MatchVC.h"
#import "UIImage+ImageEffects.h"
#import "PredictionVC.h"
#import "MatchTagTableVC.h"
#import "MatchMVPTableVC.h"
#import "DicMatchinfo.h"

#define testMatchid @"8350"

void *MatchVCobserver = &MatchVCobserver;

@interface MatchVC ()

@property (nonatomic, strong) UIImage *defaultImage;
@property (nonatomic, strong) UIImage *blurImage;

@end

@implementation MatchVC

#pragma mark - override

-(UIView<ARSegmentPageControllerHeaderProtocol> *)customHeaderView
{
//    return [[ARSegmentPageHeader alloc] init];

    CustomHeader *view = [[[NSBundle mainBundle] loadNibNamed:@"CustomHeader" owner:nil options:nil] lastObject];
    view.backgroundColor = [UIColor clearColor];
    return view;

    
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];

    if (context != MatchVCobserver)
    {
        return;
    }
    
    CGFloat topInset = [change[NSKeyValueChangeNewKey] floatValue];
    
    if (topInset <= self.segmentMiniTopInset) {
        self.title = self.str_score;
        self.headerView.imageView.image = self.blurImage;
        
        [self.headerView hideUI];
        
        
    }else{
        
        self.title = nil;
        self.headerView.imageView.image = self.defaultImage;
        
        [self.headerView showUI];
    }
}

-(NSString *)segmentTitle
{
    return @"测试";
}
// 初始化头部数据

-(void)data_scuess:(id)dic
{
    self.str_score = ((DicMatchinfo*)dic).score;
    [self.headerView updateUI:dic];
    
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // get network data
    
   
    
    self.defaultImage = [UIImage imageNamed:@"haibao"];
    self.blurImage = [[UIImage imageNamed:@"haibao"] applyDarkEffect];
    
    
    self.table_predic =[[UIStoryboard storyboardWithName:@"Match" bundle:nil] instantiateViewControllerWithIdentifier:@"predictionvc"];
    
    self.table_tag =[[UIStoryboard storyboardWithName:@"Match" bundle:nil] instantiateViewControllerWithIdentifier:@"matchtagtablevc"];

    self.table_mvp =[[UIStoryboard storyboardWithName:@"Match" bundle:nil] instantiateViewControllerWithIdentifier:@"matchmvptablevc"];

    self.table_wiki =[[UIStoryboard storyboardWithName:@"Match" bundle:nil] instantiateViewControllerWithIdentifier:@"matchwikivc"];

    
    self.segmentMiniTopInset = 64;

    [self setViewControllers:@[self.table_predic,self.table_tag,self.table_wiki]];
    
    [self addObserver:self forKeyPath:@"segmentToInset" options:NSKeyValueObservingOptionNew context:MatchVCobserver];
    
    
    [DataSingleton Instance].id_cur_match = testMatchid;
    
    self.opration = [[MatchOpration alloc] init];
    self.opration.delegate = self;
    
    
    //请求比赛数据
    [self.opration getDataForAllinfoBymatchid:testMatchid];
    
    //请求竞猜数据
    [self.table_predic getData:testMatchid];
    self.table_predic.str_matchiid = testMatchid;

    //请求球员数据
    
    [self.table_tag getData:testMatchid];
    
    
    //请求帖子数据
    self.table_wiki.matchid = testMatchid;
    
}

-(void)dealloc
{
    [self removeObserver:self forKeyPath:@"segmentToInset"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)bnt_back:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
