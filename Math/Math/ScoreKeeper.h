//
//  ScoreKeeper.h
//  Math
//
//  Created by Cornerstone on 2020-06-09.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScoreKeeper : NSObject

@property int rightCounter;
@property int wrongCounter;

- (void) increaseRight;
- (void) increaseWrong;
- (NSString *) score;

@end
