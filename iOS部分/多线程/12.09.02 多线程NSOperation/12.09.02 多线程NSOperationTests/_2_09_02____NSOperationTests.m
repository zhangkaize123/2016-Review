//
//  _2_09_02____NSOperationTests.m
//  12.09.02 多线程NSOperationTests
//
//  Created by 张凯泽 on 15/12/9.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface _2_09_02____NSOperationTests : XCTestCase

@end

@implementation _2_09_02____NSOperationTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
