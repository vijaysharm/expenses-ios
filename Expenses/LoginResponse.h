//
//  LoginResponse.h
//  Expenses
//
//  Created by Vijay Sharma on 2014-12-18.
//  Copyright (c) 2014 Vijay Sharma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginResponse : NSObject
@property(strong, nonatomic) NSString *session;
@property(strong, nonatomic) NSString *username;
@end
