//
//  Pizza.m
//  PizzaRestaurant
//
//  Created by Cornerstone on 2020-06-17.
//  Copyright © 2020 Lighthouse Labs. All rights reserved.
//

#import "Pizza.h"

@implementation Pizza

- (instancetype) initWithSize:(PizzaSize)size andToppins:(NSArray *)toppings {
    if (self = [super init]) {
        _size = size;
        _toppings = toppings;
    }
    return self;
}


+ (instancetype) pepperoniWithSize: (PizzaSize) size {
    return [[Pizza alloc] initWithSize: size andToppins: [NSArray arrayWithObjects:@"Pepperoni", @"Cheese", nil]];
}

- (NSString *) description {
    NSArray *sizeStr = [NSArray arrayWithObjects:@"small", @"medium", @"large", nil];
    return [NSString stringWithFormat:@"Size: %@\nToppings:\n %@", sizeStr[_size], _toppings];
}

@end
