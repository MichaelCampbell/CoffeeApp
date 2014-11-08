//
//  CoffeeDetailViewController.h
//  CoffeeApp
//
//  Created by Michael Campbell on 11/7/14.
//  Copyright (c) 2014 Michael Campbell. All rights reserved.
//

@import UIKit;
#import "Coffee+Generic.h"

@interface CoffeeDetailViewController : UIViewController

@property (strong, nonatomic) Coffee *coffee;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

