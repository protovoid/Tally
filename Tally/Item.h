//
//  Item.h
//  Tally
//
//  Created by Chad on 11/4/14.
//  Copyright (c) 2014 Chad Williams. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

@property (nonatomic, weak) NSString *name;
@property (nonatomic, weak) NSString *amount;
@property (nonatomic, weak) NSString *memo;

-(NSDictionary *)itemsDictionary;
-(id)initWithDictionary:(NSDictionary *)dictionary;

@end
