//
//  main.m
//  Lab2
//
//  Created by Cornerstone on 2020-06-09.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Box.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Box *box1 = [[Box alloc] initWithHeight:3.0f andWidth:2.0f andLength:2.0f];
        NSLog(@"Volume box1: %.2f", [box1 volume]);
        Box *box2 = [[Box alloc] initWithHeight:2.5f andWidth:2.0f andLength:1.0f];
        NSLog(@"Volume box2: %.2f", [box2 volume]);
        NSLog(@"Box2 fits inside Box1 %d times", [box2 howManyTimesFitInsideOf:box1]);
    }
    return 0;
}
