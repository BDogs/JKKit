//
//  SecurityTestCase.m
//  JKKit
//
//  Created by Futao on 16/4/7.
//  Copyright © 2016年 Ftkey. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <JKKit/JKSecurityWrapper.h>
@interface SecurityTestCase : XCTestCase

@end

@implementation SecurityTestCase

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.

    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    {
    NSString *value = @"123";
    JKSecurityWrapperResult *shaen = [JKSecurityWrapper aesEncrypt:value key:@"key"];
    NSLog([shaen description]);
    JKSecurityWrapperResult *shade = [JKSecurityWrapper aesDecryptWithBase64:shaen.base64 key:@"key"];
    NSLog([shade description]);

    XCTAssertEqualObjects(shade.utf8String,value);

    }
    {
        NSString *value = @"色123123调\n分离送\n快递123就废了sdf123sdf数123控刀具浪\n费空间水电费";
        JKSecurityWrapperResult *shaen = [JKSecurityWrapper aesEncrypt:value key:@"SD放假了水口街道福利卡就死定了开发简历四度\n空间发"];
        NSLog([shaen description]);
        JKSecurityWrapperResult *shade = [JKSecurityWrapper aesDecryptWithBase64:shaen.base64 key:@"SD放假了水口街道福利卡就死定了开发简历四度\n空间发"];
        NSLog([shade description]);
        
        XCTAssertEqualObjects(shade.utf8String,value);
    }
    {
        NSString *value = @"123";
        JKSecurityWrapperResult *shaen = [JKSecurityWrapper aesEncrypt:value hexKey:@"CC0A69779E15780ADAE46C45EB451A23CC0A69779E15780ADAE46C45EB451A23" hexIv:@"CC0A69779E15780ADAE46C45EB451A23"];
        NSLog([shaen description]);
        JKSecurityWrapperResult *shade = [JKSecurityWrapper aesDecryptWithBase64:shaen.base64 hexKey:@"CC0A69779E15780ADAE46C45EB451A23CC0A69779E15780ADAE46C45EB451A23" hexIv:@"CC0A69779E15780ADAE46C45EB451A23"];
        NSLog([shade description]);
        
        XCTAssertEqualObjects(shade.utf8String,value);
        
    }
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

@end
