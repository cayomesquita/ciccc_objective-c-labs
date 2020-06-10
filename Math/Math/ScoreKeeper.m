//
//  ScoreKeeper.m
//  Math
//
//  Created by Cornerstone on 2020-06-09.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

#import "ScoreKeeper.h"

@implementation ScoreKeeper

- (instancetype) init {
    if (self = [super init]) {
        _rightCounter = 0;
        _wrongCounter = 0;
    }
    return self;
}

- (void) increaseRight {
    self.rightCounter = _rightCounter + 1;
}

- (void) increaseWrong{
    self.wrongCounter = _wrongCounter + 1;
}

- (NSString *) score {
    
    float percent = 0;
    int sum = 0;
    if (sum = (_rightCounter + _wrongCounter)){
        percent = (float) _rightCounter / sum;
    }
    return [NSString stringWithFormat:@"Score: %d right, %d wrong ---- %.2f%%", _rightCounter, _wrongCounter, percent];
}

@end
