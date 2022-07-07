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
//    Tweet *tweet = self.detailTweet;
    User *user = self.detailTweet.user;
    
    self.tweetLabel.text = self.detailTweet.text;
    self.userNameLabel.text = user.name;
    self.screenNameLabel.text = [NSString stringWithFormat:@"@%@", user.screenName];
    
    // Date Label
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"E MMM d HH:mm:ss Z y"];
    NSDate *date  = [dateFormatter dateFromString:[NSString stringWithFormat:@"%@", self.detailTweet.createdAt]];
    [dateFormatter setDateFormat:@"MMM, d yyyy"];
    NSString *newDate = [dateFormatter stringFromDate:date];
    NSString *dateLabel = newDate;
    
    // Time Label
    [dateFormatter setDateFormat:@"h:mm a"];
    newDate = [dateFormatter stringFromDate:date];
    self.timeLabel.text = [NSString stringWithFormat:@"%@ · %@ · ", newDate, dateLabel];

    
    self.retweetCountLabel.text = [NSString stringWithFormat:@"%@", [self.detailTweet valueForKey:@"retweetCount"]];
    self.favoriteCountLabel.text = [NSString stringWithFormat:@"%@", [self.detailTweet valueForKey:@"favoriteCount"]];
    self.quoteTweetCountLabel.text = [NSString stringWithFormat:@"%@", [self.detailTweet valueForKey:@"quoteCount"]];

    if (self.detailTweet.favorited){
        self.favoriteImage.image = [UIImage imageNamed:@"favor-icon-red.png"];
    }
    if (self.detailTweet.retweeted){
        self.retweetImage.image = [UIImage imageNamed:@"retweet-icon-green.png"];
    }
    
    // User Profile
    NSString *URLString = user.profilePicture;
    NSURL *url = [NSURL URLWithString:URLString];
    NSData *urlData = [NSData dataWithContentsOfURL:url];

    self.userProfilePicture.image = nil;
    self.userProfilePicture.image = [UIImage imageWithData:urlData];

    // Image Transformations
    self.userProfilePicture.layer.cornerRadius = self.userProfilePicture.frame.size.width / 2;
    self.userProfilePicture.clipsToBounds = true;
}

- (IBAction)backButton:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)likeButton:(id)sender {
    if (!self.detailTweet.favorited) {
    [[APIManager shared] favorite:self.detailTweet completion:^(Tweet *tweet, NSError *error) {
         if(error) {
              NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
         }
         else {
             NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
             
             UIImage *favorImage = [UIImage imageNamed:@"favor-icon-red.png"];
         
             [self.favoriteImage setImage:favorImage];
             self.detailTweet.favorited = YES;
             self.detailTweet.favoriteCount += 1;
             self.favoriteCountLabel.text = [NSString stringWithFormat:@"%d", self.detailTweet.favoriteCount];
         }
        }];
    } else {
        [[APIManager shared] unfavorite:self.detailTweet completion:^(Tweet *tweet, NSError *error) {
             if(error) {
                  NSLog(@"Error unfavoriting tweet: %@", error.localizedDescription);
             }
             else {
                 NSLog(@"Successfully unfavorited the following Tweet: %@", tweet.text);
                 
                 UIImage *unfavorImage = [UIImage imageNamed:@"favor-icon.png"];
             
                 [self.favoriteImage setImage:unfavorImage];
                 self.detailTweet.favorited = NO;
                 self.detailTweet.favoriteCount -= 1;
                 self.favoriteCountLabel.text = [NSString stringWithFormat:@"%d", self.detailTweet.favoriteCount];
             }
            }];
    }
}


- (IBAction)retweetButton:(id)sender {
    if (!self.detailTweet.retweeted) {
    [[APIManager shared] retweet:self.detailTweet completion:^(Tweet *tweet, NSError *error) {
         if(error) {
              NSLog(@"Error retweeting tweet: %@", error.localizedDescription);
         }
         else {
             NSLog(@"Successfully retweeted the following Tweet: %@", tweet.text);
             
             UIImage *retweetImage = [UIImage imageNamed:@"retweet-icon-green.png"];
         
             [self.retweetImage setImage:retweetImage];
             self.detailTweet.retweeted = YES;
             self.detailTweet.retweetCount += 1;
             self.retweetCountLabel.text = [NSString stringWithFormat:@"%d", self.detailTweet.retweetCount];
         }
        }];
    } else {
        [[APIManager shared] unretweet:self.detailTweet completion:^(Tweet *tweet, NSError *error) {
             if(error) {
                  NSLog(@"Error unretweeting tweet: %@", error.localizedDescription);
             }
             else {
                 NSLog(@"Successfully unretweeted the following Tweet: %@", tweet.text);
                 
                 UIImage *retweetImage = [UIImage imageNamed:@"retweet-icon.png"];
             
                 [self.retweetImage setImage:retweetImage];
                 self.detailTweet.retweeted = NO;
                 self.detailTweet.retweetCount -= 1;
                 self.retweetCountLabel.text = [NSString stringWithFormat:@"%d", self.detailTweet.retweetCount];
             }
            }];
    }
}

@end
