//
//  HLLoadingBaseView.h
//  TeaLife
//
//  Created by Local on 15/12/11.
//  Copyright © 2015年 administrater. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    LOADING_STATUS_LOADING,
    LOADING_STATUS_LOADSUCCESS_BUTNODATA,
    LOADING_STATUS_LOADSUCCESS_HASDATA,
    LOADING_STATUS_ERROR
}LOADING_STATUS;

@protocol HLLoadingBaseViewDelegate <NSObject>

- (void) reloadData;

@end
@interface HLLoadingBaseView : UIView
@property (nonatomic,assign) LOADING_STATUS  status;
@property (nonatomic,weak) id<HLLoadingBaseViewDelegate> delegate;

+ (HLLoadingBaseView *) shareLoadingWithSuper:(UIView *) suprView;
- (void) restartLoadingInSuper:(UIView *) suprView;
@end
