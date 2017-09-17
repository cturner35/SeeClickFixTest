//
//  SeeClickFixCodeTestTests.m
//  SeeClickFixCodeTestTests
//
//  Created by Chris Turner on 9/16/17.
//  Copyright © 2017 Chris Turner. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SCFTwitterManager.h"

@interface SeeClickFixCodeTestTests : XCTestCase

@end

@implementation SeeClickFixCodeTestTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testLoadTweets {
    
    XCTestExpectation *loadTweetsExpectation = [self expectationWithDescription:@"load tweets"];
    
    SCFTwitterManager *manager = [SCFTwitterManager sharedManager];
    
    [manager loadTweets:^(NSArray *tweets) {
        
        XCTAssert(tweets.count > 0);
        
        [loadTweetsExpectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:10 handler:^(NSError * _Nullable error) {
        NSLog(@"Load Tweets Broken!");
    }];
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
