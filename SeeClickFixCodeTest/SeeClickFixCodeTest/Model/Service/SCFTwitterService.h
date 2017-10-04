//
//  SCFTwitterService.h
//  SeeClickFixCodeTest
//
//  Created by Chris Turner on 10/4/17.
//  Copyright © 2017 Chris Turner. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^SCFTwitterCompletion)(NSArray *tweets);

@interface SCFTwitterService : NSObject

- (NSArray *)loadTweets:(SCFTwitterCompletion)completion;

@end
