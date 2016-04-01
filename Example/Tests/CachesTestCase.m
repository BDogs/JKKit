//
//  TestCaches.m
//  JKKit
//
//  Created by Futao on 16/4/1.
//  Copyright © 2016年 Ftkey. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JKFileCache.h"

@interface CachesTestCase : XCTestCase

@end

@implementation CachesTestCase

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    [[JKFileCache defaultCache] setObject:@"value1" forKey:@"1"];
    NSString *value = [[JKFileCache defaultCache] objectForKey:@"1"];
    XCTAssertEqualObjects(value,@"value1");
    
    [[JKFileCache defaultCache] removeObjectForKey:@"1"];
    BOOL hasValue = [[JKFileCache defaultCache] objectExistsForKey:@"1"];
    XCTAssertFalse(hasValue);
    
    [[JKFileCache defaultCache] setObject:[@"dsdf2" dataUsingEncoding:NSUTF8StringEncoding] forKey:@"2"];
    hasValue = [[JKFileCache defaultCache] objectExistsForKey:@"2"];
    XCTAssertTrue(hasValue);
    
    value = [[NSString alloc ] initWithData:[[JKFileCache defaultCache] objectForKey:@"2"] encoding:NSUTF8StringEncoding];
    XCTAssertEqualObjects(value,@"dsdf2");
}

@end
