//
//  Api.h
//  TeaLife
//
//  Created by Horrace Lin on 15-12-5.
//
//



#define JSON_KEY_E @"e"
#define JSON_KEY_TOTAL @"total"
#define JSON_KEY_MSG @"msg"
#define JSON_KEY_EXTRA @"extra"


#import <Foundation/Foundation.h>
#import "BaseApi.h"
#import "CommonCallback.h"
/*****************************************************手机号码即为用户账号********************************************************/
@interface Api : BaseApi

@property(nonatomic,strong)NSString * http_tag; //区分网络请求


#pragma mark - 登录相关

/*
 登录
 */


-(void)user_login:(NSString *)userName userPwd:(NSString *)userPwd deviceValue:(NSString *)deviceValue;
/*
 注册
 */
-(void)register_first:(NSString *)phone pwd:(NSString *)pwd validCode:(NSString *)validCode  name:(NSString*)name token:(NSString *)token;

/*
 获得短信验证码
 */
-(void)getVerityCode:(NSString *)mobileTel;

/*
 检查用户名是否唯一
 */
//-(void)checkUserName:(NSString *)userName;


/*
 用户修改密码
 */
-(void)user_changeoldpwd:(NSString *)opwd npwd:(NSString *)npwd phone:(NSString *)phone  vcode:(NSString*)vcode;

/*
 用户找回密码
 */
-(void)user_rebackpwd:(NSString *)pwd phone:(NSString *)phone  vcode:(NSString*)vcode;
/*
 用户上传头像－－在注册阶段
 */

-(void)user_uploadUserPhoto:(NSString*)phone image64data:(NSString*)data;


/*
 用户创建球队、更新球队
 tags 填写球队所在市、区
 sportscat 1 足球 2 篮球
 ID 为－1时为创建球队
 portraint 队徽URL
 */

-(void)user_creatTeam:(NSString*)teamid phone:(NSString*)phone address:(NSString*)address tags:(NSString*)tags sportscat:(NSString*)sportscat name:(NSString*)name portraint:(NSString*)portraint;

/*
 球队上传logo
 */

-(void)team_uploadByid:(NSString*)teamid img:(NSString*)base64img;

/*
 模糊搜索 使用场景 查询球队  查询队员  查询联赛
 */
-(void)searchByType:(NSString*)type keyword:(NSString*)keyword;

/*
 获取球队信息
 */

-(void)team_getInfo:(NSString*)teamid;
/*
 获取球队球员信息
 */


/*
 获取球队事件
 */

-(void)team_getEvent:(NSString*)teamid type:(NSString*)type;


/*
 加入球队
 */

-(void)team_join:(NSString*)teamid playerid:(NSString*)playerid;

/*
 退出球队
 */

-(void)team_leave:(NSString*)teamid playerid:(NSString*)playerid;



#pragma  mark - 球员
/*******************************************************球员********************************************************/

/*
 获取球员的详细信息
 */
-(void)player_info:(NSString*)playerid;

/*
 获取某一个球队的球员信息
 */

-(void)player_listbyteam:(NSString*)teamid limit:(NSString*)limit;


#pragma  mark - wiki
/*******************************************************帖子********************************************************/


/*
 帖子详情
 */

-(void)wiki_info:(NSString*)wikiid limit:(NSString*)limit;

/*
 获取某个球队的帖子
 */

-(void)wiki_listbyteam:(NSString*)teamid limit:(NSString*)limit;
/*
 获取某个比赛的帖子
 */

-(void)wiki_listbymatch:(NSString*)matchid limit:(NSString*)limit;
/*
 获取某个赛事的帖子
 */

-(void)wiki_listbygame:(NSString*)gameid limit:(NSString*)limit;
/*
 获取某个球员的帖子
 */

-(void)wiki_listbyauthor:(NSString*)playerid limit:(NSString*)limit;


#pragma mark -
#pragma mark Match
/*
 获取某个比赛的全部信息
 */

-(void)match_infoByid:(NSString*)matchid;



/*
 
 发送竞猜
 
 标示说明
 
 A 主胜 O 平局  B 客胜   0 1 2 3 4 5 6
 
 */

-(void)predict_sendBymatchid:(NSString*)matchid code:(NSString*)type;
/*
 获取竞猜结果
 */

-(void)predict_getDataBymatchid:(NSString*)matchid;


/*
 点赞
 */


@end
