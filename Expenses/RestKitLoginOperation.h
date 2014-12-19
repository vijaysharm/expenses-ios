//
//  RestKitLoginOperation.h
//  Expenses
//
//  Created by Vijay Sharma on 2014-12-18.
//  Copyright (c) 2014 Vijay Sharma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginOperation.h"

@interface RestKitLoginOperation : NSObject<LoginOperation>
-(instancetype) initWithUrl:(NSURL *)url;
@end
