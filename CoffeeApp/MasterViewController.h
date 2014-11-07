//
//  MasterViewController.h
//  CoffeeApp
//
//  Created by Michael Campbell on 11/7/14.
//  Copyright (c) 2014 Michael Campbell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;


@end

