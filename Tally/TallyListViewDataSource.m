//
//  ItemViewDataSource.m
//  Tally
//
//  Created by Chad on 11/6/14.
//  Copyright (c) 2014 Chad Williams. All rights reserved.
//

#import "TallyListViewDataSource.h"
#import "TallyController.h"
#import "TallyTableViewCell.h"

@interface TallyListViewDataSource () <UITableViewDataSource>

@end

@implementation TallyListViewDataSource

- (void)registerTableView:(UITableView *)tableView{
    [tableView registerNib:[UINib nibWithNibName:@"TallyTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [TallyController sharedInstance].tallyItems.count;
    
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TallyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

    // cell = [[TallyTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];

    Tally *tallyForCell = [TallyController sharedInstance].tallyItems[indexPath.row];
    
    NSString *amountString = [tallyForCell.amount stringValue];
    
    cell.nameLabel.text = tallyForCell.name;
    cell.amountLabel.text = amountString;
    cell.memoLabel.text = tallyForCell.memo;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        Tally *tallyToDelete = [TallyController sharedInstance].tallyItems[indexPath.row];
        [[TallyController sharedInstance] removeItem:tallyToDelete];
        
        // [tableView reloadData];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        
        NSLog(@"Awesome!");
    }
}

@end
