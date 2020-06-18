//
//  main.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Kitchen.h"
#import "Pizza.h"


@implementation NSString (PizzaSizeParser)

- (PizzaSize) pizzaSizeFromString {
    NSDictionary<NSString*, NSNumber*> *sizes = @{
        @"small": @(small),
        @"medium": @(medium),
        @"large": @(large),
    };
    if ([sizes objectForKey:self] == nil) {
        return [@(large) intValue];
    }
    return [sizes[self] intValue];
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSLog(@"Please pick your pizza size and toppings:");
        
        Kitchen *restaurantKitchen = [Kitchen new];
        
        while (TRUE) {
            // Loop forever
            
            NSLog(@"> ");
            char str[100];
            fgets (str, 100, stdin);
            
            NSString *inputString = [[NSString alloc] initWithUTF8String:str];
            inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            NSLog(@"Input was %@", inputString);
            
            // Take the first word of the command as the size, and the rest as the toppings
            NSArray *commandWords = [inputString componentsSeparatedByString:@" "];
            
            // And then send some message to the kitchen...
            
            NSArray * toppings = [commandWords subarrayWithRange:NSMakeRange(1, [commandWords count] - 1)];
            
            if ([(NSString*)commandWords[0] isEqualToString:@"pepperoni"]) {
                NSLog(@"Pizza: %@", [restaurantKitchen makePepperoni]);
                continue;
            }
            
            PizzaSize size = [commandWords[0] pizzaSizeFromString];
                
            NSLog(@"Pizza: %@", [restaurantKitchen makePizzaWithSize:size toppings:toppings]);
        }

    }
    return 0;
}

