//
//  main.m
//  Threelow
//
//  Created by Cornerstone on 2020-06-15.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Game.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Game *game = [[Game alloc] init];
        [game run];
    }
    return 0;
}
