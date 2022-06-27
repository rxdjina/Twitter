//
//  ComposeViewController.h
//  twitter
//
//  Created by Rodjina Pierre Louis on 6/26/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Tweet.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ComposeViewConrollerDelegate

//@property (weak, nonatomic) id<ComposeViewConrollerDelegate> delegate;

- (void)didTweet:(Tweet *)tweet;

@end

@interface ComposeViewController : UIViewController

@property (weak, nonatomic) id<ComposeViewConrollerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
