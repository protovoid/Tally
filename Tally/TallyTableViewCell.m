//
//  TallyTableViewCell.m
//  Tally
//
//  Created by Chad on 11/12/14.
//  Copyright (c) 2014 Chad Williams. All rights reserved.
//

#import "TallyTableViewCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation TallyTableViewCell
{
    CAGradientLayer* _gradientLayer;
}

@synthesize nameLabel = _nameLabel;
@synthesize amountLabel = _amountLabel;
@synthesize memoLabel = _memoLabel;


//- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    
//    // self.contentView.backgroundColor = [UIColor redColor];
//    
////    if (self) {
////        [self setup];
////    }
//    return self;
//}


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


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // add a layer that overlays the cell adding a subtle gradient effect
        _gradientLayer = [CAGradientLayer layer];
        _gradientLayer.frame = self.bounds;
        _gradientLayer.colors = @[(id)[[UIColor colorWithWhite:1.0f alpha:0.2f] CGColor],
                                  (id)[[UIColor colorWithWhite:1.0f alpha:0.1f] CGColor],
                                  (id)[[UIColor clearColor] CGColor],
                                  (id)[[UIColor colorWithWhite:0.0f alpha:0.1f] CGColor]];
        _gradientLayer.locations = @[@0.00f, @0.01f, @0.95f, @1.00f];
        [self.layer insertSublayer:_gradientLayer atIndex:0];
    }
    return self;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    // ensure the gradient layers occupies the full bounds
    _gradientLayer.frame = self.bounds;
}



@end
