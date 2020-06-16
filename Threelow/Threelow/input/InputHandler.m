//
//  InputHandler.m
//  Math
//
//  Created by Cornerstone on 2020-06-09.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

#import "InputHandler.h"

@implementation InputHandler

+ (NSString *) inputUser:(NSString *) prompt {
    NSLog(@"%@", prompt);
    char inputBuffer[255];
    if (fgets(inputBuffer, 255, stdin) == NULL){
        return NULL;
    }
    NSString *inputStr = [NSString stringWithCString:inputBuffer encoding:NSUTF8StringEncoding];
    inputStr = [inputStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return inputStr;
}

@end
