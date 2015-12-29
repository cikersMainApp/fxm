//
//  HLAlertManager.h
//  LeRong
//
//  Created by Local on 15/11/6.
//  Copyright © 2015年 administrater. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HLAlertManager : NSObject
+ (HLAlertManager *) shareInstance;
- (void) showAlertByTitle:(NSString *) title
                  message:(NSString *) message
                 delegate:(id) delegate
            presentBaseVC:(UIViewController *) baseVC
                sureBlock:(void(^)(id sureResult)) sureBlock;

- (void) showNoCancelAlertByTitle:(NSString *) title
                          message:(NSString *) message
                         delegate:(id) delegate
                    presentBaseVC:(UIViewController *) baseVC
                        sureBlock:(void(^)(id sureResult)) sureBlock;

- (void) showCustomAlertByTitle:(NSString *) title
                            tag:(NSUInteger) tag
                        message:(NSString *) message
                    cancelTitle:(NSString *) cancelTitle
                      sureTitle:(NSString *) sureTitle
                       delegate:(id) delegate
                  presentBaseVC:(UIViewController *) baseVC
                      sureBlock:(void(^)(id sureResult)) sureBlock;
@end
