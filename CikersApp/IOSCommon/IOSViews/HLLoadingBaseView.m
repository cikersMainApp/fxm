//
//  HLLoadingBaseView.m
//  TeaLife
//
//  Created by Local on 15/12/11.
//  Copyright © 2015年 administrater. All rights reserved.
//

#import "HLLoadingBaseView.h"
#import "MBProgressHUD.h"
@interface HLLoadingBaseView()

@end

@implementation HLLoadingBaseView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
    }
    return self;
}

+ (HLLoadingBaseView *) shareLoadingWithSuper:(UIView *) suprView
{
    HLLoadingBaseView * loading = [[HLLoadingBaseView alloc] initWithFrame:CGRectMake(0, 0, suprView.frame.size.width, suprView.frame.size.height)];
    loading.backgroundColor = [UIColor whiteColor];
    loading.status = LOADING_STATUS_LOADING;
    [suprView addSubview:loading];
    return loading;
}

- (void) restartLoadingInSuper:(UIView *) suprView
{
    [self setStatus:LOADING_STATUS_LOADING];
    [suprView addSubview:self];
}

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"status"]) {
        LOADING_STATUS status = [[change objectForKey:@"new"] intValue];
        if (status == LOADING_STATUS_LOADING) {
            [self changeViewWhenLoading];
        }
        else if (status == LOADING_STATUS_LOADSUCCESS_BUTNODATA)
        {
            [self changeViewWhenLoadSuccessButNoData];
        }
        else if (status == LOADING_STATUS_LOADSUCCESS_HASDATA)
        {
            [self changeViewWhenLoadSuccessHasData];
        }
        else if (status == LOADING_STATUS_ERROR)
        {
            [self changeViewWhenError];
        }
    }
}

- (void) changeViewWhenLoading
{
    UIView * bgView = [self commonProcessAndSetBgView];
    [self addSubview:bgView];
    
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:bgView];
    HUD.labelText = @"加载中...";
    [bgView addSubview:HUD];
    [HUD show:YES];
}

- (void) changeViewWhenLoadSuccessButNoData
{
    UIView * bgView = [self commonProcessAndSetBgView];
    [self addSubview:bgView];
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    label.text = @"没有数据";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor grayColor];
    [bgView addSubview:label];
}

- (void) changeViewWhenLoadSuccessHasData
{
    UIView * sub = [self viewWithTag:10000];
    [UIView animateWithDuration:0.3 animations:^{
        sub.alpha = 0.f;
    }completion:^(BOOL finished) {
        [sub removeFromSuperview];
        [self removeFromSuperview];
    }];
}

- (void) changeViewWhenError
{
    UIView * bgView = [self commonProcessAndSetBgView];
    [self addSubview:bgView];
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    label.text = @"数据加载失败，请点击屏幕重试";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor grayColor];
    [bgView addSubview:label];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(reloadData:)];
    [bgView addGestureRecognizer:tap];
}

- (void) reloadData:(UITapGestureRecognizer *) tap
{
    [self.delegate reloadData];
}

- (UIView *) commonProcessAndSetBgView
{
    UIView * sub = [self viewWithTag:10000];
    [sub removeFromSuperview];
    
    UIView * bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    bgView.tag = 10000;
    bgView.backgroundColor = [UIColor whiteColor];
    return bgView;
}

- (void) dealloc
{
     [self removeObserver:self forKeyPath:@"status"];
}
@end
