//
//  ItemsController.m
//  Tally
//
//  Created by Chad on 11/5/14.
//  Copyright (c) 2014 Chad Williams. All rights reserved.
//

#import "ItemsController.h"

@interface ItemsController ()
// @property (nonatomic, strong) NSArray *items;

@end

@implementation ItemsController

+ (ItemsController *)sharedInstance {
    static ItemsController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ItemsController alloc] init];
        sharedInstance.items = @[]; // create empty array
        
        [sharedInstance loadFromDefaults];
    });
    return sharedInstance;
}


- (void)addItem:(Item *)item; {
    
    NSMutableArray *mutableItems = [[NSMutableArray alloc] initWithArray:self.items]; // ref all objects into a new mutable array
    
    [mutableItems addObject:item]; // adds the entry to the mutable array
    
    self.items = [mutableItems copy]; //
    
    [self synchronize];
    
}


- (void)removeItem:(Item *)item; {
    
    NSMutableArray *mutableItems = [self.items mutableCopy]; // ref all objects into a new mutable array
    
    [mutableItems removeObject:item]; // removes the entry to the mutable array
    
    self.items = [mutableItems copy];
    
    [self synchronize];
    
    
}


- (void)replaceItem:(Item *)oldItem withItem:(Item *)newItem; {
    
    if ([self.items containsObject:oldItem]) {
        
        NSMutableArray *mutableItems = [self.items mutableCopy]; // ref all objects into a new mutable array
        
        NSUInteger index = [mutableItems indexOfObject:oldItem];
        [mutableItems replaceObjectAtIndex:index withObject:newItem];
        
        self.items = [mutableItems copy];
        
        [self synchronize];
        
    }
    
}


- (void)loadFromDefaults {
    NSArray *myItems = [[NSUserDefaults standardUserDefaults] objectForKey:@"myItems"];
    
    if (myItems) {
        self.items = myItems;
    }
    
    
}


- (void)synchronize {
    [[NSUserDefaults standardUserDefaults] setObject:self.items forKey:@"myItems"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
}

@end
