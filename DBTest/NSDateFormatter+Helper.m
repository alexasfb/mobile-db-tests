//
//  NSDateFormatter+Helper.m
//  p2-guide
//
//  Created by Tony Dam on 10/8/14.
//  Copyright (c) 2014 Peek. All rights reserved.
//

#import "NSDateFormatter+Helper.h"


@implementation NSDateFormatter (Helper)


+ (NSDateFormatter *)dateFormatterForFormat:(NSString *)formatDate {
    
    NSMutableDictionary *threadDictionary = [[NSThread currentThread] threadDictionary];
    NSDateFormatter *dateFormatter = [threadDictionary objectForKey:formatDate];
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];

        [dateFormatter setDateFormat:formatDate];
        
        [threadDictionary setObject:dateFormatter forKey:formatDate];
    }
    return dateFormatter;
}


@end
