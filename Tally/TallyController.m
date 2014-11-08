//
//  ItemsController.m
//  Tally
//
//  Created by Chad on 11/5/14.
//  Copyright (c) 2014 Chad Williams. All rights reserved.
//

#import "TallyController.h"

@interface TallyController ()
// @property (nonatomic, strong) NSArray *items;

@end

@implementation TallyController

+ (TallyController *)sharedInstance {
    static TallyController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[TallyController alloc] init];
        sharedInstance.tallyItems = @[]; // create empty array
        
        [sharedInstance loadFromDefaults];
    });
    return sharedInstance;
}


- (void)addItem:(Tally *)item; {
    
    NSMutableArray *mutableItems = [[NSMutableArray alloc] initWithArray:self.tallyItems]; // ref all objects into a new mutable array
    
    [mutableItems addObject:item]; // adds the entry to the mutable array
    
    self.tallyItems = [mutableItems copy]; //
    
    [self synchronize];
    
}


- (void)removeItem:(Tally *)item; {
    
    NSMutableArray *mutableItems = [self.tallyItems mutableCopy]; // ref all objects into a new mutable array
    
    [mutableItems removeObject:item]; // removes the entry to the mutable array
    
    self.tallyItems = [mutableItems copy];
    
    [self synchronize];
    
    
}


- (void)replaceItem:(Tally *)oldItem withItem:(Tally *)newItem; {
    
    if ([self.tallyItems containsObject:oldItem]) {
        
        NSMutableArray *mutableItems = [self.tallyItems mutableCopy]; // ref all objects into a new mutable array
        
        NSUInteger index = [mutableItems indexOfObject:oldItem];
        [mutableItems replaceObjectAtIndex:index withObject:newItem];
        
        self.tallyItems = [mutableItems copy];
        
        [self synchronize];
        
    }
    
}


- (void)loadFromDefaults {
    NSArray *myItems = [[NSUserDefaults standardUserDefaults] objectForKey:@"myItems"];
    
    if (myItems) {
        self.tallyItems = myItems;
    }
    
    
}


- (void)synchronize {
    [[NSUserDefaults standardUserDefaults] setObject:self.tallyItems forKey:@"myItems"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
}

@end
