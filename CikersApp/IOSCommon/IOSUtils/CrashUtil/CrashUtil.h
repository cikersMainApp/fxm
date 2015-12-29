//
//  CrashUtil.h
//  LeRong
//
//  Created by administrater on 15/11/9.
//  Copyright © 2015年 administrater. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CrashUtil : NSObject{
    BOOL dismissed;
}

@end
void HandleException(NSException *exception);
void SignalHandler(int signal);


void InstallUncaughtExceptionHandler(void);

