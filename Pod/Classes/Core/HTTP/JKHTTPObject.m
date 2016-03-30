//
//  JKHttpObject.m
//  YoCar
//
//  Created by Futao on 15/9/30.
//  Copyright © 2015年 YoCar. All rights reserved.
//

#import "JKHTTPObject.h"

@implementation JKHTTPObject

- (instancetype)initWihNSError:(NSError *)error {
    self = [super init];
    if (self) {
        self.errorCode = error.code;
        self.errorMsg = error.localizedDescription;
    }
    return self;
}
- (instancetype)initWihResponseJson:(NSDictionary *)responseJson {
    self = [super init];
    if (self) {
        self.errorCode = [[responseJson objectForKey:@"error_code"] integerValue];
        self.errorMsg = [responseJson objectForKey:@"error_msg"];
        self.originalData = responseJson;
    }
    return self;
}
//TODO
- (BOOL)isValid {
    if (self.errorCode == 0) {
        return YES;
    }
    return NO;
}
@end
