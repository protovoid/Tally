//
//  NewItemViewController.m
//  Tally
//
//  Created by Chad on 11/4/14.
//  Copyright (c) 2014 Chad Williams. All rights reserved.
//

#import "NewTallyViewController.h"
#import "TallyController.h"
#import "Tally.h"
#import "Stack.h"
#import <iAd/iAd.h>

@interface NewTallyViewController () <ADBannerViewDelegate>
@property (strong, nonatomic) IBOutlet ADBannerView *iadBanner;

@end

@implementation NewTallyViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithRed:150/255.0 green:237/255.0 blue:137/255.0 alpha:1.0];
    
    CGRect frame = self.iadBanner.frame;
    self.iadBanner.frame = CGRectMake(0, self.view.frame.size.height, frame.size.width, frame.size.height);
    self.iadBanner.delegate = self;
    
}

- (IBAction)saveButtonTapped:(id)sender {
    
    // hide keyboard
    [self.nameTextField resignFirstResponder];
    [self.amountTextField resignFirstResponder];
    [self.memoTextField resignFirstResponder];
    
    // NSDate *now = [NSDate date];
    // saveItem.timestamp = now;

    if (self.nameTextField.text.length > 0 && self.amountTextField.text.length > 0 && self.memoTextField.text.length > 0) {
        [[TallyController sharedInstance] addTallyWithName:self.nameTextField.text amount:[NSNumber numberWithFloat:[self.amountTextField.text floatValue]] memo:self.memoTextField.text];        
    }
    
    [self.navigationController popViewControllerAnimated:YES];

}


- (IBAction)clearButtonTapped:(id)sender {
    self.nameTextField.text = @"";
    self.amountTextField.text = @"";
    self.memoTextField.text = @"";
    [self.nameTextField becomeFirstResponder];
}

#pragma mark - iad methods

- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave {
    return YES;
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner {
    /*
     [UIView animateWithDuration:0.5 animations:^{
     CGRect frame = self.iadBanner.frame;
     self.iadBanner.frame = CGRectMake(0, self.view.frame.size.height - frame.size.height, frame.size.width, frame.size.height);
     
     }];
     */
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
    
}

- (void)bannerViewActionDidFinish:(ADBannerView *)banner {
    
}

@end
