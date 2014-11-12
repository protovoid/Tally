//
//  NewItemViewController.h
//  Tally
//
//  Created by Chad on 11/4/14.
//  Copyright (c) 2014 Chad Williams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tally.h"

@interface NewTallyViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *amountTextField;
@property (strong, nonatomic) IBOutlet UITextField *memoTextField;
@property (strong, nonatomic) IBOutlet UIButton *saveButton;
@property (strong, nonatomic) IBOutlet UIButton *clearButton;

@property (strong, nonatomic) Tally *myTally;

- (IBAction)saveButtonTapped:(id)sender;


@end
