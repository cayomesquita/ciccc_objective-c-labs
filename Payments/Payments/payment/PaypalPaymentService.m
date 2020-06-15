//
//  PaypalPaymentService.m
//  Payments
//
//  Created by Cornerstone on 2020-06-14.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

#import "PaypalPaymentService.h"

@implementation PaypalPaymentService

- (void)processPaymentAmount:(NSInteger)amount {
    NSLog(@"Paypal processed amount $%ld", amount);
}

- (BOOL)canProcessPayment {
    return arc4random_uniform(2) ? YES : NO;
}

@end
