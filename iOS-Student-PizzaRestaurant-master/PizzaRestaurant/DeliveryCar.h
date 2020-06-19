//
//  DeliveryCar.h
//  PizzaRestaurant
//
//  Created by Cornerstone on 2020-06-18.
//  Copyright © 2020 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Pizza;

NS_ASSUME_NONNULL_BEGIN

@interface DeliveryCar : NSObject

- (void) deliveryPizza:(Pizza*)pizza;

@end

NS_ASSUME_NONNULL_END
