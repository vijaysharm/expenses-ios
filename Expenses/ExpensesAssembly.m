//
//  ExpensesAssembly.m
//  Expenses
//
//  Created by Vijay Sharma on 2014-12-09.
//  Copyright (c) 2014 Vijay Sharma. All rights reserved.
//

#import "ExpensesAssembly.h"
#import "TyphoonConfigPostProcessor.h"
#import "TyphoonDefinition+Infrastructure.h"

@implementation ExpensesAssembly

- (id)config {
    return [TyphoonDefinition configDefinitionWithName:@"Configuration.plist"];
}

@end
