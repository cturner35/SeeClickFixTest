//
//  SCFTTweetTableViewCell.h
//  SeeClickFixCodeTest
//
//  Created by Chris Turner on 9/17/17.
//  Copyright © 2017 Chris Turner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCFTweetTableViewCell : UITableViewCell



- (void)setScreenName:(NSString *)screenName;
- (void)setStatusText:(NSString *)statusText;
- (void)setAuthProfileImagePath:(NSString*)profileImageUrl;

@end
