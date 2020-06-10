//
//  Box.h
//  Lab2
//
//  Created by Cornerstone on 2020-06-09.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Box : NSObject

@property float height;
@property float width;
@property float length;

- (instancetype) initWithHeight: (float) height andWidth: (float) width andLength: (float) length;

- (float) volume;

- (int) howManyTimesFitInsideOf: (Box *) box;

@end
