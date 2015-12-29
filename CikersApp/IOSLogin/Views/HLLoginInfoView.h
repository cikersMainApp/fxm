//
//  HLInputView.h
//  LeRong
//
//  Created by administrater on 15/11/6.
//  Copyright © 2015年 administrater. All rights reserved.
//

#import <UIKit/UIKit.h>
#define REALINFO_PLACE_HOLDER @"placeholder"

@protocol HLLoginInfoViewDelegate <NSObject>

- (void) recallForCanGetVericode:(BOOL) canGet;
- (void) callbackWithFields:(NSArray *) fields;
- (void) autoLoginWithVericode:(NSString *) vericode;
- (void) sendPhone:(NSString *) phoneNumber;
@end
@interface HLLoginInfoView : UIView
@property (nonatomic,weak) id<HLLoginInfoViewDelegate>delegate;
- (void) initInputViewByParam:(NSMutableArray *) param;
- (void) resetVericodeTF;
@end
