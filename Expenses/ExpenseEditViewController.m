//
//  ExpenseEditViewControllerTableViewController.m
//  Expenses
//
//  Created by Vijay Sharma on 2014-12-10.
//  Copyright (c) 2014 Vijay Sharma. All rights reserved.
//

#import "ExpenseEditViewController.h"
#import "ExpenseListItem.h"

@interface ExpenseEditViewController ()

@end

@implementation ExpenseEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.itemToEdit != nil) {
        self.title = @"Edit Expense";
        self.descriptionTextField.text = self.itemToEdit.expenseDescription;
        self.doneBarButton.enabled = YES;
    } else {
        self.title = @"Add Expense";
        self.descriptionTextField.text = @"";
        self.doneBarButton.enabled = NO;
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.descriptionTextField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Navigation ViewController actions
- (IBAction)done {
    if (self.itemToEdit == nil) {
        ExpenseListItem *item = [[ExpenseListItem alloc] initExpense:@""
                                                     withDescription:self.descriptionTextField.text
                                                         withComment:@"comment"
                                                            withDate:[NSDate date]
                                                          withAmount:@(1.2)];
        [self.delegate expenseEditViewController:self didFinishAddingItem:item];
    } else {
        ExpenseListItem *item = [[ExpenseListItem alloc] initExpense:self.itemToEdit.expenseId
                                                     withDescription:self.descriptionTextField.text
                                                         withComment:@"comment"
                                                            withDate:[NSDate date]
                                                          withAmount:@(1.2)];
        [self.delegate expenseEditViewController:self didFinishEditingItem:item];
    }
}

- (IBAction)cancel {
    [self.delegate expenseEditViewControllerDidCancel:self];
}

#pragma mark - Table view data source
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

#pragma mark - TextField delegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *text = [textField.text stringByReplacingCharactersInRange:range withString:string];
    self.doneBarButton.enabled = ([text length] > 0);
    
    return YES;
}

@end
