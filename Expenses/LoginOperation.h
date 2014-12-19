//
//  LoginOperation.h
//  Expenses
//
//  Created by Vijay Sharma on 2014-12-18.
//  Copyright (c) 2014 Vijay Sharma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginRequest.h"
#import "LoginResponse.h"

@protocol LoginOperation<NSObject>
-(void)login:(LoginRequest *)request success:(void (^)(LoginResponse *))success failure:(void (^)(NSError *))failure;
@end
