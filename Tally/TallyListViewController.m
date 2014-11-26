//
//  TallyListViewController.m
//  Tally
//
//  Created by Chad on 11/4/14.
//  Copyright (c) 2014 Chad Williams. All rights reserved.
//

#import "TallyListViewController.h"
#import "TallyListViewDatasource.h"
#import "TallyController.h"

@interface TallyListViewController () <UITableViewDelegate, TallyListViewDataSourceDelegate>

@property (nonatomic, strong) UITableView *tallyListTableView;
@property (nonatomic, strong) TallyListViewDataSource *dataSource;
@property (nonatomic) float tallyTotal;

@end

@implementation TallyListViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tallyListTableView reloadData];
    
    [self reloadTitleAmount];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tallyListTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.dataSource = [TallyListViewDataSource new];
    [self.dataSource registerTableView:self.tallyListTableView];
    self.dataSource.delegate = self;
    self.tallyListTableView.dataSource = self.dataSource;
    self.tallyListTableView.delegate = self;
    self.tallyListTableView.allowsMultipleSelection = NO;
    self.tallyListTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tallyListTableView.backgroundColor = [UIColor blackColor];
    
    // self.title = [titleFormatter stringFromNumber:tallyTotal];
    
    [self.view addSubview:self.tallyListTableView];
}

-(void)reloadTitleAmount {
    // sum of Tally amounts
    NSArray *tallys = [TallyController sharedInstance].tallyItems;
    float tallyTotal = 0;
    for (Tally *tally in tallys) {
        tallyTotal += tally.amount.floatValue;
    }
    NSNumberFormatter *titleFormatter = [[NSNumberFormatter alloc] init];
    [titleFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    self.title = [titleFormatter stringFromNumber:@(tallyTotal)];
}


#pragma mark - TallyListViewDataSource protocol method

-(void)rowDeleted {
    [self reloadTitleAmount];
}


#pragma mark - UITableViewDataDelegate protocol methods

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 78.0f;
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO];
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
