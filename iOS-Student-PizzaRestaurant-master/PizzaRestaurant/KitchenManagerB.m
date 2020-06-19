//
//  KitchenManagerB.m
//  PizzaRestaurant
//
//  Created by Cornerstone on 2020-06-18.
//  Copyright © 2020 Lighthouse Labs. All rights reserved.
//

#import "KitchenManagerB.h"

@implementation KitchenManagerB

- (BOOL)kitchen:(nonnull Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)size andTopping:(nonnull NSArray *)toppings {
    return YES;
}

- (BOOL)kitchenShouldUpgradeOrder:(nonnull Kitchen *)kitchen {
    return YES;
}

- (void)kitchenDidMakePizza:(Pizza *)pizza{
    NSLog(@"Enjoy your upgrade, thank you!");
}

@end
