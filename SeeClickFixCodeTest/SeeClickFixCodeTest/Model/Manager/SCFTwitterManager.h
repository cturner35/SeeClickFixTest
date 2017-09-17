//
//  SCFTwitterManager.h
//  SeeClickFixCodeTest
//
//  Created by Chris Turner on 9/16/17.
//  Copyright © 2017 Chris Turner. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^SCFTTwitterCompletion)(NSArray *tweets);

@interface SCFTwitterManager : NSObject

+ (instancetype)sharedManager;

- (NSArray *)loadTweets:(SCFTTwitterCompletion)completion;

@end
