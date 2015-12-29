//
//  Api.m
//  ManageFinances
//
//  Created by fisher on 14-7-16.
//
//

#import "Api.h"

@implementation Api

- (void)sendRequestWithUrl:(NSString *)apiUrl Method:(NSString *)method AndParams:(NSDictionary *)paramsDict
{
//    NSString *paramsStr=@"";
//    int i=0;
//    for (NSString *item in paramsDict) {
//        if (i==!0) {
//            paramsStr=[NSString stringWithFormat:@"%@&",paramsStr];
//        }
//        paramsStr=[NSString stringWithFormat:@"%@%@",paramsStr,[NSString stringWithFormat:@"%@=%@",item,[paramsDict objectForKey:item]]];
//        i++;
//    }
    HttpRequest *req = [[HttpRequest alloc] initWithUrl:apiUrl method:method params:paramsDict];
    req.identifier = req.url;
    [req setTimeoutInterval:100];
    [req setCookieWithCookiesArray:[self getCookie:req]];
    [super sendRequest:req];
}

-(NSArray *)getCookie:(HttpRequest *)req
{
    NSArray *cookies=[NSHTTPCookieStorage sharedHTTPCookieStorage].cookies;
    NSMutableArray *array=[[NSMutableArray alloc] init];
    for (int i=0; i<[cookies count]; i++) {
        NSHTTPCookie *cookie=[cookies objectAtIndex:i];
        if ([req.url containsString:cookie.domain]) {
            [array addObject:[cookies objectAtIndex:i]];
        }
    }
    return array;
}

-(void)user_login:(NSString *)userName userPwd:(NSString *)userPwd deviceValue:(NSString *)deviceValue{
    NSString *apiUrl=[NSString stringWithFormat:@"%@%@",HOST_hf_DD,@"user_login"];
    NSDictionary *params=@{@"userName":userName,
                           @"userPwd":userPwd,
                           @"deviceType":@"ios",
                           @"deviceValue":deviceValue};
    [self sendRequestWithUrl:apiUrl Method:@"POST" AndParams:params];
}
@end

