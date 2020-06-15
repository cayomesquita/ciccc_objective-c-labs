//
//  ApplePaymentService.m
//  Payments
//
//  Created by Cornerstone on 2020-06-14.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

#import "ApplePaymentService.h"

@implementation ApplePaymentService

- (void)processPaymentAmount:(NSInteger)amount {
    NSLog(@"Apple processed amount $%ld", amount);
}

- (BOOL)canProcessPayment {
    return arc4random_uniform(2) ? YES : NO;
}

@end
