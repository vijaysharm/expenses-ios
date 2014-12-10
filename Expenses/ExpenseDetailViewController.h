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
@property (strong, nonatomic) ExpenseListItem *expense;
@end
