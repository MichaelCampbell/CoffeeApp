//
//  Coffee.h
//  CoffeeApp
//
//  Created by Michael Campbell on 11/7/14.
//  Copyright (c) 2014 Michael Campbell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Coffee : NSManagedObject

@property (nonatomic, retain) NSString * coffeeId;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * details;
@property (nonatomic, retain) NSString * imageURL;
@property (nonatomic, retain) NSDate * updateDate;

@end
