//
//  CoffeeTableViewCell.m
//  CoffeeApp
//
//  Created by Michael Campbell on 12/3/14.
//  Copyright (c) 2014 Michael Campbell. All rights reserved.
//

#import "CoffeeTableViewCell.h"
#import "ViewConstants.h"

@interface CoffeeTableViewCell()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *coffeeDescriptionLabel;
@property (nonatomic, strong) UIImageView *coffeeImageView;

@end

@implementation CoffeeTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.coffeeTitle = @"";
        self.coffeeDescription = @"";
        self.coffeeImage = [[UIImage alloc] init];
    }
    return self;
}

- (void)setupTItleLabel
{
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.titleLabel.text = self.coffeeTitle ?: @"Coffee";
    self.titleLabel.numberOfLines = 1;
    self.titleLabel.textColor = [ViewConstants titleTextColor];
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.titleLabel];
    
    NSLayoutConstraint *titleLabelTopConstraint = [NSLayoutConstraint constraintWithItem:self.titleLabel
                                                                               attribute:NSLayoutAttributeTop
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:self.contentView
                                                                               attribute:NSLayoutAttributeTopMargin
                                                                              multiplier:1.0
                                                                                constant:0];
    
    NSLayoutConstraint *titleLabelHorizonalConstraint = [NSLayoutConstraint constraintWithItem:self.titleLabel
                                                                                     attribute:NSLayoutAttributeLeft
                                                                                     relatedBy:NSLayoutRelationEqual
                                                                                        toItem:self.contentView
                                                                                     attribute:NSLayoutAttributeLeftMargin
                                                                                    multiplier:1.0
                                                                                      constant:0];
    
    [self.contentView addConstraint:titleLabelTopConstraint];
    [self.contentView addConstraint:titleLabelHorizonalConstraint];
}

- (void)setupCoffeeDescriptionLabel
{
    self.coffeeDescriptionLabel = [[UILabel alloc] init];
    self.coffeeDescriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.coffeeDescriptionLabel.text = self.coffeeDescription ?: @"Isn't coffee just awesome? Most people think so. What do you think?";
    self.coffeeDescriptionLabel.numberOfLines = 2;
    self.coffeeDescriptionLabel.textColor = [ViewConstants detailTextColor];
    self.coffeeDescriptionLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.coffeeDescriptionLabel];
    
    NSLayoutConstraint *coffeeDescriptionLabelTopConstraint = [NSLayoutConstraint constraintWithItem:self.coffeeDescriptionLabel
                                                                                           attribute:NSLayoutAttributeTop
                                                                                           relatedBy:NSLayoutRelationEqual
                                                                                              toItem:self.titleLabel
                                                                                           attribute:NSLayoutAttributeBottomMargin
                                                                                          multiplier:1.0
                                                                                            constant:20];
    
    NSLayoutConstraint *coffeeDescriptionLabelHorizonalLeftConstraint = [NSLayoutConstraint constraintWithItem:self.coffeeDescriptionLabel
                                                                                                     attribute:NSLayoutAttributeLeft
                                                                                                     relatedBy:NSLayoutRelationEqual
                                                                                                        toItem:self.contentView
                                                                                                     attribute:NSLayoutAttributeLeftMargin
                                                                                                    multiplier:1.0
                                                                                                      constant:0];
    
    NSLayoutConstraint *coffeeDescriptionLabelHorizonalRightConstraint = [NSLayoutConstraint constraintWithItem:self.coffeeDescriptionLabel
                                                                                                      attribute:NSLayoutAttributeRight
                                                                                                      relatedBy:NSLayoutRelationEqual
                                                                                                         toItem:self.contentView
                                                                                                      attribute:NSLayoutAttributeRightMargin
                                                                                                     multiplier:1.0
                                                                                                       constant:0];
    [self.contentView addConstraint:coffeeDescriptionLabelTopConstraint];
    [self.contentView addConstraint:coffeeDescriptionLabelHorizonalLeftConstraint];
    [self.contentView addConstraint:coffeeDescriptionLabelHorizonalRightConstraint];
}

- (void)setupView
{
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    [self setupTItleLabel];
    [self setupCoffeeDescriptionLabel];
    
}

- (void)addImage
{
    if (self.coffeeImage) {
        
        self.coffeeImageView = [[UIImageView alloc] init];
        self.coffeeImageView.translatesAutoresizingMaskIntoConstraints = NO;
        self.coffeeImageView.image = self.coffeeImage;
        self.coffeeImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:self.coffeeImageView];
        
        NSLayoutConstraint *coffeeImageTopConstraint = [NSLayoutConstraint constraintWithItem:self.coffeeImageView
                                                                                    attribute:NSLayoutAttributeTop
                                                                                    relatedBy:NSLayoutRelationEqual
                                                                                       toItem:self.coffeeDescriptionLabel
                                                                                    attribute:NSLayoutAttributeBottomMargin
                                                                                   multiplier:1.0
                                                                                     constant:20];
        
        NSLayoutConstraint *coffeeImageBottomConstraint = [NSLayoutConstraint constraintWithItem:self.coffeeImageView
                                                                                       attribute:NSLayoutAttributeBottom
                                                                                       relatedBy:NSLayoutRelationEqual
                                                                                          toItem:self.contentView
                                                                                       attribute:NSLayoutAttributeBottomMargin
                                                                                      multiplier:1.0
                                                                                        constant:0];
        
        NSLayoutConstraint *coffeeImageLeftConstraint = [NSLayoutConstraint constraintWithItem:self.coffeeImageView
                                                                                     attribute:NSLayoutAttributeLeft
                                                                                     relatedBy:NSLayoutRelationEqual
                                                                                        toItem:self.contentView
                                                                                     attribute:NSLayoutAttributeLeftMargin
                                                                                    multiplier:1.0
                                                                                      constant:0];
        
        NSLayoutConstraint *coffeeImageRightConstraint = [NSLayoutConstraint constraintWithItem:self.coffeeImageView
                                                                                      attribute:NSLayoutAttributeRight
                                                                                      relatedBy:NSLayoutRelationEqual
                                                                                         toItem:self.contentView
                                                                                      attribute:NSLayoutAttributeRightMargin
                                                                                     multiplier:1.0
                                                                                       constant:0];
        
        [self.contentView addConstraint:coffeeImageTopConstraint];
        [self.contentView addConstraint:coffeeImageBottomConstraint];
        [self.contentView addConstraint:coffeeImageLeftConstraint];
        [self.contentView addConstraint:coffeeImageRightConstraint];
    }
}

- (void)updateView
{
    [self setupView];
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
