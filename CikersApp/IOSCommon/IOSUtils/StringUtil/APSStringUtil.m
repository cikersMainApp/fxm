//
//  StringUtil.m
//  apos-enterprise-ios
//
//  Created by 刘洋 on 13-2-28.
//  Copyright (c) 2013年 cpz. All rights reserved.
//

#import "APSStringUtil.h"

NSString * const NULL_AMOUNT_STR = @"0.00";

@implementation APSStringUtil

/**
 检查字符串是否为空
 */
+ (BOOL) isNull:(NSString *) str {
    return str == nil;
}
/**
 检查字符串是否为空
 */
+ (BOOL) isEmpty:(NSString *) str {
    if(str == nil || [str isEqualToString:@""] || [str isEqualToString:@"null"]) {
        return YES;
    }
    return NO;
}

/**
 替换字符串
 */
+ (NSString *) replaceAll:(NSString *) str searchStr:(NSString *) sstr replaceStr :(NSString *) rstr {
    NSMutableString * mstr = [NSMutableString stringWithString:str];
    NSRange substr = [mstr rangeOfString:sstr];
    
    while (substr.location != NSNotFound) {
        
        [mstr replaceCharactersInRange:substr withString:rstr];
        
        substr = [mstr rangeOfString:sstr];
    }
    return mstr;
}

/**
 转换为带货币单位的字符串
 */
+ (NSString *) convertCurrencyStr: (NSString*) amount {
    if(amount == nil) {
        return NULL_AMOUNT_STR;
    }
    return [NSString stringWithFormat : @"￥%.2f", [[[NSDecimalNumber alloc] initWithString:amount] doubleValue]];

}


+(NSString*) convert2StringWithAmount:(NSDecimalNumber*) amount {
    if(amount == nil) {
        amount = [[NSDecimalNumber alloc] initWithDouble:0.00];
    }
   
    return [APSStringUtil convertCurrencyStr:amount.stringValue];
}
//字符串转换为金额
+(NSDecimalNumber*) convert2AmountWithString:(NSString*) amountStr {
    amountStr =  [amountStr stringByReplacingOccurrencesOfString:@"￥" withString:@""];
    return   [[NSDecimalNumber alloc] initWithString:amountStr];
}
//转换出带千分符号的金额字符串
+(NSString*) convertToCurrencyStringWithNumber:(NSNumber*) num {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = kCFNumberFormatterCurrencyStyle;
    NSString *stringData= [formatter stringFromNumber:num];
    stringData = [stringData stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:@"￥"];
    return stringData;
}

+(NSString *)createUUID
{
    // Create universally unique identifier (object)
    CFUUIDRef uuidObject = CFUUIDCreate(kCFAllocatorDefault);
    
    // Get the string representation of CFUUID object.
    NSString *uuidStr = (NSString *)CFBridgingRelease(CFUUIDCreateString(kCFAllocatorDefault, uuidObject)) ;
  
    
    CFRelease(uuidObject);
    
    return uuidStr;
}


+ (NSDecimalNumber *)abs:(NSDecimalNumber *)num {
    if ([num compare:[NSDecimalNumber zero]] == NSOrderedAscending) {
        // Number is negative. Multiply by -1
        NSDecimalNumber * negativeOne = [NSDecimalNumber decimalNumberWithMantissa:1
                                                                          exponent:0
                                                                        isNegative:YES];
        return [num decimalNumberByMultiplyingBy:negativeOne];
    } else {
        return num;
    }
}



+ (NSDecimalNumber *)roundingNumber:(NSDecimalNumber *)num {
    NSDecimalNumberHandler* roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain scale:2 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    return [num decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
}

+ (NSString *)repControlChar : (NSString*) sourceStr {
    NSMutableString *myRepr = [[NSMutableString alloc] initWithString:sourceStr];
    NSRange myRange = NSMakeRange(0, [myRepr length]);
    NSArray *toReplace = [NSArray arrayWithObjects:@"\0", @"\a", @"\b", @"\t", @"\n", @"\f", @"\r", @"\e", nil];
    NSArray *replaceWith = [NSArray arrayWithObjects:@" ", nil];
    for (int i = 0, count = [toReplace count]; i < count; ++i) {
        [myRepr replaceOccurrencesOfString:[toReplace objectAtIndex:i] withString:[replaceWith objectAtIndex:0] options:0 range:myRange];
    }
    NSString *retStr = [NSString stringWithFormat:@"%@", myRepr];
    return retStr;
}
+(NSString*) genDefaultCurrency {
    
    NSString *str =  [NSString stringWithFormat:@"%0.2f",[NSDecimalNumber zero].doubleValue];
    return [APSStringUtil convertCurrencyStr:str];
}

//字符串转换成带2位小数点的字符串
+(NSString*) transferFrom:(NSString *) originString
{
    NSString  * myReturnString = originString;
    int length        = originString.length;
    NSRange  pointRan = [originString rangeOfString:@"."];
    
    if (pointRan.location != NSNotFound)
    {
        if (pointRan.location + 2 == length)
        {
            myReturnString = [myReturnString stringByAppendingString:@"0"];
        }
        else if (length - pointRan.location > 2)
        {
            myReturnString = [myReturnString substringToIndex:pointRan.location+3];
        }
    }
    else
    {
        myReturnString = [myReturnString stringByAppendingString:@".00"];
    }
    return myReturnString;
}


+(NSString *)randomPassword{
    //自动生成6位随机密码
    NSTimeInterval random=[NSDate timeIntervalSinceReferenceDate];
    NSLog(@"now:%.6f",random);
    NSString *randomString = [NSString stringWithFormat:@"%.6f",random];
    NSString *randompassword = [[randomString componentsSeparatedByString:@"."]objectAtIndex:1];
    NSLog(@"randompassword:%@",randompassword);
    
    return randompassword;
}



+ (BOOL)isIDCardNumberCorrect:(NSString *)IDCardNumber
{
    NSUInteger length = IDCardNumber.length;
    
//    if (length == 15) {
//        return YES;
//    }
    
    if (length == 18) {
        NSInteger sum = 0;
        NSArray *tupe = @[@(7), @(9), @(10), @(5), @(8), @(4), @(2), @(1), @(6), @(3), @(7), @(9), @(10), @(5), @(8), @(4), @(2)];
        
        for (int i = 0; i < (length - 1); i++) {
            NSRange range = NSMakeRange(i, 1);
            NSString *letter = [IDCardNumber substringWithRange:range];
            NSInteger number = [letter integerValue];
            sum += (number * [tupe[i] integerValue]);
        }
        
        NSInteger rest = sum % 11;
        NSArray *mask = @[@(1), @(0), @(10), @(9), @(8), @(7), @(6), @(5), @(4), @(3), @(2)];
        NSInteger mappedInteger = [mask[rest] integerValue];
        NSString *lastLetter = [IDCardNumber substringWithRange:NSMakeRange(IDCardNumber.length-1, 1)];
        NSInteger lastNumber = 0;
        if ([lastLetter isEqualToString:@"*"]) {
            lastNumber = 10;
        } else {
            lastNumber = [lastLetter integerValue];
        }
        
        return lastNumber == mappedInteger;
    }
    
    return NO;
}

+(NSString *)stringForDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMMddHHmmss"];
    
    NSString *currentDateStr = [dateFormatter stringFromDate:date];
    return currentDateStr;
}

+(NSDate *)dateFromString:(NSString *)dateString
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date=[formatter dateFromString:dateString];
    return date;
}

/**
 *  把  NSData 转换成 十六进制的 NSString
 *
 *  @param data
 *
 *  @return
 */
+(NSString *) NSDataToHexString:(NSData *)data
{
    if (data == nil) {
        return nil;
    }
    NSMutableString* hexString = [NSMutableString string];
    const unsigned char *p = [data bytes];
    for (int i=0; i < [data length]; i++) {
        [hexString appendFormat:@"%02x", *p++];
    }
    return hexString;
}

/**
 *  十六进制字符串转bytes
 *
 *  @param hexStr
 *
 *  @return
 */
+(NSData *) hexStrToNSData:(NSString *)hexStr
{
    NSMutableData* data = [NSMutableData data];
    int idx;
    for (idx = 0; idx+2 <= hexStr.length; idx+=2) {
        NSRange range = NSMakeRange(idx, 2);
        NSString* ch = [hexStr substringWithRange:range];
        NSScanner* scanner = [NSScanner scannerWithString:ch];
        unsigned int intValue;
        [scanner scanHexInt:&intValue];
        [data appendBytes:&intValue length:1];
    }
    return data;
}

/**
 *  把 str规整为有 http://的URL链接
 *
 *  @param str
 *
 *  @return
 */
+(NSString *)formatURLString:(NSString *)str{
    
    NSString *result = nil;
    NSRange range = [str rangeOfString:@"http://"];
    
    NSRange range1 = [str rangeOfString:@"https://"];
    
    // 如果没有找到
    if (range.location == NSNotFound && range1.location == NSNotFound) {
        result = [NSString stringWithFormat:@"http://%@",str];
        
    }else{
        result = str;
    }
    
    return result;
}

/**
 *  encoding string
 *
 *  @param input
 *
 *  @return
 */
+ (NSString *)encodeToPercentEscapeString: (NSString *) input
{
    NSString*
    outputStr = (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(
                                                                             
                                                                             NULL, /* allocator */
                                                                             
                                                                             (__bridge CFStringRef)input,
                                                                             
                                                                             NULL, /* charactersToLeaveUnescaped */
                                                                             
                                                                             (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                             
                                                                             kCFStringEncodingUTF8);
    
    
    return outputStr;
}

/**
 *  decode string
 *
 *  @param input
 *
 *  @return
 */
+ (NSString *)decodeFromPercentEscapeString: (NSString *) input
{
    NSMutableString *outputStr = [NSMutableString stringWithString:input];
    [outputStr replaceOccurrencesOfString:@"+"
                               withString:@" "
                                  options:NSLiteralSearch
                                    range:NSMakeRange(0,
                                                      [outputStr length])];
    
    return [outputStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
}

+(NSString*) getCurrentTimes {
    
    
    NSTimeInterval time = [[NSDate date] timeIntervalSince1970];
    
    long long dTime = [[NSNumber numberWithDouble:time] longLongValue]; // 将double转为long long型
    
    NSString *curTime = [NSString stringWithFormat:@"%llu",dTime];
    return curTime;
}


///
+(NSString *)triming:(NSString *)str{
    if ([self isEmpty:str]) {
        return  @"";
    }
    return [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}


+ (BOOL)isMobileNumber:(NSString *)mobileNum
{
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    NSString * PHS = @"^0(10|2[0-5789]|\\d{3,})\\d{7,}$";
    
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    NSPredicate *regextestphs = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES)
        || ([regextestphs evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+(NSString *)findPhoneNumString:(NSString *)str{
    if ([self isEmpty:str]) {
        return nil;
    }
    str = [APSStringUtil triming:str];
    str = [str stringByReplacingOccurrencesOfString:@"-" withString:@""];
    str = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSMutableString *appendStr = [[NSMutableString alloc]init];
    for (int i = 0; i < str.length - 1; i++) {
        char ch = [str characterAtIndex:i];
        if (isnumber(ch)) {
            [appendStr appendString:[NSString stringWithFormat:@"%c",ch]];
            
        }else{
            if (appendStr.length > 8) {
                break;
            }else{
                [appendStr deleteCharactersInRange:NSMakeRange(0, appendStr.length)];
            }
        }
        
    }
    return appendStr;
}


+(NSString *)changeFloat:(NSString *)stringFloat
{
    NSMutableString *tempStr = [NSMutableString stringWithString:stringFloat];
    NSUInteger length = [stringFloat length];
    for (int i = length - 1; i >= 0; i --) {
        char ch = [stringFloat characterAtIndex:i];
        if (ch == 48 || ch == 46) {
            NSRange range = {i,1};
            [tempStr deleteCharactersInRange:range];
        }
        else
        {
            break;
        }
    }
    
    return tempStr;
}

+ (NSString *)formatPhonetring:(NSString *)phone
{
    if([self isEmpty:phone]) {
        return @"";
    }
    
    NSMutableString * temp = [[NSMutableString alloc] initWithString:@""];
    
    NSString *value = [phone stringByReplacingOccurrencesOfString:@" " withString:@""];
    for (int i = 0; i < [value length]; i ++) {
        unichar     characterToAdd = [value characterAtIndex:i];
        if(i == 3 || i == 7) {
            [temp appendFormat:@" %c", characterToAdd];
        } else {
            [temp appendFormat:@"%c", characterToAdd];
        }
    }
    
    return temp;
}

+ (NSString *)formatBandCardString:(NSString *)card
{
    if([self isEmpty:card]) {
        return @"";
    }
    
    NSMutableString * temp = [[NSMutableString alloc] initWithString:@""];
    NSString *value = [card stringByReplacingOccurrencesOfString:@" " withString:@""];
    for (int i = 0; i < [value length]; i ++) {
        unichar     characterToAdd = [value characterAtIndex:i];
        if(i == 6 || i == 14) {
            [temp appendFormat:@" %c", characterToAdd];
        } else {
            [temp appendFormat:@"%c", characterToAdd];
        }
    }
    
    return temp;
}


@end
