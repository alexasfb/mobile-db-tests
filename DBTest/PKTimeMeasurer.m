//
//  PKTimeMeasurer.m
//  DBTest
//
//  Created by Alexandre TAIEB on 9/27/15.
//  Copyright © 2015 Peek. All rights reserved.
//

#import "PKTimeMeasurer.h"

@implementation PKTimeMeasurer

+ (void) executeBlockAndMeasureTaskName:(NSString *)taskName
                           objectsCount:(NSInteger)count
                              withBlock:(ExecutionBlock) block {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        NSDate *startDate = [NSDate date];
        block();
        NSDate *endDate = [NSDate date];
        
        NSTimeInterval duration = [endDate timeIntervalSinceDate:startDate];
        NSLog(@"Executed task: %@ in %.2f seconds.  %.0f Operations / second", taskName, [endDate timeIntervalSinceDate:startDate],count/duration);
        
    });
    
}

@end
