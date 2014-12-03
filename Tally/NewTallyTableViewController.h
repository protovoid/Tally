//
//  NewTallyTableViewController.h
//  Tally
//
//  Created by Chad on 12/2/14.
//  Copyright (c) 2014 Chad Williams. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewTallyTableViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *amountTextField;
@property (strong, nonatomic) IBOutlet UITextField *memoTextField;
@property (strong, nonatomic) IBOutlet UIButton *cancelButton;
@property (strong, nonatomic) IBOutlet UIButton *clearButton;
@property (strong, nonatomic) IBOutlet UIButton *saveButton;

- (IBAction)saveButtonTapped:(id)sender;

@end
