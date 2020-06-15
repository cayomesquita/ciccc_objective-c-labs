//
//  PaymentServiceFactory.m
//  Payments
//
//  Created by Cornerstone on 2020-06-14.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

#import "PaymentServiceFactory.h"
#import "PaypalPaymentService.h"
#import "StripePaymentService.h"
#import "AmazonPaymentService.h"
#import "ApplePaymentService.h"

@implementation PaymentServiceFactory

+ (id<PaymentDelegate>) createWithOption: (NSInteger) option {
    switch (option) {
        case 1:
            return  [[PaypalPaymentService alloc] init];
        case 2:
            return  [[StripePaymentService alloc] init];
        case 3:
            return  [[AmazonPaymentService alloc] init];
        case 4:
            return  [[ApplePaymentService alloc] init];
        default:
            return NULL;
    }
}

@end
