//
//  TallyTableViewCell.h
//  Tally
//
//  Created by Chad on 11/12/14.
//  Copyright (c) 2014 Chad Williams. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TallyTableViewCell : UITableViewCell

@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *amountLabel;
@property (strong, nonatomic) UILabel *memoLabel;

@end
