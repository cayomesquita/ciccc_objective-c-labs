//
//  KitchenDelegate.h
//  PizzaRestaurant
//
//  Created by Cornerstone on 2020-06-18.
//  Copyright © 2020 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pizza.h"

@class Kitchen;

NS_ASSUME_NONNULL_BEGIN

@protocol KitchenDelegate <NSObject>

@required
- (BOOL) kitchen: (Kitchen*) kitchen shouldMakePizzaOfSize: (PizzaSize) size andTopping: (NSArray*) toppings;
- (BOOL) kitchenShouldUpgradeOrder: (Kitchen*) kitchen;

@optional
- (void) kitchenDidMakePizza: (Pizza*) pizza;

@end

NS_ASSUME_NONNULL_END
