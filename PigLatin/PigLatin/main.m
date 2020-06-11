//
//  main.m
//  PigLatin
//
//  Created by Cornerstone on 2020-06-10.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+PigLatin.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"%@", [@"Kale Chips" stringByPigLatinization]);
        NSLog(@"%@", [@"kale chips" stringByPigLatinization]);
        NSLog(@"%@", [@"Ale hips" stringByPigLatinization]);
    }
    return 0;
}
