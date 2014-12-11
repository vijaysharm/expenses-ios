//
//  ViewController.m
//  Expenses
//
//  Created by Vijay Sharma on 2014-12-09.
//  Copyright (c) 2014 Vijay Sharma. All rights reserved.
//

#import "ExpenseListViewController.h"
#import "ExpenseEditViewController.h"
#import "ExpenseDetailViewController.h"
#import "ExpenseListItem.h"

@interface ExpenseListViewController ()
@property(strong, nonatomic) NSMutableArray *items;
@end

@implementation ExpenseListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.items = [[NSMutableArray alloc] initWithCapacity:20];

    [self addExpense:[[ExpenseListItem alloc] initExpense:@"1"
                                          withDescription:@"My first expense"
                                              withComment:@"comment"
                                                 withDate:[NSDate date]
                                               withAmount:@(1.20)]];

    [self addExpense:[[ExpenseListItem alloc] initExpense:@"1"
                                          withDescription:@"My second expense"
                                              withComment:@"comment"
                                                 withDate:[NSDate date]
                                               withAmount:@(4.00)]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"AddExpense"]) {
        UINavigationController *navigation = segue.destinationViewController;
        ExpenseEditViewController *controller = (ExpenseEditViewController *)navigation.topViewController;
        controller.delegate = self;
    } else if ([segue.identifier isEqualToString:@"ViewExpense"]) {
        UINavigationController *navigation = segue.destinationViewController;
        ExpenseDetailViewController *controller = (ExpenseDetailViewController *)navigation.topViewController;

        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        controller.expense = [self.items objectAtIndex:indexPath.row];
        controller.delegate = self;
    }
}

#pragma mark - table view delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ExpenseListItem *item = [self.items objectAtIndex:indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ExpenseListItem"];
    [self configureCell:cell withExpense:item];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.items removeObjectAtIndex:indexPath.row];
    
    [tableView deleteRowsAtIndexPaths:@[indexPath]
                     withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - ExpenseEditViewControllerDelegate delegate
- (void)expenseEditViewController:(ExpenseEditViewController *)controller didFinishAddingItem:(ExpenseListItem *)expense {
    NSInteger newRowIndex = [self.items count];
    [self addExpense:expense];

    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:newRowIndex inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath]
                          withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [controller.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)expenseEditViewController:(ExpenseEditViewController *)controller didFinishEditingItem:(ExpenseListItem *)expense {
    NSInteger index = [self findExpenseIndex:expense.expenseId];
    if (index >= 0) {
        [self.items setObject:expense atIndexedSubscript:index];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        [self configureCell:cell withExpense:expense];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)expenseEditViewControllerDidCancel:(ExpenseEditViewController *)controller {
    [controller.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - private methods
- (void)addExpense:(ExpenseListItem *)item {
    static int expenseId = 1;
    
    item.expenseId = [NSString stringWithFormat:@"%i", expenseId];
    [self.items addObject:item];

    expenseId++;
}

- (NSInteger)findExpenseIndex:(NSString *)expenseId {
    for (NSUInteger index = 0; index < self.items.count; index++) {
        ExpenseListItem *expense = [self.items objectAtIndex:index];
        if ([expense.expenseId isEqualToString:expenseId]) {
            return index;
        }
    }
    
    return -1;
}

- (void)configureCell:(UITableViewCell *)cell withExpense:(ExpenseListItem*) item {
    UILabel *label = (UILabel *)[cell viewWithTag:1000];
    label.text = item.expenseDescription;
}

@end
