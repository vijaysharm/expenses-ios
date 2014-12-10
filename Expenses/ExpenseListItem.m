//
//  ExpenseListItem.m
//  Expenses
//
//  Created by Vijay Sharma on 2014-12-10.
//  Copyright (c) 2014 Vijay Sharma. All rights reserved.
//

#import "ExpenseListItem.h"

@implementation ExpenseListItem

-(instancetype) initExpense:(NSString*)description {
    if (self = [super init]) {
        _expenseDescription = description;
    }
    
    return self;
}

@end
