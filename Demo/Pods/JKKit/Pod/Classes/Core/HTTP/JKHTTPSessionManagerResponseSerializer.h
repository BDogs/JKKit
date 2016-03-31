//
//  JKHTTPSessionManagerResponseSerializer.h
//  YoCar
//
//  Created by Futao on 15/9/29.
//  Copyright © 2015年 YoCar. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JKHTTPSessionManager.h"

/**
 *  联盟端API格式定义
 */
@interface JKHTTPSessionManagerResponseSerializer : NSObject <JKHTTPSessionManagerResponseSerialization, NSObject, NSSecureCoding, NSCopying>
/**
 *  是否解密加密过的数据 (RSA)
 */
@property (nonatomic, assign) BOOL decryptEnabled;

@end
