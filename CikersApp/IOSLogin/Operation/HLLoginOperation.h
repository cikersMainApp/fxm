//
//  HLLoginOperation.h
//  TeaLife
//
//  Created by administrater on 15/12/7.
//  Copyright © 2015年 administrater. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HLLoginOperation : NSObject
- (void) vericodeGetByPhone:(NSString *) phoneNumber completeBlock:(void(^)(id result,NSError * error)) completeBlock;
- (void) verifyVericodeByPhone:(NSString *) phoneNumber vericode:(NSString *) vericode completeBlock:(void(^)(id result,NSError * error)) completeBlock;

-(void)userLoginByname:(NSString*)phone pwd:(NSString*)pwd completeBlock:(void(^)(id resule,NSError *error)) completeBlock;

@end
