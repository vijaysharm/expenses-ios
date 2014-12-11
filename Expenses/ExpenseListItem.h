//
//  ExpenseListItem.h
//  Expenses
//
//  Created by Vijay Sharma on 2014-12-10.
//  Copyright (c) 2014 Vijay Sharma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExpenseListItem : NSObject

-(instancetype) initExpense:(NSString *)expenseId
            withDescription:(NSString *)description
                withComment:(NSString *)comment
                   withDate:(NSDate *)date
                 withAmount:(NSNumber *)amount;

@property(strong, nonatomic) NSString *expenseId;
@property(strong, nonatomic, readonly) NSString *expenseDescription;
@property(strong, nonatomic, readonly) NSString *expenseComment;
@property(strong, nonatomic, readonly) NSDate *date;
@property(strong, nonatomic, readonly) NSNumber *amount;

@end
