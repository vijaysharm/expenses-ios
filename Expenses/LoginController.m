//
//  LoginController.m
//  Expenses
//
//  Created by Vijay Sharma on 2014-12-11.
//  Copyright (c) 2014 Vijay Sharma. All rights reserved.
//

#import "LoginController.h"
#import "AppDelegate.h"

@interface LoginController ()

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - view actions
- (IBAction)didPressLogin {
    [self performSegueWithIdentifier:@"ViewExpenseList" sender:self];
}

@end
