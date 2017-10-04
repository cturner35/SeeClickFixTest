//
//  SCFTwitterStatusTableViewController.m
//  SeeClickFixCodeTest
//
//  Created by Chris Turner on 9/17/17.
//  Copyright © 2017 Chris Turner. All rights reserved.
//

#import "SCFTwitterStatusTableViewController.h"
#import "SCFTwitterService.h"
#import "SCFTweetTableViewCell.h"
#import <TwitterKit/TwitterKit.h>

@interface SCFTwitterStatusTableViewController ()

@property(nonatomic, strong) NSArray *tweets;
@property(nonatomic, strong) SCFTwitterService *twitterService;

//@property(nonatomic, weak) IBOutlet UIRefreshControl *refreshControl;

@end

@implementation SCFTwitterStatusTableViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        self.twitterService = [[SCFTwitterService alloc] init];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 77;
    
    //UIActivityIndicatorView *pullToRefresh = [[UIActivityIndicatorView alloc] init];

    
    [self loadTweets];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pullToRefresh:(id)sender {
    [self loadTweets];
}


- (void)loadTweets
{
    //SCFTwitterManager *manager = [SCFTwitterManager sharedManager];
    
    __weak SCFTwitterStatusTableViewController *weakSelf = self;
    [self.twitterService loadTweets:^(NSArray *tweets) {
        SCFTwitterStatusTableViewController *strongSelf = weakSelf;
        strongSelf.tweets = tweets;
        
        if (strongSelf) {
            
            if (strongSelf.refreshControl.isRefreshing) {
                [strongSelf.refreshControl endRefreshing];
            }
            
            [strongSelf updateUI];
        }
    }];
}

- (void)updateUI
{
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.tweets.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SCFTweetTableViewCell *cell = (SCFTweetTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"SCFTweetCell" forIndexPath:indexPath];
    
    TWTRTweet *tweet = self.tweets[indexPath.row];
    
    [cell setScreenName:tweet.author.name];
    [cell setStatusText:tweet.text];
    [cell setAuthProfileImagePath:tweet.author.profileImageURL];
    
    return cell;
}

@end
