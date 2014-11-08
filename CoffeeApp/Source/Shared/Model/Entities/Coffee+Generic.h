//
//  Coffee+Generic.h
//  CoffeeApp
//
//  Created by Michael Campbell on 11/7/14.
//  Copyright (c) 2014 Michael Campbell. All rights reserved.
//

#import "Coffee.h"

@interface Coffee (Generic)

+ (NSSet *)getCoffeeIdSet;
+ (BOOL)coffeeSetContainsCoffeeId:(NSString *)coffeeId;
+ (Coffee *)fetchCoffeeByCoffeeId:(NSString *)coffeeId;
+ (Coffee *)createCoffeeEntityFromCoffeeDictionary:(NSDictionary *)coffeeDict;

@end
