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

@interface NewTallyViewController () <ADBannerViewDelegate, UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet ADBannerView *iadBanner;

@end

@implementation NewTallyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nameTextField.delegate = self;
    self.amountTextField.delegate = self;
    self.memoTextField.delegate = self;

    self.view.backgroundColor = [UIColor colorWithRed:150/255.0 green:237/255.0 blue:137/255.0 alpha:1.0];
    
    // grey-out save button until validated
    self.saveButton.enabled = NO;
    
    
    
    // set up iAd
    CGRect frame = self.iadBanner.frame;
    self.iadBanner.frame = CGRectMake(0, self.view.frame.size.height, frame.size.width, frame.size.height);
    self.iadBanner.delegate = self;
    
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    [self updateSaveButton];
    return YES;
}




-(void)textFieldDidEndEditing:(UITextField *)textField {
    // add decimal point
    if (textField == self.amountTextField) {
        float amountNumber = self.amountTextField.text.floatValue;
        self.amountTextField.text = [NSString stringWithFormat:@"%.2f", amountNumber];
    }
}


-(BOOL)isTextValidated {
    if (self.nameTextField.text.length > 0 && self.amountTextField.text.length > 0 && self.memoTextField.text.length > 0) {
        return YES;
    } else {
        return NO;
    }
}

-(void)updateSaveButton {
    self.saveButton.enabled = [self isTextValidated];
}


- (IBAction)saveButtonTapped:(id)sender {
    
    // hide keyboard
    [self.nameTextField resignFirstResponder];
    [self.amountTextField resignFirstResponder];
    [self.memoTextField resignFirstResponder];
    
    // NSDate *now = [NSDate date];
    // saveItem.timestamp = now;
    
    
    [[TallyController sharedInstance] addTallyWithName:self.nameTextField.text amount:[NSNumber numberWithFloat:[self.amountTextField.text floatValue]] memo:self.memoTextField.text];

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

}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
    
}

- (void)bannerViewActionDidFinish:(ADBannerView *)banner {
    
}

@end
