//
//  ItemListViewController.m
//  Tally
//
//  Created by Chad on 11/4/14.
//  Copyright (c) 2014 Chad Williams. All rights reserved.
//

#import "ItemListViewController.h"
#import "ItemViewDatasource.h"

@interface ItemListViewController () <UITableViewDelegate>

@property (nonatomic, strong) UITableView *itemListTableView;
@property (nonatomic, strong) ItemViewDataSource *dataSource;

@end

@implementation ItemListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.itemListTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.dataSource = [ItemViewDataSource new];
    self.itemListTableView.dataSource = self.dataSource;
    
    self.itemListTableView.delegate = self;
    
    self.title = @"Title";
    self.itemListTableView.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:self.itemListTableView];
    
    // [self.itemListTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addItemButtonTapped:(id)sender {
}
@end
