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

@property (nonatomic, strong) UITableView *tallyListTableView;
@property (nonatomic, strong) TallyListViewDataSource *dataSource;

@end

@implementation TallyListViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tallyListTableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tallyListTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.dataSource = [TallyListViewDataSource new];
    [self.dataSource registerTableView:self.tallyListTableView];
    self.tallyListTableView.dataSource = self.dataSource;
    
    self.tallyListTableView.allowsMultipleSelection = NO;
    
    self.tallyListTableView.delegate = self;
    
    self.title = @"Tally";
    self.tallyListTableView.backgroundColor = [UIColor colorWithRed:69/255.0 green:191/255.0 blue:85/255.0 alpha:1.0];
    
    [self.view addSubview:self.tallyListTableView];

    
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 78;
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
