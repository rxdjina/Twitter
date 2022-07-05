//
//  DetailsViewController.m
//  twitter
//
//  Created by Rodjina Pierre Louis on 7/5/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "DetailsViewController.h"
#import "TimelineViewController.h"
#import "APIManager.h"
#import "Tweet.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%@", self.detailTweet);
    User *user = [self.detailTweet valueForKey:@"user"];
    
    self.tweetLabel.text = [self.detailTweet valueForKey:@"text"];
    self.userNameLabel.text = user.name;
    self.screenNameLabel.text = [NSString stringWithFormat:@"@%@", user.screenName];
    self.dateLabel.text = [self.detailTweet valueForKey:@"createdAtString"];
    self.retweetCountLabel.text = [NSString stringWithFormat:@"%@", [self.detailTweet valueForKey:@"retweetCount"]];
    self.favoriteCountLabel.text = [NSString stringWithFormat:@"%@", [self.detailTweet valueForKey:@"favoriteCount"]];
    self.replyCountLabel.text = [NSString stringWithFormat:@"%@", [self.detailTweet valueForKey:@"replyCount"]];

//
    NSString *URLString = user.profilePicture;
    NSURL *url = [NSURL URLWithString:URLString];
    NSData *urlData = [NSData dataWithContentsOfURL:url];
//
    self.userProfilePicture.image = nil;
    self.userProfilePicture.image = [UIImage imageWithData:urlData];
//
//    // Transformations
    self.userProfilePicture.layer.cornerRadius = self.userProfilePicture.frame.size.width / 2;
    self.userProfilePicture.clipsToBounds = true;
}

- (IBAction)backButton:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)retweetButton:(id)sender {
    
}

- (IBAction)likeButton:(id)sender {
    [[APIManager shared] favorite:self.detailTweet completion:^(Tweet *tweet, NSError *error) {
         if(error) {
              NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
         }
         else {
             NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
             
             UIImage *favorImage = [UIImage imageNamed:@"favor-icon-red.png"];
         
             [self.favoriteImage setImage:favorImage];
         }
        }];
}

@end
