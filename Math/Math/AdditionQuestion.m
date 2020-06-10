//
//  AdditionQuestion.m
//  Math
//
//  Created by Cornerstone on 2020-06-09.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

#import "AdditionQuestion.h"

@implementation AdditionQuestion

//+ (instancetype) generateRandomQuestion {
//    AdditionQuestion *randon = [super init];
//    if (randon != NULL){
//        uint32_t ls = arc4random_uniform(100);
//        uint32_t rs = arc4random_uniform(100);
//        [randon question: = [NSString stringWithFormat:@"%d + %d: ", ls, rs]];
//    }
//    return randon;
//}

- (instancetype) init {
    if (self = [super init]){
        int ls = arc4random_uniform(91) + 10;
        int rs = arc4random_uniform(91) + 10;
        int sum = ls + rs;
        _question = [NSString stringWithFormat:@"%u + %u: ", ls, rs];
        _answer = (NSInteger) sum;
    }
    return self;
}
@end
