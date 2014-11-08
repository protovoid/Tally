//
//  ItemViewDataSource.m
//  Tally
//
//  Created by Chad on 11/6/14.
//  Copyright (c) 2014 Chad Williams. All rights reserved.
//

#import "ItemViewDataSource.h"
#import "ItemsController.h"

@interface ItemViewDataSource () <UITableViewDataSource>

@end

@implementation ItemViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [ItemsController sharedInstance].items.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    Item *tallyItem = [ItemsController sharedInstance].items[indexPath.row];
    
    cell.textLabel.text = tallyItem.name;
    
    return cell;
}

/*
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
 DXEntry *entry = [ESEntryController sharedInstance].entries[indexPath.row];
 
 NSDictionary *dict = [ESEntryController sharedInstance].entries[indexPath.row];
 NSString *title = dict[TitleKey];
 
 cell.textLabel.text = entry.title;
 
 return cell;
 
 }
 */

@end
