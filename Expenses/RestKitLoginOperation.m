//
//  RestKitLoginOperation.m
//  Expenses
//
//  Created by Vijay Sharma on 2014-12-18.
//  Copyright (c) 2014 Vijay Sharma. All rights reserved.
//

#import "AppDelegate.h"
#import "RestKitLoginOperation.h"
#import "LoginRequest.h"
#import "LoginResponse.h"

@interface RestKitLoginOperation ()
@property (strong, nonatomic) RKObjectManager *objectManager;
@end

@implementation RestKitLoginOperation

-(instancetype) initWithUrl:(NSURL *)url {
    if (self = [super init]) {
        _objectManager = [RestKitLoginOperation setup:url];
    }
    
    return self;
}

+(RKObjectManager *)setup:(NSURL *)baseURL {
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:baseURL];
    
    // initialize RestKit
    RKObjectManager *objectManager = [[RKObjectManager alloc] initWithHTTPClient:client];
    
    // setup object mappings
    RKObjectMapping *requestMapping = [RKObjectMapping requestMapping];
    [requestMapping addAttributeMappingsFromDictionary:@{
                                                         @"username": @"username",
                                                         @"password": @"password",
                                                         }];
    
    RKRequestDescriptor *requestDescriptor =
    [RKRequestDescriptor requestDescriptorWithMapping:requestMapping
                                          objectClass:[LoginRequest class]
                                          rootKeyPath:nil
                                               method:RKRequestMethodPOST];
    
    RKObjectMapping *responseMapping = [RKObjectMapping mappingForClass:[LoginResponse class]];
    [responseMapping addAttributeMappingsFromDictionary:@{
                                                          @"username": @"username",
                                                          @"token": @"session"
                                                          }];
    
    // register mappings with the provider using a response descriptor
    RKResponseDescriptor *responseDescriptor =
    [RKResponseDescriptor responseDescriptorWithMapping:responseMapping
                                                 method:RKRequestMethodPOST
                                            pathPattern:@"/login"
                                                keyPath:@""
                                            statusCodes:[NSIndexSet indexSetWithIndex:RKStatusCodeClassSuccessful]];
    
    [objectManager addRequestDescriptor:requestDescriptor];
    [objectManager addResponseDescriptor:responseDescriptor];
    objectManager.requestSerializationMIMEType = RKMIMETypeJSON;
    
    return objectManager;
}

-(void)login:(LoginRequest *)request success:(void (^)(LoginResponse *))success failure:(void (^)(NSError *))failure {
    [self.objectManager postObject:request
                              path:@"/login"
                        parameters:nil
                           success:^(RKObjectRequestOperation *operation, RKMappingResult *result) {
                               LoginResponse *response = [result firstObject];
                               success(response);
                           }
                           failure:^(RKObjectRequestOperation *operation, NSError *error) {
                               failure(error);
                           }];
}
@end