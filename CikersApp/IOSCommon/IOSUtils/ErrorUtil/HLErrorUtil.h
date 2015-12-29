//
//  HLErrorUtil.h
//  LeRong
//
//  Created by administrater on 15/11/11.
//  Copyright © 2015年 administrater. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum {
    HLErrorUtil_TAG_HAS_REGIST,
    HLErrorUtil_TAG_SHOULD_REGET_VERIFYCODE,
    HLErrorUtil_TAG_VERICODE_SEND_FAIL
}HLErrorUtil_TAG;

@interface HLErrorUtil : NSError

@end
