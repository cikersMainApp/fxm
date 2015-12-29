//
//  Api.h
//  ManageFinances
//
//  Created by fisher on 14-7-16.
//
//

#import <Foundation/Foundation.h>
#import "BaseApi.h"
#import "CommonCallback.h"

@interface Api : BaseApi

-(void)login:(NSString *)loginname password:(NSString *)password imgCode:(NSString *)imgCode;
-(void)applyInfo:(NSInteger)authtype ApplicationOption:(NSString *)ApplicationOption;
-(void)exsitCredit:(NSInteger)authtype ApplicationOption:(NSString *)ApplicationOption;
-(void)submitQuestion:(NSDictionary *)dict;
-(void)register_init;
-(void)login_init;
-(void)register_first:(NSString *)name certNo:(NSString *)certNo validCode:(NSString *)validCode token:(NSString *)token;
-(void)getVerityCode:(NSString *)mobileTel;
-(void)registerSaveUser:(NSString *)token tcId:(NSString *)tcId loginname:(NSString *)loginname pwd:(NSString *)pwd cfpwd:(NSString *)cfpwd                 email:(NSString *)email mobileTel:(NSString *)mobileTel verifyCode:(NSString *)verifyCode;
-(void)checkCode:(NSString *)code reportformat:(NSString *)reportformat;
-(void)getInformation:(NSString *)reportformat tradeCode:(NSString*)tradeCode;
-(void)checkUserName:(NSString *)userName;
-(void)sendpboc:(NSString *)appId text:(NSString *)report;
-(void)user_DBRecharge:(NSString *)inAmount bankType:(NSString *)bankType channel:(NSString *) channel IOUNumber:(NSString *)IOUNumber;

-(void) dataCollectionCreate:(NSDictionary *) param;
-(void) dataCollectionCreateForAlert:(NSDictionary *) param;
-(void) dataCollectionUpdate:(NSDictionary *) param;
-(void) getWechatMessate:(NSDictionary *) params;
-(void) checkUpdate;
-(void) getCreditList;
-(void) creditScanner:(NSDictionary *) param;
-(void) saveCredit:(NSString *) reportStr;

-(void)user_login:(NSString *)userName userPwd:(NSString *)userPwd deviceValue:(NSString *)deviceValue;
@end
