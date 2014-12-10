//
//  ViewController.m
//  Expenses
//
//  Created by Vijay Sharma on 2014-12-09.
//  Copyright (c) 2014 Vijay Sharma. All rights reserved.
//

#import "ExpenseListViewController.h"
#import "ExpenseListItem.h"

@interface ExpenseListViewController ()
@property(strong, nonatomic) NSMutableArray *items;
@end

@implementation ExpenseListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.items = [[NSMutableArray alloc] initWithCapacity:20];
    
    [self.items addObject:[[ExpenseListItem alloc] initExpense:@"My first expense"]];
    [self.items addObject:[[ExpenseListItem alloc] initExpense:@"My second expense"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ExpenseListItem *item = [self.items objectAtIndex:indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ExpenseListItem"];
    UILabel *label = (UILabel *)[cell viewWithTag:1000];
    
    label.text = item.expenseDescription;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
