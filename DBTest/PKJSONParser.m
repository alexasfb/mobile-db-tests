//
//  NSString+PKJSONParser.m
//  DBTest
//
//  Created by Alexandre TAIEB on 9/27/15.
//  Copyright © 2015 Peek. All rights reserved.
//

#import "PKJSONParser.h"

@implementation NSString (PKJSONParser)

- (id) objectFromJSONString {
    
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    
   return [NSJSONSerialization JSONObjectWithData:data
                                    options:kNilOptions
                                      error:nil];
}

@end
