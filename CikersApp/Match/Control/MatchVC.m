//
//  MatchVC.m
//  CikersApp
//
//  Created by fxm on 15/12/28.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "MatchVC.h"
#import "TableViewController.h"
#import "CollectionViewController.h"
#import "UIImage+ImageEffects.h"
#import "PredictionVC.h"
#import "MatchTagTableVC.h"
#import "MatchMVPTableVC.h"
#import "DicMatchinfo.h"
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

-(void)data_scuess:(id)dic
{
    NSLog(@"data:%@",dic);
    
    
    // 初始化头部数据
    
    self.str_score = ((DicMatchinfo*)dic).score;
    [self.headerView updateUI:dic];
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // get network data
    
   
    
    self.defaultImage = [UIImage imageNamed:@"haibao"];
    self.blurImage = [[UIImage imageNamed:@"haibao"] applyDarkEffect];
    
    
    PredictionVC *table =[[UIStoryboard storyboardWithName:@"Match" bundle:nil] instantiateViewControllerWithIdentifier:@"predictionvc"];
    
    MatchTagTableVC *collectionView =[[UIStoryboard storyboardWithName:@"Match" bundle:nil] instantiateViewControllerWithIdentifier:@"matchtagtablevc"];

    MatchMVPTableVC *table1 =[[UIStoryboard storyboardWithName:@"Match" bundle:nil] instantiateViewControllerWithIdentifier:@"matchmvptablevc"];

    self.segmentMiniTopInset = 64;

    [self setViewControllers:@[table,collectionView,table1]];
    
    [self addObserver:self forKeyPath:@"segmentToInset" options:NSKeyValueObservingOptionNew context:MatchVCobserver];
    
    
    self.opration = [[MatchOpration alloc] init];
    self.opration.delegate = self;
    
    [self.opration getDataForAllinfoBymatchid:@"298"];
    
    
    
    
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
