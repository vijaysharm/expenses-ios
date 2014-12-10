//
//  ExpenseEditViewControllerTableViewController.h
//  Expenses
//
//  Created by Vijay Sharma on 2014-12-10.
//  Copyright (c) 2014 Vijay Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ExpenseListItem;
@class ExpenseEditViewController;

@protocol ExpenseEditViewControllerDelegate <NSObject>
- (void)expenseEditViewControllerDidCancel:(ExpenseEditViewController*)controller;
- (void)expenseEditViewController:(ExpenseEditViewController *)controller didFinishAddingItem:(ExpenseListItem *) expense;
@end

@interface ExpenseEditViewController : UITableViewController <UITextFieldDelegate>
@property (weak, nonatomic) id<ExpenseEditViewControllerDelegate> delegate;
@property (strong, nonatomic) ExpenseListItem *itemToEdit;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;

- (IBAction)done;
- (IBAction)cancel;
@end
