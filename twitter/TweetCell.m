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
}

- (IBAction)didTapFavorite:(id)sender {
//    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:self.tableView];
//    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:buttonPosition];
//
//    NSLog(@"%@ %@",buttonPosition, indexPath);
    NSLog(@"%ld", (long)self.favoriteButton.tag);
    
    self.tweet.favorited = YES;
    self.tweet.favoriteCount += 1;
    UIImage *favorImage = [UIImage imageNamed:@"favor-icon-red.png"];
//    [self.favoriteImage setImage:favorImage];
    
    [self.favoriteButton setImage:favorImage forState:UIControlStateNormal];
//
//    self.favoriteButton.imageView.contentMode = UIViewContentModeScaleAspectFill;
//    self.favoriteButton.contentVerticalAlignment = UIControlContentVerticalAlignmentFill;
//    self.favoriteButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentFill;
//    [self.favoriteButton setFrame:CGRectMake(265, 60, 21, 21)];
    
//    [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
//     if(error) {
//          NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
//     }
//     else {
//         NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
//     }
//    }];
}


@end
