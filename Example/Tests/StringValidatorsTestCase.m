//
//  StringValidatorsTestCase.m
//  JKKit
//
//  Created by Futao on 16/4/6.
//  Copyright © 2016年 Ftkey. All rights reserved.
//

#import <JKKit/JKValidator.h>
#import <XCTest/XCTest.h>
@interface StringValidatorsTestCase : XCTestCase

@end

@implementation StringValidatorsTestCase

- (void)setUp
{
    [super setUp];

    // Put setup code here. This method is called before the invocation of each test method in the class.

    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = YES;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    //    [[[XCUIApplication alloc] init] launch];

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{

    BOOL valid = [NSString isNilOrEmpty:(NSString*)[NSNull null]];
    XCTAssertTrue(valid);
    valid = [NSString isNilOrEmpty:@""];
    XCTAssertTrue(valid);
    valid = [NSString isNilOrEmpty:nil];
    XCTAssertTrue(valid);
    valid = [NSString isNilOrEmpty:@" "];
    XCTAssertTrue(valid);
    valid = [NSString isNilOrEmpty:@"\n"];
    XCTAssertTrue(!valid);

    //Is e-mail:
    NSString* mail = @"ftkey@qq.com";
    valid = [@"" isEmail];
    XCTAssertTrue(!valid);
    valid = [mail isEmail];
    XCTAssertTrue(valid);
    valid = [@"ftkey#qq.com" isEmail];
    XCTAssertTrue(!valid);
    //Is phone number:
    NSString* phone = @"15052251357";
    valid = [@"" isPhoneNumber];
    XCTAssertTrue(!valid);
    valid = [phone isPhoneNumber];
    XCTAssertTrue(valid);
    valid = [@"110" isPhoneNumber];
    XCTAssertTrue(!valid);
    //Is integer:
    valid = [@"" isInteger];
    XCTAssertTrue(!valid);
    valid = [@"12" isInteger];
    XCTAssertTrue(valid);
    valid = [@"12.2" isInteger];
    XCTAssertTrue(!valid);
    valid = [@"abc" isInteger];
    XCTAssertTrue(!valid);
    valid = [@"-123" isInteger];
    XCTAssertTrue(valid);
    //Is numeric:
    valid = [@"12" isNumeric];
    XCTAssertTrue(valid);
    valid = [@"12.2" isNumeric];
    XCTAssertTrue(valid);
    valid = [@".1" isNumeric];
    XCTAssertTrue(valid);
    valid = [@"abc" isNumeric];
    XCTAssertTrue(!valid);

    //Is url:
    NSString* url = @"http://apple.com";
    valid = [url isHttpURL];
    XCTAssertTrue(valid);
    //Is min length:
    NSString* string = @"My title";
    valid = [string isMinLength:2];
    XCTAssertTrue(valid);
    //Is max length:
    string = @"My title";
    valid = [string isMaxLength:8];
    XCTAssertTrue(valid);
    //Is min length and max length:
    string = @"My title";
    valid = [string isMinLength:2 maxLength:4];
    XCTAssertTrue(!valid);
    //Is empty:
    NSString* user = @"Jeremy Chaufourier";
    valid = [user isEmpty];
    XCTAssertTrue(!valid);

    NSError* error = [@"192.168.0.1" validateIPv4Address];
    XCTAssertTrue(!error);

    valid = [@"我X" isChineseName];
    XCTAssertTrue(!valid);
    valid = [@"中文中文中文" isChineseName];
    XCTAssertTrue(!valid);
    valid = [@"中文" isChineseName];
    XCTAssertTrue(valid);

    valid = [@"320283198803310000" isIdentityCardNumber];
    XCTAssertTrue(valid);
    valid = [@"32028319880331000X" isIdentityCardNumber];
    XCTAssertTrue(!valid);
    valid = [@"32028319880331000x" isIdentityCardNumber];
    XCTAssertTrue(valid);
    valid = [@"320283198803310001x" isIdentityCardNumber];
    XCTAssertTrue(!valid);
    
    
}

@end
