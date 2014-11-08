//
//  NewItemViewController.m
//  Tally
//
//  Created by Chad on 11/4/14.
//  Copyright (c) 2014 Chad Williams. All rights reserved.
//

#import "NewItemViewController.h"
#import "ItemsController.h"
#import <iAd/iAd.h>

@interface NewItemViewController () <ADBannerViewDelegate>
@property (strong, nonatomic) IBOutlet ADBannerView *iadBanner;

@end

@implementation NewItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    
    CGRect frame = self.iadBanner.frame;
    self.iadBanner.frame = CGRectMake(0, self.view.frame.size.height, frame.size.width, frame.size.height);
    self.iadBanner.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveButtonTapped:(id)sender {
    
    // hide keyboard
    [self.nameTextField resignFirstResponder];
    [self.amountTextField resignFirstResponder];
    [self.memoTextField resignFirstResponder];
    
    Item *saveItem = [Item new];
    saveItem.name = self.nameTextField.text;
    saveItem.amount = self.amountTextField.text;
    saveItem.memo = self.memoTextField.text;
    
    // NSDate *now = [NSDate date];
    // saveItem.timestamp = now;
    
    /*
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:saveItem.name forKey:@"name"];
    [defaults setObject:saveItem.amount forKey:@"amount"];
    [defaults setObject:saveItem.memo forKey:@"memo"];
    [defaults synchronize];
    NSLog(@"Data saved.");
    */

    if (self.myItem) {
        [[ItemsController sharedInstance] replaceItem:self.myItem withItem:saveItem];
    } else {
        [[ItemsController sharedInstance] addItem:self.myItem];
    }
    
    
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
