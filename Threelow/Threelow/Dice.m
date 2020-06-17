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
        _value = [Dice randomDice];
    }
    return self;
}

- (void) roll {
    if (!_hold) {
        _value = [Dice randomDice];
    }
}

+ (NSInteger) randomDice {
    int rand = arc4random_uniform(6) + 1;
    return rand;
}

- (NSString *) description {
    if (_hold) {
        return [NSString stringWithFormat:@"[%@]", values[_value - 1]];
    }
    return values[_value - 1];
}

@end
