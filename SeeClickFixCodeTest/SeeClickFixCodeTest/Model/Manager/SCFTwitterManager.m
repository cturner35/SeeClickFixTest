//
//  SCFTwitterManager.m
//  SeeClickFixCodeTest
//
//  Created by Chris Turner on 9/16/17.
//  Copyright © 2017 Chris Turner. All rights reserved.
//

#import "SCFTwitterManager.h"
#import <TwitterKit/TwitterKit.h>
#import "SCFTConstants.h"

NSString * const TWITTER_URL = @"https://api.twitter.com/1.1/search/tweets.json?q=seeclickfix.com";

@implementation SCFTwitterManager


- (instancetype)init{
    self = [super init];
    
    Twitter *twitter = [[Twitter alloc] init];
    [twitter startWithConsumerKey:TWITTER_API_KEY
                   consumerSecret:TWITTER_API_SECRET];
    
    return self;
}

+ (instancetype)sharedManager{
    static SCFTwitterManager *sharedManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[SCFTwitterManager alloc] init];
    });
    
    return sharedManager;
}

- (NSArray *)loadTweets:(SCFTTwitterCompletion)completion{
    
    TWTRAPIClient *api = [TWTRAPIClient clientWithCurrentUser];
    
    NSError *error = nil;
    NSURLRequest *request = [api URLRequestWithMethod:@"GET"
                                                  URL:TWITTER_URL
                                           parameters:nil
                                                error:&error];
    
    [api sendTwitterRequest:request completion:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        
        NSError *jsonError = nil;
        NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:data
                                                                    options:NSJSONReadingAllowFragments
                                                                      error:&jsonError];
        
        if (!error) {
            NSArray *tweets = [self createTweetsFromResponse:jsonResponse];
            completion(tweets);
        }
        
    }];
    
    return nil;
}

- (NSArray *)createTweetsFromResponse:(NSDictionary *)tweetResponse{
    
    NSMutableArray *tweets = [[NSMutableArray alloc] init];
    [tweets addObject:@"test"];
    
    return [tweets copy];
}

@end
