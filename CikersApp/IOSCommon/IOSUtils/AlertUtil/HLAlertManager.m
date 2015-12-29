//
//  HLAlertManager.m
//  LeRong
//
//  Created by Local on 15/11/6.
//  Copyright © 2015年 administrater. All rights reserved.
//

#import "HLAlertManager.h"

@implementation HLAlertManager
+ (HLAlertManager *) shareInstance
{
    static HLAlertManager * manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[HLAlertManager alloc] init];
    });
    return manager;
}

- (void) showAlertByTitle:(NSString *) title
                  message:(NSString *) message
                 delegate:(id) delegate
            presentBaseVC:(UIViewController *) baseVC
                sureBlock:(void(^)(id sureResult)) sureBlock
{
    if (DEVICE_VERSION >= 8.f) {
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * actionCancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        UIAlertAction * actionSure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (delegate) {
                sureBlock(alertController);
            }
        }];
        [alertController addAction:actionCancel];
        [alertController addAction:actionSure];
        [baseVC presentViewController:alertController animated:YES completion:^{
            
        }];
    }
    else
    {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:delegate cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
    }
}

- (void) showNoCancelAlertByTitle:(NSString *) title
                          message:(NSString *) message
                         delegate:(id) delegate
                    presentBaseVC:(UIViewController *) baseVC
                        sureBlock:(void(^)(id sureResult)) sureBlock
{
    if (DEVICE_VERSION >= 8.f) {
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * actionSure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (delegate) {
                sureBlock(alertController);
            }
        }];
        [alertController addAction:actionSure];
        
        [baseVC presentViewController:alertController animated:YES completion:^{
            
        }];
    }
    else
    {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:delegate cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alert show];
    }
}

- (void) showCustomAlertByTitle:(NSString *) title
                            tag:(NSUInteger) tag
                        message:(NSString *) message
                    cancelTitle:(NSString *) cancelTitle
                      sureTitle:(NSString *) sureTitle
                       delegate:(id) delegate
                  presentBaseVC:(UIViewController *) baseVC
                      sureBlock:(void(^)(id sureResult)) sureBlock
{
    if (DEVICE_VERSION >= 8.f) {
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        alertController.view.tag = tag;
        UIAlertAction * actionCancel = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        UIAlertAction * actionSure = [UIAlertAction actionWithTitle:sureTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (delegate) {
                sureBlock(alertController);
            }
        }];
        [alertController addAction:actionCancel];
        [alertController addAction:actionSure];
        [baseVC presentViewController:alertController animated:YES completion:^{
            
        }];
    }
    else
    {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:delegate cancelButtonTitle:cancelTitle otherButtonTitles:sureTitle, nil];
        alert.tag = tag;
        [alert show];
    }
    
}
@end
