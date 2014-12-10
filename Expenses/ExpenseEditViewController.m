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
    ExpenseListItem *item = [[ExpenseListItem alloc] initExpense: self.descriptionTextField.text];
    [self.delegate expenseEditViewController:self didFinishAddingItem:item];
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
