//
//  Coffee+Generic.m
//  CoffeeApp
//
//  Created by Michael Campbell on 11/7/14.
//  Copyright (c) 2014 Michael Campbell. All rights reserved.
//

#import "Coffee+Generic.h"
#import "AppDelegate.h"

@implementation Coffee (Generic)

+ (NSSet *)getCoffeeIdSet
{
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Coffee" inManagedObjectContext:[AppDelegate sharedDelegate].managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    NSError *error;
    NSArray *items = [[AppDelegate sharedDelegate].managedObjectContext executeFetchRequest:request error:&error];
    
    if (items.count > 0) {
        NSMutableArray *uniqueDrinks = [[NSMutableArray alloc] init];
        for (Coffee *coffee in items) {
            [uniqueDrinks addObject:coffee.coffeeId];
        }
        
        return [NSSet setWithArray:uniqueDrinks];
    }
    
    return nil;
}

+ (BOOL)coffeeSetContainsCoffeeId:(NSString *)coffeeId
{
    NSSet *coffeeItemSet = [Coffee getCoffeeIdSet];
    if (coffeeItemSet && [coffeeItemSet containsObject:coffeeId]) {
        return YES;
    }
    return NO;
}

+ (Coffee *)fetchCoffeeByCoffeeId:(NSString *)coffeeId
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Coffee" inManagedObjectContext:[AppDelegate sharedDelegate].managedObjectContext];
    [request setEntity:entity];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"coffeeId = %@", coffeeId];
    [request setPredicate:predicate];
    
    NSError *error;
    NSArray *items = [[AppDelegate sharedDelegate].managedObjectContext executeFetchRequest:request error:&error];
    
    if (!error) {
        return (Coffee *)[items firstObject];
    }
    
    return nil;
}

+ (Coffee *)createCoffeeEntityFromCoffeeDictionary:(NSDictionary *)coffeeDict
{
    if (!coffeeDict) {
        return nil;
    }
    
    NSString *coffeeId = [coffeeDict objectForKey:@"id"];
    
    if (coffeeId && [Coffee coffeeSetContainsCoffeeId:coffeeId]) {
        return [Coffee fetchCoffeeByCoffeeId:coffeeId];
    }
    
    Coffee *coffee = [NSEntityDescription insertNewObjectForEntityForName:@"Coffee" inManagedObjectContext:[AppDelegate sharedDelegate].managedObjectContext];
    
    coffee.coffeeId = coffeeId;
    coffee.name = [coffeeDict objectForKey:@"name"];
    coffee.details = [coffeeDict objectForKey:@"desc"];
    coffee.imageURL = [coffeeDict objectForKey:@"image_url"];
    coffee.updateDate = [coffeeDict objectForKey:@"last_updated_at"];
    
    NSError *error;
    if (![[AppDelegate sharedDelegate].managedObjectContext save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    
    
    return coffee;
}

@end
