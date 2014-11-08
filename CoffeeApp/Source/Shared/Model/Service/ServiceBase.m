//
//  ServiceBase.m
//  CoffeeApp
//
//  Created by Michael Campbell on 11/7/14.
//  Copyright (c) 2014 Michael Campbell. All rights reserved.
//

#import "ServiceBase.h"
#import "AFHTTPRequestOperationManager.h"
#import "Coffee+Generic.h"

@implementation ServiceBase

#pragma mark - CoffeeApp API-
static NSString * const kCoffeeAppBaseURL = @"https://coffeeapi.percolate.com";
static NSString * const kCoffeeAppCoffeeFeedPath = @"/api/coffee/";
static NSString * const kCoffeeAppCoffeeItemDetailPath = @"/api/coffee/%@";

static NSString * const kAPIKeyAuthorizationKey = @"Authorization";
static NSString * const kAPIKeyValue = @"WuVbkuUsCXHPx3hsQzus4SE";

+ (void)getResourceFromURL:(NSString *)url withParameters:(NSArray *)parameters headers:(NSDictionary *)headers andResponseBlock:(serviceResponseBlock)responseBlock
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    if (headers && headers.count > 0) {
        for (NSString *key in headers) {
            [manager.requestSerializer setValue:[headers objectForKey:key] forHTTPHeaderField:key];
        }
    }
    
    [manager GET:url
      parameters:parameters
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             responseBlock(true, responseObject);
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             responseBlock(false, error);
         }];
}

+ (NSDictionary *)requiredRequestHeaders
{
    return @{ kAPIKeyAuthorizationKey : kAPIKeyValue};
}

+ (void)checkForCoffeeWithCompletionHandler:(completionHandler)handler
{
    NSString *coffeeAppURL = [NSString stringWithFormat:@"%@%@", kCoffeeAppBaseURL, kCoffeeAppCoffeeFeedPath];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    NSBlockOperation *getResourceOperation = [NSBlockOperation blockOperationWithBlock:^{
        
        [ServiceBase getResourceFromURL:coffeeAppURL
                         withParameters:nil
                                headers:[ServiceBase requiredRequestHeaders]
                       andResponseBlock:^(BOOL success, id responseObject) {
                           if (!success) {
                               NSLog(@"handle error with <<<<<<<%@>>>>>>>", responseObject);
                               return;
                           }
                           [self parseResponseFromData:responseObject];
                       }];
    }];
    
    NSBlockOperation *completionHandlerOperation = [NSBlockOperation blockOperationWithBlock:^{
        handler();
    }];
    
    [completionHandlerOperation addDependency:getResourceOperation];
    [queue addOperation:getResourceOperation];
    [queue addOperation:completionHandlerOperation];
}

+ (void)parseResponseFromData:(NSDictionary *)data
{
    if ([NSJSONSerialization isValidJSONObject:data]) {
        for (NSString *post in data) {
            
            NSDictionary *coffee = (NSDictionary *)post;
            
            if (coffee) {
                [Coffee createCoffeeEntityFromCoffeeDictionary:coffee];
            }
        }
    }
    else {
        //handle error
        NSLog(@"this is some weird data. <-----%@----->", data);
    }
}

@end
