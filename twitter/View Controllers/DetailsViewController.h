//
//  DetailsViewController.h
//  twitter
//
//  Created by Rodjina Pierre Louis on 7/5/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *userProfilePicture;
@property (strong, nonatomic) IBOutlet UILabel *userNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *screenNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property (nonatomic, strong) IBOutlet UILabel *tweetLabel;
@property (strong, nonatomic) IBOutlet UILabel *retweetCountLabel;
@property (strong, nonatomic) IBOutlet UILabel *favoriteCountLabel;
@property (strong, nonatomic) IBOutlet UILabel *quoteTweetCountLabel;
@property (strong, nonatomic) IBOutlet UIImageView *favoriteImage;
@property (strong, nonatomic) IBOutlet UIImageView *retweetImage;

@property (nonatomic, strong) Tweet *detailTweet;

@end

NS_ASSUME_NONNULL_END
