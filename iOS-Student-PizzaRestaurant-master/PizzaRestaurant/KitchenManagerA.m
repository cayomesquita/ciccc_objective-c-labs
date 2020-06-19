//
//  KitchenManagerA.m
//  PizzaRestaurant
//
//  Created by Cornerstone on 2020-06-18.
//  Copyright © 2020 Lighthouse Labs. All rights reserved.
//

#import "KitchenManagerA.h"

static NSString *const ANCHOVIES = @"anchovies";

@implementation KitchenManagerA

- (BOOL)kitchen:(nonnull Kitchen *)kitchen shouldMakePizzaOfSize:(id)size andTopping:(nonnull NSArray *)toppings {
    for (NSString * topping in toppings) {
        if ([ANCHOVIES isEqualToString:[topping lowercaseString]]) {
            return NO;
        }
    }
    return YES;
}

- (BOOL)kitchenShouldUpgradeOrder:(nonnull Kitchen *)kitchen {
    return NO;
}

@end
