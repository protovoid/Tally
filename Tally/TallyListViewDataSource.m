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


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TallyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

    Tally *tallyForCell = [TallyController sharedInstance].tallyItems[indexPath.row];
    
    // NSString *amountString = [tallyForCell.amount stringValue];
    // cell.amountLabel.text = [NSString stringWithFormat:@"$ %@", amountString];
    
    NSNumberFormatter *currencyFormatter = [[NSNumberFormatter alloc] init];
    [currencyFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    cell.amountLabel.text = [currencyFormatter stringFromNumber:tallyForCell.amount];
    cell.nameLabel.text = tallyForCell.name;
    cell.memoLabel.text = tallyForCell.memo;
    
    cell.backgroundColor = [self colorForIndex:indexPath.row];
    
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
    }
}


-(UIColor*)colorForIndex:(NSInteger) index {
    NSUInteger tallyCount = [TallyController sharedInstance].tallyItems.count - 1;
    float val = ((float)index / (float)tallyCount) * 0.8;
    return [UIColor colorWithRed:val green:1.0 blue:val + 0.1 alpha:0.85];
}

//-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
//    cell.backgroundColor = [self colorForIndex:indexPath.row];
//}



@end
