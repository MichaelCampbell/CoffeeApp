//
//  DetailViewController.h
//  CoffeeApp
//
//  Created by Michael Campbell on 11/7/14.
//  Copyright (c) 2014 Michael Campbell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

