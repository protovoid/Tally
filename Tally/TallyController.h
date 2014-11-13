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

+ (TallyController *)sharedInstance;
- (void)addTallyWithName:(NSString*)name amount:(NSNumber *)amount memo:(NSString *)memo;
- (void)removeItem:(Tally *)item;
- (void)replaceItem:(Tally *)oldItem withItem:(Tally *)newItem;
- (void)synchronize;

- (NSArray *)tallyItems;

@end
