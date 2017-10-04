//
//  SCFTwitterService.m
//  SeeClickFixCodeTest
//
//  Created by Chris Turner on 10/4/17.
//  Copyright © 2017 Chris Turner. All rights reserved.
//

#import "SCFTwitterService.h"
#import <TwitterKit/TwitterKit.h>
#import "SCFConstants.h"

extern NSString * const TWITTER_URL;

@implementation SCFTwitterService

- (instancetype)init{
    self = [super init];
    
    Twitter *twitter = [[Twitter alloc] init];
    [twitter startWithConsumerKey:TWITTER_API_KEY
                   consumerSecret:TWITTER_API_SECRET];
    
    return self;
}

- (NSArray *)loadTweets:(SCFTwitterCompletion)completion{
    
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
    
    NSArray *jsonTweets = tweetResponse[@"statuses"];
    NSArray *twitterTweets = [TWTRTweet tweetsWithJSONArray:jsonTweets];
    
    return [twitterTweets copy];
}


@end
