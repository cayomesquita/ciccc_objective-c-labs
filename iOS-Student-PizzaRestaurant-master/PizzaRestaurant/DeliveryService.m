//
//  DeliveryService.m
//  PizzaRestaurant
//
//  Created by Cornerstone on 2020-06-18.
//  Copyright © 2020 Lighthouse Labs. All rights reserved.
//

#import "DeliveryService.h"
#import "DeliveryCar.h"

@implementation DeliveryService {
    DeliveryCar * _car;
    NSMutableArray * _records;
}

- (instancetype) init {
    if (self = [super init]) {
        _car = [[DeliveryCar alloc] init];
        _records = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void) deliveryPizza:(Pizza*)pizza {
    [_car deliveryPizza:pizza];
    [_records addObject:[NSString stringWithFormat:@"{%@}", pizza]];
}

- (NSArray*) deliveryRecords {
    return _records;
}

@end
