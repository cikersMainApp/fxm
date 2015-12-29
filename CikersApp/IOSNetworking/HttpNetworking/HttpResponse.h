//
//  HttpResponse.h
//  WLTProject
//
//  Created by frankfeng on 13-3-22.
//  Copyright (c) 2013年 luojing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpResponse : NSObject
@property (nonatomic, strong) NSHTTPURLResponse *response;
@property (nonatomic, copy) NSString *responseString;
@property (nonatomic, strong) NSData *responseData;
@end
