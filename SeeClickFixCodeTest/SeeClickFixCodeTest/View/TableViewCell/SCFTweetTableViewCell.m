//
//  SCFTTweetTableViewCell.m
//  SeeClickFixCodeTest
//
//  Created by Chris Turner on 9/17/17.
//  Copyright © 2017 Chris Turner. All rights reserved.
//

#import "SCFTweetTableViewCell.h"

@interface SCFTweetTableViewCell()
{
    NSString *_screenName;
    NSString *_statusText;
    NSString *_authorProfileImagePath;
}

@property(nonatomic, weak) IBOutlet UILabel *screenNameLabel;
@property(nonatomic, weak) IBOutlet UILabel *statusTextLabel;
@property(nonatomic, weak) IBOutlet UIImageView *authorProfileImageView;

@end

@implementation SCFTweetTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setScreenName:(NSString *)screenName
{
    _screenName = screenName;
    self.screenNameLabel.text = _screenName;
}

- (void)setStatusText:(NSString *)statusText
{
    _statusText = statusText;
    self.statusTextLabel.text = _statusText;
}

- (void)setAuthProfileImagePath:(NSString*)profileImageUrl{
    _authorProfileImagePath = profileImageUrl;
    
    NSURL *imageUrl = [NSURL URLWithString:_authorProfileImagePath];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
        
            dispatch_async(dispatch_get_main_queue(), ^{
                UIImage *image = [[UIImage alloc] initWithData:imageData];
                
                self.authorProfileImageView.image = image;
            });
    });

}

@end
