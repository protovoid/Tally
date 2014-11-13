//
//  ItemListViewController.m
//  Tally
//
//  Created by Chad on 11/4/14.
//  Copyright (c) 2014 Chad Williams. All rights reserved.
//

#import "TallyListViewController.h"
#import "TallyListViewDatasource.h"

@interface TallyListViewController () <UITableViewDelegate>

@property (nonatomic, strong) UITableView *TallyListTableView;
@property (nonatomic, strong) TallyListViewDataSource *dataSource;

@end

@implementation TallyListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.TallyListTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.dataSource = [TallyListViewDataSource new];
    [self.dataSource registerTableView:self.TallyListTableView];
    self.TallyListTableView.dataSource = self.dataSource;
    
    self.TallyListTableView.delegate = self;
    
    self.title = @"Tally";
    self.TallyListTableView.backgroundColor = [UIColor colorWithRed:69/255.0 green:191/255.0 blue:85/255.0 alpha:1.0];
    
    [self.view addSubview:self.TallyListTableView];
    
    // [self.TallyListTableView reloadData];
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
