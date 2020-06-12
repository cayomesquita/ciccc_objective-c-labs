//
//  Cook.m
//  Foodtruck
//
//  Created by Cornerstone on 2020-06-11.
//  Copyright © 2020 Lighthouse Labs. All rights reserved.
//

#import "Cook.h"

@implementation Cook

-(double)foodTruck:(FoodTruck *)truck priceForFood:(NSString *)food {
    if ([food isEqualToString:@"bao"]) {
        return 12.35;
    }
    if ([food isEqualToString:@"shortbread"]) {
        return 53.21;
    }
    return 0.0;
}

@end
