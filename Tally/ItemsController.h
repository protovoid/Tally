//
//  ItemsController.h
//  Tally
//
//  Created by Chad on 11/5/14.
//  Copyright (c) 2014 Chad Williams. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"

@interface ItemsController : NSObject

@property (nonatomic, strong) NSArray *items;

+ (ItemsController *)sharedInstance;
- (void)addItem:(Item *)item;
- (void)removeItem:(Item *)item;
- (void)replaceItem:(Item *)oldItem withItem:(Item *)newItem;
- (void)loadFromDefaults;
- (void)synchronize;

@end
