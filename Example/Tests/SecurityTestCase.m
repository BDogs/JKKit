//
//  SecurityTestCase.m
//  JKKit
//
//  Created by Futao on 16/4/7.
//  Copyright © 2016年 Ftkey. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <JKKit/JKSecurity.h>
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
        JKSecurityWrapperResult *shaen = [JKSecurityAESWrapper encryptString:value key:@"key"];
        NSLog([shaen description]);
        JKSecurityWrapperResult *shade = [JKSecurityAESWrapper decryptBase64:shaen.base64 key:@"key"];
        NSLog([shade description]);
        
        XCTAssertEqualObjects(shade.utf8String,value);
        
    }
    {
        NSString *value = @"色123123调\n分离送\n快递123就废了sdf123sdf数123控刀具浪\n费空间水电费";
        JKSecurityWrapperResult *shaen = [JKSecurityAESWrapper encryptString:value key:@"SD放假了水口街道福利卡就死定了开发简历四度\n空间发"];
        NSLog([shaen description]);
        JKSecurityWrapperResult *shade = [JKSecurityAESWrapper decryptBase64:shaen.base64 key:@"SD放假了水口街道福利卡就死定了开发简历四度\n空间发"];
        NSLog([shade description]);
        
        XCTAssertEqualObjects(shade.utf8String,value);
    }
    {
        NSString *value = @"123";
        JKSecurityWrapperResult *shaen = [JKSecurityAESWrapper encryptString:value hexKey:@"CC0A69779E15780ADAE46C45EB451A23CC0A69779E15780ADAE46C45EB451A23" hexIv:@"CC0A69779E15780ADAE46C45EB451A23"];
        NSLog([shaen description]);
        JKSecurityWrapperResult *shade = [JKSecurityAESWrapper decryptBase64:shaen.base64 hexKey:@"CC0A69779E15780ADAE46C45EB451A23CC0A69779E15780ADAE46C45EB451A23" hexIv:@"CC0A69779E15780ADAE46C45EB451A23"];
        NSLog([shade description]);
        
        XCTAssertEqualObjects(shade.utf8String,value);
        
    }
    {
        NSString *pubkey = @"-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCxYBPzcjwRvrENdvSRfB+MjkTf\nOgy9UnzuXxl0+ZuNvr1YUVET01s9Tb6njRgPaJkAqnkarEqiUKnUnAmE7T8HQ09z\n3kV8cpLgBUxVxeNmEe69Ie76LS6Pw53EUnbFGEWF4o208KqjKN3XwQ/OFICE+6KF\nNF82U/iO7QPogJgYHwIDAQAB\n-----END PUBLIC KEY-----\n";
        NSString *privkey = @"-----BEGIN PRIVATE KEY-----\nMIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBALFgE/NyPBG+sQ12\n9JF8H4yORN86DL1SfO5fGXT5m42+vVhRURPTWz1NvqeNGA9omQCqeRqsSqJQqdSc\nCYTtPwdDT3PeRXxykuAFTFXF42YR7r0h7votLo/DncRSdsUYRYXijbTwqqMo3dfB\nD84UgIT7ooU0XzZT+I7tA+iAmBgfAgMBAAECgYANvEXvPTJfoWeuhj6sIXOD++Rj\ncOhZpNCd2OlswIOGN3YMJ8fihCR1m9aevPNXBh+LCKh2I09oQFzWZPrruz99HHue\nSOsCLoEq9UOGYvBFnCVpDeevqH+ZubgYWVTO62oZgTWFz0Qhx7IE8KtHqohyAKNF\nR4RE/NnkkwIT/3SG2QJBANmmVxg0tAAWKNo7B7S3S5n/M2NwXgHE1gIXMGsqaF1z\nk8IIQ4CfJDAM8+D8jmryZ0XNafWiQFRfMGecq+EadUUCQQDQoQ2dFzwWguWN6YXV\ng9je/Y0boEcc30w6MfsWzti1UiBeNkvrIS8t5HsE8Cxz7aD1rhFEnMCseXeyhGSM\nGBQTAkEAitT8AUi8+MEp1eqJg9DXvKd41Bk9Hcu85yB7liA66kFrIv26cTUSFERu\n3Di9b6KoFXJuAG06s5b0fWMGkFQcMQJAZMko9na/BHD/zGq/yMIFBtSeUnY/ZGdL\nP+HdVsteTVn7YQgB7Pj+/cCe3WfZUbe+RnFsziSbv7Z+aLMkj7kiGQJAVtbokXhp\nd+UQQ34ohO24EFomJhaalH7uT08Ja0zV8BSAaGbiqBOY/+BJt2Dwzir8tszreNHf\nF1yvThNvDef4Vw==\n-----END PRIVATE KEY-----\n";

        NSString *value = @"色123123调\n分离送\n快递123就废了sdf123sdf数123控刀具浪\n费空间水电费";
        JKSecurityWrapperResult *shaen = [JKSecurityRSAWrapper encryptString:value publicKey:pubkey];
        NSLog([shaen description]);
        
        {
            JKSecurityWrapperResult *shade = [JKSecurityRSAWrapper decryptBase64:shaen.base64 privateKey:privkey];
            NSLog([shade description]);
            
            XCTAssertEqualObjects(shade.utf8String,value);
        }
        {
            JKSecurityWrapperResult *shade = [JKSecurityRSAWrapper decryptBase64:@"XuhAjHk39YH3Ssp+Fp2+7FuLzXRAmWumEVSc0j3G5pBV0hhK78lpoDDv12UazvHoianRSde5VVITKMc7rlJ1gPI43tNzhiBm8fR1cWaJgwmACYI9BehQpvlFkMjXqjr/63PZB1z2BGSN+OpEOe8mA7YP8PMPzVlT8SsfgEr1Mg8=" publicKey:pubkey];
            NSLog([shade description]);
            
            XCTAssertEqualObjects(shade.utf8String,value);
            
            
        }
    }
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

@end
