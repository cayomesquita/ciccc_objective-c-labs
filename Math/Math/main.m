//
//  main.m
//  Math
//
//  Created by Cornerstone on 2020-06-09.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AdditionQuestion.h"
#import "InputHandler.h"
#import "ScoreKeeper.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        ScoreKeeper *score = [[ScoreKeeper alloc] init];
        while (TRUE) {
            AdditionQuestion *newQuestion = [[AdditionQuestion alloc] init];
            NSString *inputStr = [InputHandler inputUser:[newQuestion question]];
            if ([[@"q" uppercaseString] isEqualToString:[inputStr uppercaseString]]) {
                break;
            }
            NSNumber *number = [[[NSNumberFormatter alloc] init] numberFromString:inputStr];
            if (number == NULL) {
                NSLog(@"Invalid input");
            } else {
                if ([number integerValue] == [newQuestion answer]) {
                    [score increaseRight];
                    NSLog(@"Right!");
                } else {
                    [score increaseWrong];
                    NSLog(@"Wrong!");
                }
            }
        }
        NSLog(score.score);
    }
    return 0;
}
