//
//  ItemsController.h
//  Tally
//
//  Created by Chad on 11/5/14.
//  Copyright (c) 2014 Chad Williams. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tally.h"

@interface TallyController : NSObject

@property (nonatomic, strong) NSArray *tallyItems;

+ (TallyController *)sharedInstance;
- (void)addItem:(Tally *)item;
- (void)removeItem:(Tally *)item;
- (void)replaceItem:(Tally *)oldItem withItem:(Tally *)newItem;
- (void)loadFromDefaults;
- (void)synchronize;

@end
