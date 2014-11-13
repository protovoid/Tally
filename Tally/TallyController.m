//
//  ItemsController.m
//  Tally
//
//  Created by Chad on 11/5/14.
//  Copyright (c) 2014 Chad Williams. All rights reserved.
//

#import "TallyController.h"
#import "Stack.h"

@interface TallyController ()
// @property (nonatomic, strong) NSArray *items;

@end

@implementation TallyController

+ (TallyController *)sharedInstance {
    static TallyController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[TallyController alloc] init];        
    });
    return sharedInstance;
}


- (void)addTallyWithName:(NSString*)name amount:(NSNumber *)amount memo:(NSString *)memo {
    
    Tally *saveItem = [NSEntityDescription insertNewObjectForEntityForName:@"Tally" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    
    saveItem.name = name;
    saveItem.amount = amount;
    saveItem.memo = memo;
    
    [self synchronize];
    
}


- (void)removeItem:(Tally *)item; {
    
    NSMutableArray *mutableItems = [self.tallyItems mutableCopy]; // ref all objects into a new mutable array
    
    [mutableItems removeObject:item]; // removes the entry to the mutable array
    
    
    [self synchronize];
    
    
}


- (void)replaceItem:(Tally *)oldItem withItem:(Tally *)newItem; {
    
    if ([self.tallyItems containsObject:oldItem]) {
        
        NSMutableArray *mutableItems = [self.tallyItems mutableCopy]; // ref all objects into a new mutable array
        
        NSUInteger index = [mutableItems indexOfObject:oldItem];
        [mutableItems replaceObjectAtIndex:index withObject:newItem];
        
        
        [self synchronize];
        
    }
}

- (void)synchronize {
    [[Stack sharedInstance].managedObjectContext save:nil];
}

- (NSArray *)tallyItems {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Tally"];
    
    return [[Stack sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:nil];
}


@end
