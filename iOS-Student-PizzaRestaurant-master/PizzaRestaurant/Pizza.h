//
//  Pizza.h
//  PizzaRestaurant
//
//  Created by Cornerstone on 2020-06-17.
//  Copyright © 2020 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, PizzaSize) {small = 0, medium = 1, large = 2};

@interface Pizza : NSObject

@property (readonly, nonatomic) PizzaSize size;
@property (readonly, nonatomic) NSArray * toppings;

- (instancetype) initWithSize: (PizzaSize) size andToppins: (NSArray *) toppings;

+ (instancetype) pepperoniWithSize: (PizzaSize) size;

@end

NS_ASSUME_NONNULL_END
