//
//  TweetCellTableViewCell.m
//  twitter
//
//  Created by Rodjina Pierre Louis on 6/24/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"
#import "APIManager.h"

@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
//    self.tweet =
}

- (IBAction)didTapFavorite:(id)sender {
    if (!self.tweet.favorited) {
    [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
         if(error) {
              NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
         }
         else {
             NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
             
             UIImage *favorImage = [UIImage imageNamed:@"favor-icon-red.png"];
         
             [self.favoriteImage setImage:favorImage];
             self.tweet.favorited = YES;
             self.tweet.favoriteCount += 1;
             self.favoriteCountLabel.text = [NSString stringWithFormat:@"%d", self.tweet.favoriteCount];
         }
        }];
    } else {
        [[APIManager shared] unfavorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
             if(error) {
                  NSLog(@"Error unfavoriting tweet: %@", error.localizedDescription);
             }
             else {
                 NSLog(@"Successfully unfavorited the following Tweet: %@", tweet.text);
                 
                 UIImage *unfavorImage = [UIImage imageNamed:@"favor-icon.png"];
             
                 [self.favoriteImage setImage:unfavorImage];
                 self.tweet.favorited = NO;
                 self.tweet.favoriteCount -= 1;
                 self.favoriteCountLabel.text = [NSString stringWithFormat:@"%d", self.tweet.favoriteCount];
             }
            }];
    }
}


@end
