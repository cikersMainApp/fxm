//
//  HLQRCodeModule.h
//  TeaLife
//
//  Created by administrater on 15/12/8.
//  Copyright © 2015年 administrater. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
@protocol HLQRCodeModuleDelegate <NSObject>

- (void) qrCodeScanSuccess:(NSString *) stringValue;

@end
@interface HLQRCodeModule : NSObject
@property (nonatomic,weak) id<HLQRCodeModuleDelegate> delegate;
- (void) generateQRCodeInView:(UIView *) mySuperView;
- (void) restartQRView;
@end
