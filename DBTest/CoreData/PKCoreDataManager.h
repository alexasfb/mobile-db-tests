//
//  PKCoreDataManager.h
//  DBTest
//
//  Created by Alexandre TAIEB on 9/27/15.
//  Copyright © 2015 Peek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PKTimeMeasurer.h"

@interface PKCoreDataManager : NSObject

+ (ExecutionBlock) coreDataReadBlockMaxReads:(NSInteger) maxRead;
+ (ExecutionBlock) coreDataInsertionBlock:(NSArray *)data;
+ (void) initDatabase;
@end
