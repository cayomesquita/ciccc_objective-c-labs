//
//  KitchenManagerB.m
//  PizzaRestaurant
//
//  Created by Cornerstone on 2020-06-18.
//  Copyright © 2020 Lighthouse Labs. All rights reserved.
//

#import "KitchenManagerB.h"
#import "DeliveryService.h"

@implementation KitchenManagerB {
    DeliveryService *_delivery;
}

- (instancetype) init {
    if (self = [super init]) {
        _delivery = [[DeliveryService alloc] init];
    }
    return self;
}

- (BOOL)kitchen:(nonnull Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)size andTopping:(nonnull NSArray *)toppings {
    return YES;
}

- (BOOL)kitchenShouldUpgradeOrder:(nonnull Kitchen *)kitchen {
    return YES;
}

- (void)kitchenDidMakePizza:(Pizza *)pizza{
    [_delivery deliveryPizza:pizza];
    NSLog(@"Enjoy your upgrade, thank you!");
}

- (NSString*) description {
    return ([NSString stringWithFormat:@"Kitcher Manager B\nDelivery Service Records:\n%@\n", [_delivery deliveryRecords]]);
}

@end
