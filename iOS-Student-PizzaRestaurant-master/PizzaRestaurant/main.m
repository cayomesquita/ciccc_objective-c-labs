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
#import "KitchenManagerA.h"
#import "KitchenManagerB.h"

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
        
    NSLog(@"Please pick your pizza size and toppings:");
    
    Kitchen *restaurantKitchen = [Kitchen new];
    KitchenManagerA *kitchenManagerA;
    KitchenManagerB *kitchenManagerB;
    
    while (TRUE) {
        // Loop forever
        @autoreleasepool {
            NSLog(@"> ");
            char str[100];
            fgets (str, 100, stdin);
            
            NSString *inputString = [[NSString alloc] initWithUTF8String:str];
            inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            NSLog(@"Input was %@", inputString);
            
            // Take the first word of the command as the size, and the rest as the toppings
            NSArray *commandWords = [inputString componentsSeparatedByString:@" "];
            
            int index = 0;
            NSString *firstInput = commandWords[index];
            if ([firstInput isEqualToString:@"pepperoni"]) {
                NSLog(@"Pizza: %@", [restaurantKitchen makePepperoni]);
                continue;
            }
            // Assign Manager
            if ([firstInput isEqualToString:@"<MA>"]) {
                if (!kitchenManagerA) {
                    kitchenManagerA = [[KitchenManagerA alloc] init];
                }
                index++;
                restaurantKitchen.delegate = kitchenManagerA;
            } else if ([firstInput isEqualToString:@"<MB>"]) {
                if (!kitchenManagerB) {
                    kitchenManagerB = [[KitchenManagerB alloc] init];
                }
                index++;
                restaurantKitchen.delegate = kitchenManagerB;
            } else {
                restaurantKitchen.delegate = nil;
            }
            
            PizzaSize size = [commandWords[index++] pizzaSizeFromString];
            NSArray * toppings = [commandWords subarrayWithRange:NSMakeRange(index, [commandWords count] - index)];
                
            NSLog(@"Pizza: %@", [restaurantKitchen makePizzaWithSize:size toppings:toppings]);
        }
        
    }

    return 0;
}

