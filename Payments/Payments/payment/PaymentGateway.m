//
//  PaymentGateway.m
//  Payments
//
//  Created by Cornerstone on 2020-06-14.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

#import "PaymentGateway.h"

@implementation PaymentGateway

-(void) processPaymentAmount:(NSInteger) amount{
    if (_paymentDelegate && [_paymentDelegate canProcessPayment]) {
        [_paymentDelegate processPaymentAmount:amount];
    } else {
        NSLog(@"Payment not available");
    }
}

@end
