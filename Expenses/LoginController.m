//
//  LoginController.m
//  Expenses
//
//  Created by Vijay Sharma on 2014-12-11.
//  Copyright (c) 2014 Vijay Sharma. All rights reserved.
//

#import "LoginController.h"
#import "LoginResponse.h"
#import "LoginRequest.h"

@interface LoginController ()

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.usernameTextField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - view actions
- (IBAction)didPressLogin {
    LoginRequest *request = [LoginRequest new];
    request.username = @"vijay";
    request.password = @"password";
    
    [self.operations login:request success:^(LoginResponse *response) {
        NSLog(@"Successfully logged in");
    } failure:^(NSError *error) {
        NSLog(@"Failed to log in %@", error);
    }];
}

@end
