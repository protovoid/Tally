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
    [tableView registerClass:[TallyTableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [TallyController sharedInstance].tallyItems.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TallyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    // cell = [[TallyTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];

    //Tally *tallyItem = [TallyController sharedInstance].tallyItems[indexPath.row];
    


    return cell;
}


@end
