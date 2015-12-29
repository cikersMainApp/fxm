//
//  NSString+ThreeDESUtil.h
//  TeaLife
//
//  Created by administrater on 15/12/8.
//  Copyright © 2015年 administrater. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonDigest.h>
#import "GTMBase64.h"

#define gkey			@"teapod01234@oases$#365#$"
#define gIv             @"01234567"
#define kSecrectKeyLength 24
@interface NSString (ThreeDESUtil)
+ (NSString*)encrypt:(NSString*)plainText;
+ (NSString*)encrypt:(NSString*)plainText withKey:(NSString*)key;
+ (NSString*)decrypt:(NSString*)encryptText withKey:(NSString*)key;
@end
