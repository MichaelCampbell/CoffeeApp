//
//  CoffeeDetailViewController.m
//  CoffeeApp
//
//  Created by Michael Campbell on 11/7/14.
//  Copyright (c) 2014 Michael Campbell. All rights reserved.
//

#import "CoffeeDetailViewController.h"
#import "ViewConstants.h"

@interface CoffeeDetailViewController ()

@end

@implementation CoffeeDetailViewController

#pragma mark - Managing the detail item


- (void)configureView {
    self.navigationController.navigationBar.barTintColor = [ViewConstants navigationBarColor];
	UIImageView *dripImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"drip-white"]];
    self.navigationItem.titleView = dripImageView;
    
    // Update the user interface for the detail item.
    if (self.coffee) {
        self.detailDescriptionLabel.text = [[self.coffee valueForKey:@"details"] description];
        self.detailDescriptionLabel.numberOfLines = 0;
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(share)];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)share
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Share"
                                                                             message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *message = [UIAlertAction actionWithTitle:@"Messages"
                                                      style:UIAlertActionStyleDefault
                                                    handler:^(UIAlertAction *action) {
                                                        [self shareWithMessages];
                                                    }];
    
    UIAlertAction *email = [UIAlertAction actionWithTitle:@"Email"
                                                    style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                                                        [self shareWithEmail];
                                                    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel"
                                                     style:UIAlertActionStyleCancel
                                                   handler:nil];
    [alertController addAction:message];
    [alertController addAction:email];
    [alertController addAction:cancel];
    
    [self presentViewController:alertController animated:YES completion:^{
        //
    }];
}

- (void)shareWithMessages
{
    
}

- (void)shareWithEmail
{
    
}

@end
