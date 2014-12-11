//
//  LoginController.h
//  Expenses
//
//  Created by Vijay Sharma on 2014-12-11.
//  Copyright (c) 2014 Vijay Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginController : UIViewController

- (IBAction)didPressLogin;

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;

@end
