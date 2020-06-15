//
//  PaypalPaymentService,.h
//  Payments
//
//  Created by Cornerstone on 2020-06-14.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PaymentGateway.h"

NS_ASSUME_NONNULL_BEGIN

@interface PaypalPaymentService : NSObject <PaymentDelegate>

-(void) processPaymentAmount:(NSInteger) amount;

@end

NS_ASSUME_NONNULL_END
