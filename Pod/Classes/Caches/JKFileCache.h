//
//  JKFileCache.h
//  JKKit
//
//  Created by Futao on 16/4/1.
//  Copyright © 2016年 Ftkey. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JKCacheProtocol.h"

@interface JKFileCache : NSObject <JKCacheProtocol>
/**
 *  默认缓存 (单例)
 *
 *  @return 缓存管理器
 */
+ (nonnull instancetype)defaultCache;
@end
