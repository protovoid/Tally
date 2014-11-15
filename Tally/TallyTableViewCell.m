//
//  TallyTableViewCell.m
//  Tally
//
//  Created by Chad on 11/12/14.
//  Copyright (c) 2014 Chad Williams. All rights reserved.
//

#import "TallyTableViewCell.h"

@implementation TallyTableViewCell


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
    
    self.contentView.backgroundColor = [UIColor redColor];
    
    //    self.amountLabel.text = tallyItem.memo;
    //    self.memoLabel.text = tallyItem.memo;
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 40)];
    self.nameLabel = nameLabel;
    nameLabel.backgroundColor = [UIColor yellowColor];
    self.nameLabel.text = @"test";
    [self addSubview:nameLabel];
    
    // self.textLabel.text = @"This text";
}

@end
