//
//  Api.m
//  TeaLife
//
//  Created by Horrace Lin on 15-12-5.
//
//

#import "Api.h"

@implementation Api

- (void)sendRequestWithUrl:(NSString *)apiUrl Method:(NSString *)method AndParams:(NSDictionary *)paramsDict
{
    HttpRequest *req = [[HttpRequest alloc] initWithUrl:apiUrl method:method params:paramsDict];
    req.identifier = req.url;
    req.apiName=self.http_tag;
    [req setTimeoutInterval:30];
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

#pragma mark -
#pragma mark User info
-(void)register_first:(NSString *)phone pwd:(NSString *)pwd validCode:(NSString *)validCode name:(NSString*)name token:(NSString *)token
{
    NSString *apiUrl=[NSString stringWithFormat:@"%@%@",HOST,@"portal/reg"];
    NSDictionary *params=@{@"cell":phone,
                           @"vcode":validCode,
                           @"pwd":pwd,
                           @"name":name,
                           };
    
    
    self.http_tag = @"reg";
    [self sendRequestWithUrl:apiUrl Method:@"POST" AndParams:params];
}
-(void)checkUserName:(NSString *)userName
{
    NSString *apiUrl=[NSString stringWithFormat:@"%@%@/%@",HOST,@"portal/unique",userName];
    [self sendRequestWithUrl:apiUrl Method:@"GET" AndParams:nil];

}

-(void)getVerityCode:(NSString *)mobileTel
{
    NSString *apiUrl=[NSString stringWithFormat:@"%@%@",HOST,@"portal/smscode"];
    NSDictionary *params=@{@"cell":mobileTel
                           };
    [self sendRequestWithUrl:apiUrl Method:@"POST" AndParams:params];
}
-(void)user_login:(NSString *)userName userPwd:(NSString *)userPwd deviceValue:(NSString *)deviceValue{
    NSString *apiUrl=[NSString stringWithFormat:@"%@%@",HOST,@"portal/login"];
    NSDictionary *params=@{@"username":userName,
                           @"password":userPwd,
                           @"deviceType":@"ios",
                           @"deviceValue":deviceValue};
    [self sendRequestWithUrl:apiUrl Method:@"POST" AndParams:params];
}

-(void)user_changeoldpwd:(NSString *)opwd npwd:(NSString *)npwd phone:(NSString *)phone  vcode:(NSString*)vcode
{
    NSString *apiUrl=[NSString stringWithFormat:@"%@%@",HOST,@"portal/chgpwd"];
    NSDictionary *params=@{@"cell":phone,
                           @"vcode":vcode,
                           @"opwd":opwd,
                           @"npwd":npwd,
                           };
    [self sendRequestWithUrl:apiUrl Method:@"POST" AndParams:params];
    
}
-(void)user_rebackpwd:(NSString *)pwd phone:(NSString *)phone  vcode:(NSString*)vcode
{
    NSString *apiUrl=[NSString stringWithFormat:@"%@%@",HOST,@"portal/rstpwd"];
    NSDictionary *params=@{@"cell":phone,
                           @"vcode":vcode,
                           @"npwd":pwd,
                           };
    [self sendRequestWithUrl:apiUrl Method:@"POST" AndParams:params];
    
}
-(void)user_uploadUserPhoto:(NSString*)phone image64data:(NSString*)data
{
    NSString *apiUrl=[NSString stringWithFormat:@"%@%@",HOST,@"portal/uploadavatar"];
    NSDictionary *params=@{@"cell":phone,
                           @"avatar64":data,
                           };
    
    self.http_tag = @"uploadavatar";
    
    [self sendRequestWithUrl:apiUrl Method:@"POST" AndParams:params];
    
}


#pragma mark -
#pragma mark Team

-(void)user_creatTeam:(NSString*)teamid phone:(NSString*)phone address:(NSString*)address tags:(NSString*)tags sportscat:(NSString*)sportscat name:(NSString*)name portraint:(NSString*)portraint
{
    NSString *apiUrl=[NSString stringWithFormat:@"%@%@",HOST,@"team/update"];
    
    
    NSString *_address = [address stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSString *_name = [name stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSString *_portraint = [portraint stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSString *_tag = [tags stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary *params=@{@"id":teamid,
                           @"cname":_name,
                           @"province":_address,
                           @"contanct":phone,
                           @"portraint":_portraint,
                           @"tags":_tag,
                           @"sportscat":sportscat,
                           };
    
    
    [self sendRequestWithUrl:apiUrl Method:@"POST" AndParams:params];
    
    self.http_tag = NET_TEAM_REG;
    
    
}
-(void)team_uploadByid:(NSNumber*)teamid img:(NSString*)base64img
{
    NSString *apiUrl=[NSString stringWithFormat:@"%@%@",HOST,@"team/uploadavatar"];
    
    NSDictionary *params=@{
                              @"id":teamid,
                              @"avatar64":base64img
                              };
    [self sendRequestWithUrl:apiUrl Method:@"POST" AndParams:params];

    self.http_tag = NET_TEAM_LOGO;
}

-(void)team_getInfo:(NSString*)teamid
{
    NSString *apiUrl=[NSString stringWithFormat:@"%@%@%@",HOST,@"team/",teamid];
    
    [self sendRequestWithUrl:apiUrl Method:@"GET" AndParams:NULL];
}
-(void)team_getEvent:(NSString*)teamid type:(NSString*)type
{
    NSString *apiUrl=[NSString stringWithFormat:@"%@%@%@",HOST,@"event/listbyteam/",teamid];
    
    //    NSDictionary *params=@{
    //                           @"expired":type,
    //                           };
    [self sendRequestWithUrl:apiUrl Method:@"POST" AndParams:NULL];
}
/*
 加入球队
 */

-(void)team_join:(NSString*)teamid playerid:(NSString*)playerid
{
    NSString *apiUrl=[NSString stringWithFormat:@"%@%@%@?playerid=%@",HOST,@"team/join/",teamid,playerid];
    
    [self sendRequestWithUrl:apiUrl Method:@"POST" AndParams:NULL];
    
}

/*
 退出球队
 */

-(void)team_leave:(NSString*)teamid playerid:(NSString*)playerid
{
    NSString *apiUrl=[NSString stringWithFormat:@"%@%@%@?playerid=%@",HOST,@"team/leave/",teamid,playerid];
    
    [self sendRequestWithUrl:apiUrl Method:@"POST" AndParams:NULL];
    
}



#pragma  mark - 球员
/*******************************************************球员********************************************************/

/*
 获取球员的详细信息
 */
-(void)player_info:(NSString*)playerid
{
    NSString *apiUrl=[NSString stringWithFormat:@"%@%@%@",HOST,@"player/",playerid];
    
    [self sendRequestWithUrl:apiUrl Method:@"GET" AndParams:NULL];
    
}
/*
 获取某一个球队的球员信息
 */

-(void)player_listbyteam:(NSString*)teamid limit:(NSString*)limit
{
    NSString *apiUrl=[NSString stringWithFormat:@"%@%@%@&limit=%@",HOST,@"player/listbyteam?tid=",teamid,limit];
    
    [self sendRequestWithUrl:apiUrl Method:@"POST" AndParams:NULL];
}




#pragma  mark - wiki
/*******************************************************帖子********************************************************/


/*
 帖子详情
 */

-(void)wiki_info:(NSString*)wikiid limit:(NSString*)limit
{
    NSString *apiUrl=[NSString stringWithFormat:@"%@%@%@?limit=%@",HOST,@"wiki/",wikiid,limit];
    
    [self sendRequestWithUrl:apiUrl Method:@"POST" AndParams:NULL];
}

/*
 获取某个球队的帖子
 */

-(void)wiki_listbyteam:(NSString*)teamid limit:(NSString*)limit
{
    NSString *apiUrl=[NSString stringWithFormat:@"%@%@%@?limit=%@",HOST,@"wiki/listbyteam/",teamid,limit];
    
    [self sendRequestWithUrl:apiUrl Method:@"POST" AndParams:NULL];
}
/*
 获取某个比赛的帖子
 */

-(void)wiki_listbymatch:(NSString*)matchid limit:(NSString*)limit
{
    
    NSString *apiUrl=[NSString stringWithFormat:@"%@%@%@?limit=%@",HOST,@"wiki/listbymatch/",matchid,limit];
    
    [self sendRequestWithUrl:apiUrl Method:@"POST" AndParams:NULL];
}
/*
 获取某个赛事的帖子
 */

-(void)wiki_listbygame:(NSString*)gameid limit:(NSString*)limit
{
    NSString *apiUrl=[NSString stringWithFormat:@"%@%@%@?limit=%@",HOST,@"wiki/listbygame/",gameid,limit];
    
    [self sendRequestWithUrl:apiUrl Method:@"POST" AndParams:NULL];
}
/*
 获取某个球员的帖子
 */

-(void)wiki_listbyauthor:(NSString*)playerid limit:(NSString*)limit
{
    NSString *apiUrl=[NSString stringWithFormat:@"%@%@%@?limit=%@",HOST,@"wiki/listbyauthor/",playerid,limit];
    
    [self sendRequestWithUrl:apiUrl Method:@"POST" AndParams:NULL];
}


-(void)searchByType:(NSString*)type keyword:(NSString*)keyword
{

    
    NSString *apiUrl=[NSString stringWithFormat:@"%@search/quick",HOST];
    
    NSDictionary *params=@{@"group":type,
                           @"keyword":keyword,
                           };
    
    [self sendRequestWithUrl:apiUrl Method:@"GET" AndParams:params];

}

#pragma mark -
#pragma mark match

-(void)match_infoByid:(NSString *)matchid
{

    NSString *apiUrl=[NSString stringWithFormat:@"%@match/%@",HOST,matchid];

    self.http_tag = NET_MATCH_INFO;
    
    [self sendRequestWithUrl:apiUrl Method:@"GET" AndParams:nil];

}



-(void)predict_sendBymatchid:(NSString *)matchid code:(NSString *)type
{

    NSString *apiUrl=[NSString stringWithFormat:@"%@predict/bet/%@",HOST,matchid];
    
    NSDictionary *params=@{@"code":type,};
    
    [self sendRequestWithUrl:apiUrl Method:@"POST" AndParams:params];

}

-(void)predict_getDataBymatchid:(NSString *)matchid
{
    
    NSString *apiUrl=[NSString stringWithFormat:@"%@predict/bymatch/%@",HOST,matchid];
    
    [self sendRequestWithUrl:apiUrl Method:@"GET" AndParams:nil];

}

-(void)Tag_sendByOgroupid:(NSString *)type oid:(NSNumber *)oid
{

    NSString *apiUrl=[NSString stringWithFormat:@"%@tag/add/%@/%@",HOST,type,oid];
    
    [self sendRequestWithUrl:apiUrl Method:@"POST" AndParams:nil];

}

@end

