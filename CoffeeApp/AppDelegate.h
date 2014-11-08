//
//  AppDelegate.h
//  CoffeeApp
//
//  Created by Michael Campbell on 11/7/14.
//  Copyright (c) 2014 Michael Campbell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

typedef void (^completionHandler)();

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (AppDelegate *)sharedDelegate;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

