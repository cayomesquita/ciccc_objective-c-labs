//
//  Dice.m
//  Threelow
//
//  Created by Cornerstone on 2020-06-15.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

#import "Dice.h"

static NSString *const values[] = {@"⚀", @"⚁", @"⚂", @"⚃", @"⚄", @"⚅"};

@implementation Dice

- (instancetype) init {
    if (self = [super init]) {
        int rand = arc4random_uniform(6) + 1;
        _value = rand;
    }
    return self;
}

- (NSString *) description {
    return values[_value - 1];
}

@end
