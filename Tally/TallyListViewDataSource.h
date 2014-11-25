//
//  TallyListViewDataSource.h
//  Tally
//
//  Created by Chad on 11/6/14.
//  Copyright (c) 2014 Chad Williams. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol TallyListViewDataSourceDelegate <NSObject>

-(void)rowDeleted;

@end

@interface TallyListViewDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, assign) id <TallyListViewDataSourceDelegate> delegate;

- (void)registerTableView:(UITableView *)tableView;

@end
