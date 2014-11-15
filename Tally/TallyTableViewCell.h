//
//  TallyTableViewCell.h
//  Tally
//
//  Created by Chad on 11/12/14.
//  Copyright (c) 2014 Chad Williams. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TallyTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *amountLabel;
@property (weak, nonatomic) IBOutlet UILabel *memoLabel;




@end
