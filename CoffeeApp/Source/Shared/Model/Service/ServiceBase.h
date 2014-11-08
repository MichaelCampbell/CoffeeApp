//
//  ServiceBase.h
//  CoffeeApp
//
//  Created by Michael Campbell on 11/7/14.
//  Copyright (c) 2014 Michael Campbell. All rights reserved.
//

#import "AppDelegate.h"

typedef void (^serviceResponseBlock)(BOOL success, id responseObject);

@interface ServiceBase : NSObject

+ (void)getResourceFromURL:(NSString *)url withParameters:(NSArray *)parameters headers:(NSDictionary *)headers andResponseBlock:(serviceResponseBlock)responseBlock;
+ (void)checkForCoffeeWithCompletionHandler:(completionHandler)handler;

@end

