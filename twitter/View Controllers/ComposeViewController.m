//
//  ComposeViewController.m
//  twitter
//
//  Created by Rodjina Pierre Louis on 6/26/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"
#import "APIManager.h"
#import "AppDelegate.h"

@interface ComposeViewController () <UITextViewDelegate>

@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *closeButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *tweetButton;

@property (strong, nonatomic) NSString *userInput;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textView.delegate = self;
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    self.textView.text = @"";
    self.textView.textColor = [UIColor blackColor];
}

- (void)textViewDidChange:(UITextView *)textView {
    if (self.textView.text.length == 0) {
        self.textView.textColor = [UIColor lightGrayColor];
        self.textView.text = @"What's on your mind?";
        [self.textView resignFirstResponder];
    }
    self.userInput = textView.text;
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    if (self.textView.text.length == 0) {
        self.textView.textColor = [UIColor lightGrayColor];
        self.textView.text = @"Sample Text";
        [self.textView resignFirstResponder];
    }
}

- (IBAction)buttonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)tweet:(id)sender {
    [[APIManager shared]postStatusWithText:self.userInput completion:^(Tweet *tweet, NSError *error) {
        if(error){
            NSLog(@"Error composing Tweet: %@", error.localizedDescription);
        }
        else{
            [self.delegate didTweet:tweet];
            NSLog(@"Compose Tweet Success!");
        }
    }];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
