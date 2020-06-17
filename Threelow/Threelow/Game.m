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
static NSString *const NEW_GAME = @"new game";
static NSString *const WIN = @"win";
static int const LIMIT_ROLLS = 5;

@interface Game ()

@property (nonatomic) NSArray *dices;
@property (nonatomic) NSMutableSet *holds;
@property int rollNum;
@property (nonatomic) Dice *lastDiceHeld;
@property BOOL anyDiceHeld;
@property int lowerScore;

@end

@implementation Game

- (instancetype) init {
    if (self = [super init]) {
        _dices = [NSArray arrayWithObjects:[[Dice alloc] init], [[Dice alloc] init], [[Dice alloc] init], [[Dice alloc] init], [[Dice alloc] init], nil];
        _holds = [[NSMutableSet alloc] init];
        _rollNum = 0;
        _anyDiceHeld = NO;
        _lowerScore = [_dices count] * 6;
    }
    return self;
}

- (void) run {
    for (; ; ) {
        [self runTurn];
    }
}

- (void) runTurn {
    [self resetDice];
    while (_rollNum < LIMIT_ROLLS && [_holds count] < [_dices count]) {
        NSString *input = [InputHandler inputUser:@"Enter menu option: "];
        if ([WIN isEqualToString:[input lowercaseString]]) {
            [self win];
            continue;
        }
        if ([NEW_GAME isEqualToString:[input lowercaseString]]) {
            [self newGame];
            continue;
        }
        if ([ROLL isEqualToString:[input lowercaseString]]) {
            [self roll];
            continue;
        }
        if (_rollNum == 0) {
            NSLog(@"You have to roll dices first!");
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
            break;
        }
        if ([DISPLAY isEqualToString:[input lowercaseString]]) {
            [self display];
            continue;
        }
        NSLog(@"Invalid input!");
    }
    [self summarizeTurn];
}

- (void) roll {
    if (_rollNum > 0 && !_anyDiceHeld) {
        NSLog(@"Hold at least one dice!");
        return;
    }
    for (Dice *dice in _dices) {
        [dice roll];
    }
    _rollNum++;
    _anyDiceHeld = NO;
    [self display];
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
                _lastDiceHeld = (Dice *) _dices[index];
                _lastDiceHeld.hold = YES;
                [_holds addObject:_dices[index]];
                _anyDiceHeld = YES;
                NSLog(@"Dices: %@ %@ %@ %@ %@", _dices[0], _dices[1], _dices[2], _dices[3], _dices[4]);
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
                Dice *currentDice = (Dice *) _dices[index];
                if (currentDice != _lastDiceHeld) {
                    NSLog(@"You can not unhold else dice you held lastly!");
                    continue;
                }
                currentDice.hold = NO;
                [_holds removeObject:_dices[index]];
                NSLog(@"Dices: %@ %@ %@ %@ %@", _dices[0], _dices[1], _dices[2], _dices[3], _dices[4]);
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
    [_holds removeAllObjects];
    _rollNum = 0;
    _anyDiceHeld = NO;
}

- (void) display {
    int score = [self score];
    
    NSLog(@"Rolls Number: %d", _rollNum);
    NSLog(@"Score to beat: %d", _lowerScore);
    NSLog(@"Score: %d", score);
    NSLog(@"Dices: %@ %@ %@ %@ %@", _dices[0], _dices[1], _dices[2], _dices[3], _dices[4]);
}

- (int) score {
    int score = 0;
    for (Dice *dice in _dices) {
        if (dice.hold) {
            score += dice.value;
        }
    }
    return score;
}

- (void) summarizeTurn {
    for (Dice *dice in _dices) {
        dice.hold = YES;
    }
    int score = [self score];
    _lowerScore = MIN(_lowerScore, score);
    NSLog(@"*** SUMMARY ***");
    NSLog(@"Rolls Number: %d", _rollNum);
    NSLog(@"Score: %d", [self score]);
    NSLog(@"Dices: %@ %@ %@ %@ %@", _dices[0], _dices[1], _dices[2], _dices[3], _dices[4]);
}

- (void) newGame {
    NSLog(@"New Game");
    [self resetDice];
    _lastDiceHeld = NULL;
    _lowerScore = [_dices count] * 6;
}

- (void) win {
    for (Dice *dice in _dices) {
        dice.value = 1;
        dice.hold = YES;
        [_holds addObject:dice];
    }
}

@end
