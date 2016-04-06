//
//  ValidatorsTestCase.m
//  JKKit
//
//  Created by Futao on 16/4/6.
//  Copyright © 2016年 Ftkey. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <JKKit/JKValidators.h>

@interface ValidatorsTestCase : XCTestCase

@end

@implementation ValidatorsTestCase

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = YES;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    {
        UITextField *tf = [[UITextField alloc] init];
        JKMultipleValidator *validator = [JKMultipleValidator validator];
        [validator setValidators:@[[JKRequiredValidator validator]]];
        NSError *error = NULL;
        [tf addValidator:validator];
        BOOL valid = [tf validate:&error];
        XCTAssertTrue(!valid);

    }
    {
        UITextField *tf = [[UITextField alloc] init];
        JKMultipleValidator *validator = [JKMultipleValidator validator];
        [validator setValidators:@[[JKRequiredValidator validator]]];
        NSError *error = NULL;
        [tf addValidator:validator];
        BOOL valid = [tf validate:&error];
        XCTAssertTrue(!valid);
        XCTAssertTrue(!tf.isValid);
    }
    {
        UITextField *tf = [[UITextField alloc] init];
        tf.text = @"123";
        JKMultipleValidator *validator = [JKMultipleValidator validator];
        [validator setValidators:@[[JKRequiredValidator validator]]];
        NSError *error = NULL;
        [tf addValidator:validator];
        BOOL valid = [tf validate:&error];
        XCTAssertTrue(valid);
        XCTAssertTrue(tf.isValid);
    }
    {
        UITextField *tf = [[UITextField alloc] init];
        JKMultipleValidator *validator = [JKMultipleValidator validator];
        [validator setValidators:@[[JKRequiredValidator validator]]];
        NSError *error = NULL;
        [tf addValidator:validator];
        BOOL valid = [tf validate:&error];
        XCTAssertTrue(!valid);
        XCTAssertTrue(!tf.isValid);
    }
    {
        UITextField *tf = [[UITextField alloc] init];
        tf.text = @"123";
        JKMultipleValidator *validator = [JKMultipleValidator validator];
        [validator setValidators:@[[JKMinLengthValidator validatorWithLength:1]]];
        NSError *error = NULL;
        [tf addValidator:validator];
        BOOL valid = [tf validate:&error];
        XCTAssertTrue(valid);
        XCTAssertTrue(tf.isValid);
    }
    {
        UITextField *tf = [[UITextField alloc] init];
        tf.text = @"123";
        JKMultipleValidator *validator = [JKMultipleValidator validator];
        [validator setValidators:@[[JKRequiredValidator validator],[JKNumericValidator validator],]];
        NSError *error = NULL;
        [tf addValidator:validator];
        BOOL valid = [tf validate:&error];
        XCTAssertTrue(valid);
    }
    {
        UITextField *tf = [[UITextField alloc] init];
        tf.text = @"123";
        JKMultipleValidator *validator = [JKMultipleValidator validator];
        [validator setValidators:@[[JKRequiredValidator validator],[JKNumericValidator validator],[JKMinLengthValidator validatorWithLength:2],[JKMaxLengthValidator validatorWithLength:3]]];
        NSError *error = NULL;
        [tf addValidator:validator];
        BOOL valid = [tf validate:&error];
        XCTAssertTrue(valid);
    }
    {
        UITextField *tf = [[UITextField alloc] init];
        tf.text = @"123";
        JKMultipleValidator *validator = [JKMultipleValidator validator];
        [validator setValidators:@[[JKRequiredValidator validator],[JKNumericValidator validator],[JKMinLengthValidator validatorWithLength:5],[JKMaxLengthValidator validatorWithLength:3]]];
        NSError *error = NULL;
        [tf addValidator:validator];
        BOOL valid = [tf validate:&error];
        XCTAssertTrue(!valid);

    }
    {
        UITextField *tf = [[UITextField alloc] init];
        tf.text = @"123";
        JKMultipleValidator *validator = [JKMultipleValidator validator];
        [validator setValidators:@[[JKRequiredValidator validator],[JKNumericValidator validator],[JKMinLengthValidator validatorWithLength:2],[JKMaxLengthValidator validatorWithLength:2]]];
        NSError *error = NULL;
        [tf addValidator:validator];
        BOOL valid = [tf validate:&error];
        XCTAssertTrue(!valid);

    }
    {
        UITextField *tf = [[UITextField alloc] init];
        tf.text = @"ftkey@qq.com";
        JKMultipleValidator *validator = [JKMultipleValidator validator];
        [validator setValidators:@[[JKRequiredValidator validator],[JKNumericValidator validator]]];
        NSError *error = NULL;
        [tf addValidator:validator];
        BOOL valid = [tf validate:&error];
        XCTAssertTrue(!valid);

    }
    {
        UITextField *tf = [[UITextField alloc] init];
        tf.text = @"ftkey@qq.com";
        JKMultipleValidator *validator = [JKMultipleValidator validator];
        [validator setValidators:@[[JKRequiredValidator validator],[JKEmailValidator validator]]];
        NSError *error = NULL;
        [tf addValidator:validator];
        BOOL valid = [tf validate:&error];
        XCTAssertTrue(valid);

    }
    {
        UITextField *tf = [[UITextField alloc] init];
        tf.text = @"ftkey#qq.com";
        JKMultipleValidator *validator = [JKMultipleValidator validator];
        [validator setValidators:@[[JKRequiredValidator validator],[JKEmailValidator validator]]];
        NSError *error = NULL;
        [tf addValidator:validator];
        BOOL valid = [tf validate:&error];
        XCTAssertTrue(!valid);

    }
    {
        UITextField *tf = [[UITextField alloc] init];
        tf.text = @"110";
        JKMultipleValidator *validator = [JKMultipleValidator validator];
        [validator setValidators:@[[JKRequiredValidator validator],[JKCNMobileValidator validator]]];
        NSError *error = NULL;
        [tf addValidator:validator];
        BOOL valid = [tf validate:&error];
        XCTAssertTrue(!valid);

    }
    {
        UITextField *tf = [[UITextField alloc] init];
        tf.text = @"25052251357";
        JKMultipleValidator *validator = [JKMultipleValidator validator];
        [validator setValidators:@[[JKRequiredValidator validator],[JKCNMobileValidator validator]]];
        NSError *error = NULL;
        [tf addValidator:validator];
        BOOL valid = [tf validate:&error];
        XCTAssertTrue(!valid);

    }
    {
        UITextField *tf = [[UITextField alloc] init];
        tf.text = @"15052251357";
        JKMultipleValidator *validator = [JKMultipleValidator validator];
        [validator setValidators:@[[JKRequiredValidator validator],[JKCNMobileValidator validator]]];
        NSError *error = NULL;
        [tf addValidator:validator];
        BOOL valid = [tf validate:&error];
        XCTAssertTrue(valid);
    }
}

@end
