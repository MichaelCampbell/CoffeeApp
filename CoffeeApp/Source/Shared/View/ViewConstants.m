//
//  ViewConstants.m
//  CoffeeApp
//
//  Created by Michael Campbell on 12/3/14.
//  Copyright (c) 2014 Michael Campbell. All rights reserved.
//

#import "ViewConstants.h"
#import "UIColor+Hex.h"

@implementation ViewConstants

+ (UIColor *)navigationBarColor
{
	return [UIColor colorWithHexString:@"#F16421"]; //Orange
}

+ (UIColor *)titleTextColor
{
	return [UIColor colorWithHexString:@"#666666"]; //Gray-Dark
}

+ (UIColor *)detailTextColor
{
	return [UIColor colorWithHexString:@"#AAAAAA"]; //Gray
}

@end
