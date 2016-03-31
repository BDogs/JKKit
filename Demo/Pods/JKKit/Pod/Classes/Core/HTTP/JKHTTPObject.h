//
//  JKHttpObject.h
//  YoCar
//
//  Created by Futao on 15/9/30.
//  Copyright © 2015年 YoCar. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface JKHTTPObject : NSObject
@property (nonatomic, assign) NSInteger errorCode;    //返回状态 //"errorCode": "0"  成功，其他失败
@property (nonatomic, strong) NSString *errorMsg;     //返回错误消息
@property (nonatomic, strong) id data;                //返回对象
@property (nonatomic, strong) id originalData;        //返回原始对象
@property (nonatomic, assign, readonly) BOOL isValid; //接口是否正常返回数据

- (instancetype)initWihResponseJson:(NSDictionary *)responseJson;

- (instancetype)initWihNSError:(NSError *)error;
@end
