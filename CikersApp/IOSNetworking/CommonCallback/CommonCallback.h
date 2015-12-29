//
//  CommonCallback.h
//  NetApi
//
//  Created by administrater on 15/11/18.
//  Copyright © 2015年 administrater. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseApi.h"
@protocol CommonCallbackDelegate<NSObject>
- (void) callbackResult:(id) result;
@end
@interface CommonCallback : NSObject<BaseApiDelegate>
@property (nonatomic,weak) id<CommonCallbackDelegate> delegate;
@end
