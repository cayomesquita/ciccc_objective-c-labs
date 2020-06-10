//
//  Box.m
//  Lab2
//
//  Created by Cornerstone on 2020-06-09.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

#import "Box.h"

@implementation Box

- (instancetype) initWithHeight: (float) height andWidth: (float) width andLength: (float) length {
    self = [super init];
    if (self != NULL){
        self.height = height;
        self.width = width;
        self.length = length;
    }
    return self;
    
}

- (float) volume {
    return self.height * self.width * self.length;
}

- (int) howManyTimesFitInsideOf: (Box *) box {
    float myVolume = [self volume];
    float boxVolume = [box volume];
    if (myVolume > boxVolume){
        return 0;
    }
    return (int) boxVolume / myVolume;
}

@end
