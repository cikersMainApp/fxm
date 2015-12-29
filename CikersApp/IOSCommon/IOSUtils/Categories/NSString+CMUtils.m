//
//  NSString+CMUtils.m
//  wlt
//
//  Created by Wang Xuyang on 12/21/12.
//  Copyright (c) 2012 Pingan. All rights reserved.
//

#import "NSString+CMUtils.h"

@implementation NSString (CMUtils)

+ (BOOL)isBlank:(NSString *)str
{
    if (!str
        || [str isKindOfClass:[NSNull class]]
        || [str isEqualToString:@""]
        || [[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)isEmpty:(NSString *)str
{
    if (!str
        || [str isKindOfClass:[NSNull class]]
        || [str isEqualToString:@""]) {
        return YES;
    } else {
        return NO;
    }
}

+(BOOL)isMatchReg:(NSString *)str Reg:(NSString *)Reg{
    NSPredicate * pred= [NSPredicate predicateWithFormat:@"SELF MATCHES %@", Reg];
    return [pred evaluateWithObject:str];
}

+ (NSString *)emptyOrString:(NSString *)str
{
    return [NSString isEmpty:str] ? @"" : str;
}

+ (NSString *)emptyOrStringAndTrim:(NSString *)str
{
    return [NSString isEmpty:str] ? @"" : [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

+ (NSString *)defaultValue:(NSString *)defaultStr OrString:(NSString *)str
{
    defaultStr = [NSString isEmpty:defaultStr] ? @"" : defaultStr; // default为nil就赋值为空串
    return [NSString isEmpty:str] ? defaultStr : str;
}

- (NSString *)base64String
{
    NSData *data = [NSData dataWithBytes:[self UTF8String] length:[self lengthOfBytesUsingEncoding:NSUTF8StringEncoding]];
    NSUInteger length = [data length];
    NSMutableData *mutableData = [NSMutableData dataWithLength:((length + 2) / 3) * 4];
    
    uint8_t *input = (uint8_t *)[data bytes];
    uint8_t *output = (uint8_t *)[mutableData mutableBytes];
    
    for (NSUInteger i = 0; i < length; i += 3) {
        NSUInteger value = 0;
        for (NSUInteger j = i; j < (i + 3); j++) {
            value <<= 8;
            if (j < length) {
                value |= (0xFF & input[j]);
            }
        }
        
        static uint8_t const kAFBase64EncodingTable[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
        
        NSUInteger idx = (i / 3) * 4;
        output[idx + 0] = kAFBase64EncodingTable[(value >> 18) & 0x3F];
        output[idx + 1] = kAFBase64EncodingTable[(value >> 12) & 0x3F];
        output[idx + 2] = (i + 1) < length ? kAFBase64EncodingTable[(value >> 6)  & 0x3F] : '=';
        output[idx + 3] = (i + 2) < length ? kAFBase64EncodingTable[(value >> 0)  & 0x3F] : '=';
    }
    
    NSString *retString = [[NSString alloc] initWithData:mutableData encoding:NSASCIIStringEncoding];
    return retString;
}

- (NSString *)md5String
{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, strlen(cStr), result );
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

- (NSString *)md5StringWithKey:(NSString *) key
{
    return [[self stringByAppendingString:key] md5String];
}

- (NSString*)urlEncodedString {
    
    CFStringRef encodedCFString = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                          (CFStringRef) self,
                                                                          nil,
                                                                          CFSTR("?!@#$^&%*+,:;='\"`<>()[]{}/\\| "),
                                                                          kCFStringEncodingUTF8);
    
    NSString *encodedString = (NSString *)CFBridgingRelease(encodedCFString);
    
    if(!encodedString)
        encodedString = @"";
    
    return encodedString;
}

- (NSString *)hexStringFromString:(NSString *)string{
    NSData *myD = [string dataUsingEncoding:NSUTF8StringEncoding];
    Byte *bytes = (Byte *)[myD bytes];
    //下面是Byte 转换为16进制。
    NSString *hexStr=@"";
    for(int i=0;i<[myD length];i++)
        
    {
        NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i]&0xff];///16进制数
        
        if([newHexStr length]==1)
            
            hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
        
        else
            
            hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr]; 
    } 
    return hexStr; 
}


- (NSString*)urlDecodedString {
    NSString *decodedString = [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return (!decodedString) ? @"" : [decodedString stringByReplacingOccurrencesOfString:@"+" withString:@" "];
}

- (BOOL)containsString:(NSString *)string
               options:(NSStringCompareOptions)options {
    NSRange rng = [self rangeOfString:string options:options];
    return rng.location != NSNotFound;
}

- (BOOL)containsString:(NSString *)string {
    return [self containsString:string options:0];
}

@end
