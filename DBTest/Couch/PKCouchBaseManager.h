//
//  PKCouchBaseManager.h
//  DBTest
//
//  Created by Alexandre TAIEB on 9/27/15.
//  Copyright © 2015 Peek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CouchbaseLite/CouchbaseLite.h>
#import "PKTimeMeasurer.h"

@interface PKCouchBaseManager : NSObject

@property (nonatomic, strong) CBLDatabase *databaseForest;
@property (nonatomic, strong) CBLDatabase *databaseSQLite;
@property (nonatomic, strong) CBLManager *manager;
@property (strong, nonatomic) NSString *documentId;

+ (PKCouchBaseManager *)sharedInstance;

+ (ExecutionBlock) couchBaseInsertionBlock:(NSArray *)data
                               useForestDB:(BOOL)useForestDB;

+ (ExecutionBlock) couchBaseReadBlockMaxReads:(NSInteger) maxRead
                                  useForestDB:(BOOL)useForestDB;

+ (void) persistTimeslots:(NSArray *)timeslots
              useForestDB:(BOOL)useForestDB;

@end
