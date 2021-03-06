//
//  Kitchen.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "Kitchen.h"

@implementation Kitchen

- (Pizza *)makePizzaWithSize:(PizzaSize)size toppings:(NSArray *)toppings
{
    if (_delegate) {
        Pizza *pizza;
        if ([_delegate kitchen:self shouldMakePizzaOfSize:size andTopping:toppings]) {
            if ([_delegate kitchenShouldUpgradeOrder:self]) {
                pizza = [[Pizza alloc] initWithSize:large andToppins:toppings];
            } else {
                pizza = [[Pizza alloc] initWithSize:size andToppins:toppings];
            }
            if ([_delegate respondsToSelector:@selector(kitchenDidMakePizza:)]) {
                [_delegate kitchenDidMakePizza:pizza];
            }
        }
        return pizza;
    }
    return [[Pizza alloc] initWithSize:size andToppins:toppings];
}

- (Pizza *)makePepperoni {
    return [self makePepperoniWithSize:large];
}

- (Pizza *)makePepperoniWithSize: (PizzaSize) size {
    return [Pizza pepperoniWithSize:size];
}

@end
