//
//  StringUtil.h
//  apos-enterprise-ios
//
//  Created by 刘洋 on 13-2-28.
//  Copyright (c) 2013年 cpz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APSStringUtil : NSObject

extern NSString * const NULL_AMOUNT_STR;

/**
 检查字符串是否为空
 */
+ (BOOL) isNull:(NSString *) str; 
/**
 检查字符串是否为空
 */
+ (BOOL) isEmpty:(NSString *) str;

+ (NSString *) convertCurrencyStr: (NSString*) amount __attribute((ns_returns_retained));
/**
 替换字符串
 */
+ (NSString *) replaceAll:(NSString *) str searchStr:(NSString *) sstr replaceStr :(NSString *) rstr __attribute((ns_returns_retained));
//金额转换为字符串
+(NSString*) convert2StringWithAmount:(NSDecimalNumber*) amount;
//字符串转换为金额
+(NSDecimalNumber*) convert2AmountWithString:(NSString*) amountStr;

+(NSString *)createUUID;

+ (NSDecimalNumber *)abs:(NSDecimalNumber *)num;

+ (NSDecimalNumber *)roundingNumber:(NSDecimalNumber *)num;

+ (NSString *)repControlChar : (NSString*) sourceStr;

+(NSString*) genDefaultCurrency;

+(NSString*) transferFrom:(NSString *) originString;

//转换卡号
+(NSString*) formatCardNo:(NSString*) cardNo;
+(NSString*) formatMobileNo:(NSString*) cardNo;
+(NSString*) formatIDNo:(NSString*) cardNo;
//转换出人民，带千分符号
+(NSString*) convertToCurrencyStringWithNumber:(NSNumber*) num;

+(NSString *)randomPassword;

+ (BOOL)isIDCardNumberCorrect:(NSString *)IDCardNumber;


+(NSData *) hexStrToNSData:(NSString *)hexStr;
+(NSString *) NSDataToHexString:(NSData *)data;

+(NSString *)formatURLString:(NSString *)str;

+(NSString *)stringForDate:(NSDate *)date;
+(NSDate *)dateFromString:(NSString *)dateString;

/**
 *  encoding string
 *
 *  @param input
 *
 *  @return
 */
+ (NSString *)encodeToPercentEscapeString: (NSString *) input;
/**
 *  decode string
 *
 *  @param input
 *
 *  @return
 */
+ (NSString *)decodeFromPercentEscapeString: (NSString *) input;

/**
 *  获取当前毫秒数
 *
 *  @return 
 */
+(NSString*) getCurrentTimes;


+(NSString *)triming:(NSString *)str;

+ (BOOL)isMobileNumber:(NSString *)mobileNum;
+(NSString *)findPhoneNumString:(NSString *)str;


+(NSString *)changeFloat:(NSString *) stringFloat;
+(NSString*) parseBankName:(NSString*) bankName;
//格式化手机号码
+ (NSString *)formatPhonetring:(NSString *)phone;

//格式化身份证号码
+ (NSString *)formatBandCardString:(NSString *)card;
@end
