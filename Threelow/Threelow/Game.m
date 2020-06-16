//
//  Game.m
//  Threelow
//
//  Created by Cornerstone on 2020-06-15.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

#import "Game.h"
#import "InputHandler.h"
#import "Dice.h"

static NSString *const QUIT = @"q";
static NSString *const ROLL = @"roll";
static NSString *const DISPLAY = @"display";

@interface Game ()

@property (nonatomic) NSArray *dices;

@end

@implementation Game

- (instancetype) init {
    if (self = [super init]) {
        _dices = [NSArray arrayWithObjects:[[Dice alloc] init], [[Dice alloc] init], [[Dice alloc] init], [[Dice alloc] init], [[Dice alloc] init], nil];
    }
    return self;
}

- (void) run {
    for (; ; ) {
        NSString *input = [InputHandler inputUser:@"Enter input: "];
        if ([QUIT isEqualToString:[input lowercaseString]]) {
            break;
        }
        if ([ROLL isEqualToString:[input lowercaseString]]) {
            for (Dice *dice in _dices) {
                [dice roll];
            }
        }
        if ([DISPLAY isEqualToString:[input lowercaseString]]) {
            NSLog(@"Dices: %@ %@ %@ %@ %@", _dices[0], _dices[1], _dices[2], _dices[3], _dices[4]);
        }
    }
    NSLog(@"Good bye!");
}



@end
