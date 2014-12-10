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
    
    [self.items addObject:[[ExpenseListItem alloc] initExpense:@"My first expense"]];
    [self.items addObject:[[ExpenseListItem alloc] initExpense:@"My second expense"]];
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
    }
}

#pragma mark - table view delegate
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

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.items removeObjectAtIndex:indexPath.row];
    
    [tableView deleteRowsAtIndexPaths:@[indexPath]
                     withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - ExpenseEditViewControllerDelegate delegate
- (void)expenseEditViewController:(ExpenseEditViewController *)controller didFinishAddingItem:(ExpenseListItem *)expense {
    NSInteger newRowIndex = [self.items count];
    [self.items addObject:expense];

    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:newRowIndex inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath]
                          withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [controller.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)expenseEditViewController:(ExpenseEditViewController *)controller didFinishEditingItem:(ExpenseListItem *)expense {
/*
     NSInteger index = [_items indexOfObject:item];
     NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index
     inSection:0]; cellForRowAtIndexPath:indexPath];
     UITableViewCell *cell = [self.tableView
     [self configureTextForCell:cell withChecklistItem:item];
     [self dismissViewControllerAnimated:YES completion:nil];
*/
}

- (void)expenseEditViewControllerDidCancel:(ExpenseEditViewController *)controller {
    [controller.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
