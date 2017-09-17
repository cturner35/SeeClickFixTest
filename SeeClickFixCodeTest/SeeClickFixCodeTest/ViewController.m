//
//  ViewController.m
//  SeeClickFixCodeTest
//
//  Created by Chris Turner on 9/16/17.
//  Copyright © 2017 Chris Turner. All rights reserved.
//

#import "ViewController.h"
#import <TwitterKit/TwitterKit.h>
#import "SCFTwitterManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    SCFTwitterManager *manager = [SCFTwitterManager sharedManager];
    
    [manager loadTweets:^(NSArray *tweets) {
        NSLog(@"Update UI");
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
