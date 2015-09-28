//
//  PKRealmManager.h
//  DBTest
//
//  Created by Alexandre TAIEB on 9/27/15.
//  Copyright © 2015 Peek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PKTimeMeasurer.h"

@interface PKRealmManager : NSObject

+ (ExecutionBlock) realmInsertionBlock:(NSArray *)data;

+ (ExecutionBlock) realmReadBlockMaxReads:(NSInteger) maxRead;

@end
