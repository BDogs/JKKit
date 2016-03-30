//
//  JKHTTPViewModel.m
//  JK
//
//  Created by Futao on 16/2/27.
//  Copyright © 2016年 JKSoft. All rights reserved.
//

#import "JKHTTPViewModel.h"
#import <objc/runtime.h>

@implementation JKHTTPViewModel
@end
@implementation JKHTTPViewModel (XSSharedInstance)
+ (instancetype)sharedViewModel {
    Class selfClass = [self class];
    id instance = objc_getAssociatedObject(selfClass, @"kJKSharedInstance");
    if (!instance) {
        instance = [[selfClass alloc] init];
        objc_setAssociatedObject(selfClass, @"kJKSharedInstance", instance,
                                 OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return instance;
}

+ (void)freeSharedViewModel {
    Class selfClass = [self class];
    objc_setAssociatedObject(selfClass, @"kJKSharedInstance", nil,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
