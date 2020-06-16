//
//  main.m
//  Threelow
//
//  Created by Cornerstone on 2020-06-15.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Dice * dice1 = [[Dice alloc] init];
        Dice * dice2 = [[Dice alloc] init];
        Dice * dice3 = [[Dice alloc] init];
        Dice * dice4 = [[Dice alloc] init];
        Dice * dice5 = [[Dice alloc] init];
        
        NSLog(@"Dice: %@", dice1);
        NSLog(@"Dice: %@", dice2);
        NSLog(@"Dice: %@", dice3);
        NSLog(@"Dice: %@", dice4);
        NSLog(@"Dice: %@", dice5);
        
    }
    return 0;
}
