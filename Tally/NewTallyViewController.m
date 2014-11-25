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
@property(readwrite, retain) UIView *inputAccessoryView;

@end

@implementation NewTallyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nameTextField.delegate = self;
    self.amountTextField.delegate = self;
    self.memoTextField.delegate = self;
    
//    self.inputAccessoryView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 20)];
//    self.inputAccessoryView.backgroundColor = [UIColor redColor];
    UIToolbar *inputToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 0, 50)];
    self.nameTextField.inputAccessoryView = inputToolbar;
    self.amountTextField.inputAccessoryView = inputToolbar;
    self.memoTextField.inputAccessoryView = inputToolbar;
    
    // UIBarButtonItem *prevBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(prevTextField)];
    UIImage *less_than = [UIImage imageNamed:@"less_than-50.png"];
    UIImage *more_than = [UIImage imageNamed:@"more_than-50.png"];
    UIBarButtonItem *prevBarButton = [[UIBarButtonItem alloc] initWithImage:less_than style:UIBarButtonItemStylePlain target:self action:@selector(prevTextField)];
    UIBarButtonItem *fixedSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];
    UIBarButtonItem *nextBarButton = [[UIBarButtonItem alloc] initWithImage:more_than style:UIBarButtonItemStylePlain target:self action:@selector(nextTextField)];
    UIBarButtonItem *doneBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(hideKeyboard)];
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    fixedSpace.width = 20;
    inputToolbar.items = @[prevBarButton, fixedSpace, nextBarButton, flexSpace, doneBarButton];
    
    
    
    
    

    
    

    self.view.backgroundColor = [UIColor colorWithRed:150/255.0 green:237/255.0 blue:137/255.0 alpha:1.0];
    
    // grey-out save button until validated
    self.saveButton.enabled = NO;
    
    
    // hide keyboard when tapped outside
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.view addGestureRecognizer:tapGesture];
    
    
    
    
    // set up iAd
    CGRect frame = self.iadBanner.frame;
    self.iadBanner.frame = CGRectMake(0, self.view.frame.size.height, frame.size.width, frame.size.height);
    self.iadBanner.delegate = self;
    
}

-(void)prevTextField {
    if ([self.amountTextField isEditing]) {
        [self.memoTextField becomeFirstResponder];
    } else if ([self.memoTextField isEditing]) {
        [self.amountTextField becomeFirstResponder];
    }
}
                             
-(void)nextTextField {
    if ([self.nameTextField isEditing]) {
        [self.amountTextField becomeFirstResponder];
    } else if ([self.amountTextField isEditing]) {
        [self.memoTextField becomeFirstResponder];
    }
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self nextTextField];
    return YES;
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
    [self hideKeyboard];
    
    // NSDate *now = [NSDate date];
    // saveItem.timestamp = now;
    
    
    [[TallyController sharedInstance] addTallyWithName:self.nameTextField.text amount:[NSNumber numberWithFloat:[self.amountTextField.text floatValue]] memo:self.memoTextField.text];
    
    // pop back to TallyListViewController
    [self.navigationController popViewControllerAnimated:YES];
    

}

-(void)hideKeyboard {
    [self.nameTextField resignFirstResponder];
    [self.amountTextField resignFirstResponder];
    [self.memoTextField resignFirstResponder];
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
