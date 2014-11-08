//
//  Item.m
//  Tally
//
//  Created by Chad on 11/4/14.
//  Copyright (c) 2014 Chad Williams. All rights reserved.
//

#import "Item.h"

@implementation Item

-(NSDictionary *)itemsDictionary {
    NSMutableDictionary *itemsDictionary = [NSMutableDictionary new];
    if (self.name != nil) {
        itemsDictionary[@"name"] = self.name;
    }
    
    if (self.amount != nil) {
        itemsDictionary[@"amount"] = self.amount;
    }
    
    if (self.memo != nil) {
        itemsDictionary[@"memo"] = self.memo;
    }
    
    return itemsDictionary;
}

-(id)initWithDictionary:(NSDictionary *)dictionary {
    if (self != nil) {
        self.name = [dictionary objectForKey:@"name"];
        self.amount = [dictionary objectForKey:@"amount"];
        self.memo = [dictionary objectForKey:@"memo"];
    }
    return self;
}

@end
