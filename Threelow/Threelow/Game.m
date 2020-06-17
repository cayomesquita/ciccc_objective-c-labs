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
static NSString *const HOLD = @"hold";
static NSString *const UNHOLD = @"unhold";
static NSString *const RESET = @"reset";
static NSString *const DISPLAY = @"display";

@interface Game ()

@property (nonatomic) NSArray *dices;
@property (nonatomic) NSMutableSet *holds;

@end

@implementation Game

- (instancetype) init {
    if (self = [super init]) {
        _dices = [NSArray arrayWithObjects:[[Dice alloc] init], [[Dice alloc] init], [[Dice alloc] init], [[Dice alloc] init], [[Dice alloc] init], nil];
        _holds = [[NSMutableSet alloc] init];
    }
    return self;
}

- (void) run {
    for (; ; ) {
        NSString *input = [InputHandler inputUser:@"Enter menu option: "];
        if ([QUIT isEqualToString:[input lowercaseString]]) {
            break;
        }
        if ([ROLL isEqualToString:[input lowercaseString]]) {
            for (Dice *dice in _dices) {
                [dice roll];
            }
            continue;
        }
        if ([HOLD isEqualToString:[input lowercaseString]]) {
            [self holdHandler];
            continue;
        }
        if ([UNHOLD isEqualToString:[input lowercaseString]]) {
            [self unholdHandler];
            continue;
        }
        if ([RESET isEqualToString:[input lowercaseString]]) {
            [self resetDices];
            continue;
        }
        if ([DISPLAY isEqualToString:[input lowercaseString]]) {
            NSLog(@"Dices: %@ %@ %@ %@ %@", _dices[0], _dices[1], _dices[2], _dices[3], _dices[4]);
            continue;
        }
        NSLog(@"Invalid input!");
    }
    NSLog(@"Good bye!");
}

- (void) holdHandler {
    for (; ; ) {
        if ([_holds count] >= [_dices count]) {
            NSLog(@"All dices held");
            break;
        }
        NSString *inputHold = [InputHandler inputUser:@"Enter the dice number to hold: "];
        NSNumber *number = [[[NSNumberFormatter alloc] init] numberFromString:inputHold];
        if (number == NULL) {
            NSLog(@"Invalid number!");
            continue;
        } else {
            NSRange range = NSMakeRange(1, [_dices count]);
            int index = [number intValue];
            if (NSLocationInRange(index, range)) {
                index = index - 1;
                ((Dice *) _dices[index]).hold = YES;
                [_holds addObject:_dices[index]];
                break;
            } else {
                NSLog(@"Invalid number! range [1 - 5]");
                continue;
            }
        }
    }
}

- (void) unholdHandler {
    for (; ; ) {
        if ([_holds count] <= 0) {
            NSLog(@"No dices held");
            break;
        }
        NSString *inputHold = [InputHandler inputUser:@"Enter the dice number to unhold: "];
        NSNumber *number = [[[NSNumberFormatter alloc] init] numberFromString:inputHold];
        if (number == NULL) {
            NSLog(@"Invalid number!");
            continue;
        } else {
            NSRange range = NSMakeRange(1, [_dices count]);
            int index = [number intValue];
            if (NSLocationInRange(index, range)) {
                index = index - 1;
                ((Dice *) _dices[index]).hold = NO;
                [_holds removeObject:_dices[index]];
                break;
            } else {
                NSLog(@"Invalid number! range [1 - 5]");
                continue;
            }
        }
    }
}

- (void) resetDice {
    for (Dice *dice in _dices) {
        dice.hold = NO;
    }
    NSLog(@"All dices unheld!");
}


@end
