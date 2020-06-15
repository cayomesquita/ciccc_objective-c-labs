//
//  main.m
//  Payments
//
//  Created by Cornerstone on 2020-06-14.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputHandler.h"
#import "PaymentGateway.h"
#import "PaymentServiceFactory.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int value = arc4random_uniform(901) + 100;
        
        NSString *str = [NSString stringWithFormat:@"Thank you for shopping at Acme.com\nYour total today is $%d \nPlease select your payment method: 1: Paypal, 2: Stripe, 3: Amazon: , 4: Apple", value];
        
        NSString *input = [InputHandler inputUser:str];
        
        NSNumber *inputNum = [[[NSNumberFormatter alloc] init] numberFromString:input];
        
        if(inputNum == NULL){
            NSLog(@"Invalid input");
        } else {
            NSInteger option = [inputNum integerValue];
            NSLog(@"Your option: %d", option);
            PaymentGateway *payment = [[PaymentGateway alloc] init];
            id<PaymentDelegate> delegate = [PaymentServiceFactory createWithOption:option];
            payment.paymentDelegate = delegate;
            [payment processPaymentAmount:value];
        }
        
    }
    return 0;
}
