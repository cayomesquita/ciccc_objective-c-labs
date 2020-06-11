//
//  NSString+PigLatin.m
//  PigLatin
//
//  Created by Cornerstone on 2020-06-10.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

#import "NSString+PigLatin.h"

@implementation NSString (PigLatin)

- (NSString *) pigLatinization {
//    NSCharacterSet *vowels = [NSCharacterSet characterSetWithCharactersInString:@"aeiouAEIOU"];
    NSCharacterSet *consonants = [NSCharacterSet  characterSetWithCharactersInString:@"bcdfghjklmnpqrstvwxyz"];
    
    NSArray *clusters = @[@"ch", @"sh", @"sm", @"st", @"th", @"ps", @"ph", @"pl", @"gl"];
    
    NSRange range;
    for (NSString *cluster in clusters){
        range = [[self lowercaseString] rangeOfString:cluster];
        if (range.location == 0){
            break;
        }
    }
    if (range.location == NSNotFound){
        range = [[self lowercaseString] rangeOfCharacterFromSet:consonants];
    }
    if (range.location == 0) {
        NSString *sufix = [[self substringWithRange:range] lowercaseString];
        NSRange coreRange = NSMakeRange(range.length, [self length] - range.length);
        NSString *core = [[self substringWithRange:coreRange] capitalizedString];
        return [NSString stringWithFormat:@"%@%@%@", core, sufix, @"ay"];;
    }
    
    return self;
}

- (NSString *) stringByPigLatinization {
    NSArray *tokens = [self componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSMutableString *str = [NSMutableString string];
    for (NSString *word in tokens) {
        [str appendString:[word pigLatinization]];
        [str appendString:@" "];
    }
    [str deleteCharactersInRange:NSMakeRange([str length] - 1, 1)];
    return str;
}

@end
