//
//  ItemViewDataSource.m
//  Tally
//
//  Created by Chad on 11/6/14.
//  Copyright (c) 2014 Chad Williams. All rights reserved.
//

#import "TallyListViewDataSource.h"
#import "TallyController.h"

@interface TallyListViewDataSource () <UITableViewDataSource>

@end

@implementation TallyListViewDataSource

- (void)registerTableView:(UITableView *)tableView{
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [TallyController sharedInstance].tallyItems.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    Tally *tallyItem = [TallyController sharedInstance].tallyItems[indexPath.row];
    
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
