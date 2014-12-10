//
//  ExpenseListItem.h
//  Expenses
//
//  Created by Vijay Sharma on 2014-12-10.
//  Copyright (c) 2014 Vijay Sharma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExpenseListItem : NSObject

-(instancetype) initExpense:(NSString*)expenseDescription;
@property(strong, nonatomic, readonly) NSString *expenseDescription;

@end
