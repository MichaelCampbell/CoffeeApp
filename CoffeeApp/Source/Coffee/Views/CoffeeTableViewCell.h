//
//  CoffeeTableViewCell.h
//  CoffeeApp
//
//  Created by Michael Campbell on 12/3/14.
//  Copyright (c) 2014 Michael Campbell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoffeeTableViewCell : UITableViewCell

@property (nonatomic, strong) NSString *coffeeTitle;
@property (nonatomic, strong) NSString *coffeeDescription;
@property (nonatomic, strong) UIImage *coffeeImage;

- (void)updateView;
- (void)addImage;

@end
