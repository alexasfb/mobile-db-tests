//
//  PKTimeMeasurer.h
//  DBTest
//
//  Created by Alexandre TAIEB on 9/27/15.
//  Copyright © 2015 Peek. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ExecutionBlock)();

@interface PKTimeMeasurer : NSObject

+ (void) executeBlockAndMeasureTaskName:(NSString *)taskName
                           objectsCount:(NSInteger)count
                              withBlock:(ExecutionBlock) block;

@end
