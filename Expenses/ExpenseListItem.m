//
//  ExpenseListItem.m
//  Expenses
//
//  Created by Vijay Sharma on 2014-12-10.
//  Copyright (c) 2014 Vijay Sharma. All rights reserved.
//

#import "ExpenseListItem.h"

@implementation ExpenseListItem

-(instancetype) initExpense:(NSString *)expenseId
            withDescription:(NSString *)description
                withComment:(NSString *)comment
                   withDate:(NSDate *)date
                 withAmount:(NSNumber *)amount {
    if (self = [super init]) {
        _expenseId = expenseId;
        _expenseDescription = description;
        _expenseComment = comment;
        _date = date;
        _amount = amount;
    }
    
    return self;
}

@end
