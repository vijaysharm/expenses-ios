//
//  ExpenseDetailViewController.h
//  Expenses
//
//  Created by Vijay Sharma on 2014-12-10.
//  Copyright (c) 2014 Vijay Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExpenseEditViewController.h"

@class ExpenseListItem;

@interface ExpenseDetailViewController : UIViewController <ExpenseEditViewControllerDelegate>

@property (weak, nonatomic) id<ExpenseEditViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *amountLabel;
@property (strong, nonatomic) ExpenseListItem *expense;

@end
