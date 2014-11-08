//
//  ItemListViewController.h
//  Tally
//
//  Created by Chad on 11/4/14.
//  Copyright (c) 2014 Chad Williams. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TallyListViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addItemButton;

- (IBAction)addItemButtonTapped:(id)sender;


@end
