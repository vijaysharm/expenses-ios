//
//  ExpenseDetailViewController.m
//  Expenses
//
//  Created by Vijay Sharma on 2014-12-10.
//  Copyright (c) 2014 Vijay Sharma. All rights reserved.
//

#import "ExpenseDetailViewController.h"
#import "ExpenseEditViewController.h"
#import "ExpenseListItem.h"

@interface ExpenseDetailViewController ()

@end

@implementation ExpenseDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.expense.expenseDescription;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    

    [self updateView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"EditExpense"]) {
        UINavigationController *navigation = segue.destinationViewController;
        ExpenseEditViewController *controller = (ExpenseEditViewController *)navigation.topViewController;
        controller.delegate = self;
        controller.itemToEdit = self.expense;
    }
}

#pragma mark - Delegate
- (void)expenseEditViewController:(ExpenseEditViewController *)controller didFinishAddingItem:(ExpenseListItem *)expense {
    [controller.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)expenseEditViewController:(ExpenseEditViewController *)controller didFinishEditingItem:(ExpenseListItem *)expense {
    self.expense = expense;
    [self updateView];
    [self.delegate expenseEditViewController:controller didFinishEditingItem:expense];
}

- (void)expenseEditViewControllerDidCancel:(ExpenseEditViewController *)controller {
    [controller.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - private methods
- (void)updateView {
    [ExpenseDetailViewController setText:self.expense.expenseDescription
                                 onLabel:self.descriptionLabel];
    
    [ExpenseDetailViewController setText:self.expense.expenseComment
                                 onLabel:self.commentLabel];
    
    [ExpenseDetailViewController setText:[NSString stringWithFormat:@"%@", self.expense.amount]
                                 onLabel:self.amountLabel];
    
    [ExpenseDetailViewController setText:[NSDateFormatter localizedStringFromDate:self.expense.date dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle]
                                 onLabel:self.dateLabel];
}

+ (void)setText:(NSString*)text onLabel:(UILabel *)label {
    label.text = text;
    [label sizeToFit];
}

@end
