//
//  PaymentGateway.h
//  Payments
//
//  Created by Cornerstone on 2020-06-14.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PaymentDelegate <NSObject>

- (void) processPaymentAmount:(NSInteger) amount;

- (BOOL) canProcessPayment;

@end

@interface PaymentGateway : NSObject

@property (nonatomic, weak) id<PaymentDelegate> paymentDelegate;

- (void) processPaymentAmount:(NSInteger) amount;

@end

NS_ASSUME_NONNULL_END
