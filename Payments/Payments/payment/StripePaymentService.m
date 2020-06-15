//
//  StripePaymentService.m
//  Payments
//
//  Created by Cornerstone on 2020-06-14.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

#import "StripePaymentService.h"

@implementation StripePaymentService

- (void)processPaymentAmount:(NSInteger)amount {
    NSLog(@"Stripe processed amount $%ld", amount);
}

- (BOOL)canProcessPayment {
    return arc4random_uniform(2) ? YES : NO;
}

@end
