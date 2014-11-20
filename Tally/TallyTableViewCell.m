//
//  TallyTableViewCell.m
//  Tally
//
//  Created by Chad on 11/12/14.
//  Copyright (c) 2014 Chad Williams. All rights reserved.
//

#import "TallyTableViewCell.h"

@implementation TallyTableViewCell

@synthesize nameLabel = _nameLabel;
@synthesize amountLabel = _amountLabel;
@synthesize memoLabel = _memoLabel;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self setup];
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setup {
    
//    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeftToDelete:)];
//    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
//    [self addGestureRecognizer:swipeLeft];
    
    
    
    // self.contentView.backgroundColor = [UIColor redColor];
    
//     create labels
//    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 90, 20)];
//    self.nameLabel = nameLabel;
//    
//    UILabel *amountLabel = [[UILabel alloc] initWithFrame:CGRectMake(260, 0, 50, 43)];
//    self.amountLabel = amountLabel;
//    
//    UILabel *memoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 100, 20)];
//    self.memoLabel = memoLabel;
//    
//    
//    
//    // configure labels
//    nameLabel.backgroundColor = [UIColor yellowColor];
//    [self.nameLabel setFont:[UIFont boldSystemFontOfSize:24.0]];
//    [self.nameLabel setTextAlignment:NSTextAlignmentLeft];
//    [self.nameLabel setTextColor:[UIColor blueColor]];
//    // [self.nameLabel setAutoresizingMask:(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight)];
//    
//    amountLabel.backgroundColor = [UIColor orangeColor];
//    [self.amountLabel setFont:[UIFont boldSystemFontOfSize:18.0]];
//    [self.amountLabel setTextAlignment:NSTextAlignmentRight];
//    [self.amountLabel setTextColor:[UIColor greenColor]];
//    // [self.amountLabel setAutoresizingMask:(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight)];
//    
//    memoLabel.backgroundColor = [UIColor blueColor];
//    [self.memoLabel setFont:[UIFont boldSystemFontOfSize:10.0]];
//    [self.memoLabel setTextAlignment:NSTextAlignmentLeft];
//    [self.memoLabel setTextColor:[UIColor grayColor]];
//    // [self.memoLabel setAutoresizingMask:(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight)];
//    
//    
//     self.nameLabel.text = @"test";
//    [self addSubview:nameLabel];
//    [self addSubview:amountLabel];
//    [self addSubview:memoLabel];
    
}



//- (IBAction)swipeLeftToDelete:(id)sender {
//    if (swipeLeft.state == UIGestureRecognizerStateEnded) {
//        //handle the gesture
//    }
//}
@end
