//
//  ExpensesAssembly.m
//  Expenses
//
//  Created by Vijay Sharma on 2014-12-09.
//  Copyright (c) 2014 Vijay Sharma. All rights reserved.
//

#import "AppDelegate.h"
#import "ExpensesAssembly.h"
#import "LoginController.h"
#import "LoginOperation.h"
#import "RestKitLoginOperation.h"
#import "TyphoonConfigPostProcessor.h"
#import "TyphoonDefinition+Infrastructure.h"

@implementation ExpensesAssembly

- (id)config {
    return [TyphoonDefinition configDefinitionWithName:@"Configuration.plist"];
}

- (LoginController *) loginController {
    return [TyphoonDefinition withClass:LoginController.class configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(operations) with:[self loginOperations]];
    }];
}

- (id<LoginOperation>) loginOperations {
    return [TyphoonDefinition withClass:RestKitLoginOperation.class configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithUrl:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:TyphoonConfig(@"service.url")];
        }];
        definition.scope = TyphoonScopeSingleton;
    }];
}

@end
