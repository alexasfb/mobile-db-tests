//
//  PKCouchBaseManager.m
//  DBTest
//
//  Created by Alexandre TAIEB on 9/27/15.
//  Copyright © 2015 Peek. All rights reserved.
//

#import "PKCouchBaseManager.h"
#import <CouchbaseLite/CouchbaseLite.h>
#import "CBTimeslot.h"

@implementation PKCouchBaseManager

+ (PKCouchBaseManager *)sharedInstance {
    static PKCouchBaseManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
        
    });
    return sharedInstance;
}

- (CBLDatabase *)databaseForest {
    if (_databaseForest == nil) {
        _databaseForest = [self.manager databaseNamed:@"mytestdatabase_forest"
                                                      error:nil];
    }
    return _databaseForest;
}

- (CBLDatabase *)databaseSQLite {
    if (_databaseForest == nil) {
        _databaseForest = [self.manager databaseNamed:@"mytestdatabase_sqlite"
                                                      error:nil];
    }
    return _databaseForest;
}

- (CBLManager *) manager {
    if (_manager == nil) {
        _manager = [CBLManager sharedInstance];
    }
    return _manager;
}

+ (void) persistTimeslots:(NSArray *)timeslots
              useForestDB:(BOOL)useForestDB{
    
    CBLManager *manager = [PKCouchBaseManager sharedInstance].manager;
    
    if (useForestDB) {
        manager.storageType = @"ForestDB";
    }
    else {
        manager.storageType = @"SQLite";
    }
    
    
    CBLDatabase *database;
    
    if (useForestDB) {
        database =  [PKCouchBaseManager sharedInstance].databaseForest;
    }
    else {
        database =  [PKCouchBaseManager sharedInstance].databaseSQLite;
    }
    
    
    for (NSDictionary *aTimeslot in timeslots) {
        
        CBTimeslot* ts = [CBTimeslot modelForNewDocumentInDatabase:database];
        [ts setFields:aTimeslot];
        [ts save:nil];
        
        if ([PKCouchBaseManager sharedInstance].documentId == nil) {
            [PKCouchBaseManager sharedInstance].documentId = ts.document.documentID;
        }
        
        /*
        CBLDocument *doc = [database createDocument];
        CBLRevision *newRevision = [doc putProperties: aTimeslot
                                                error:nil];
         */

    }
    
}

+ (ExecutionBlock) couchBaseInsertionBlock:(NSArray *)data
                               useForestDB:(BOOL)useForestDB {
    
    ExecutionBlock block = ^() {
        [PKCouchBaseManager persistTimeslots:data
                                 useForestDB:useForestDB];
    };
    
    return block;
}

+ (void) readTimeslotsWithCount:(NSInteger) maxRead
                    useForestDB:(BOOL)useForestDB{
    
    CBLManager *manager = [PKCouchBaseManager sharedInstance].manager;
    
    if (useForestDB) {
        manager.storageType = @"ForestDB";
    }
    
    
    CBLDatabase *database;
    
    if (useForestDB) {
        database = [PKCouchBaseManager sharedInstance].databaseForest;
    }
    else {
        database = [PKCouchBaseManager sharedInstance].databaseSQLite;
    }
    
  //  NSString *documentId = [PKCouchBaseManager sharedInstance].documentId;
        
    for (NSInteger i=0;i<maxRead;i++) {
        
        //NSString* profileDocId = [@"idTimeslot:" stringByAppendingString:@"55f703a806ecd7065307d037"];
      //  CBLDocument *doc= [database existingDocumentWithID: documentId];
      //  CBTimeslot *ts = [CBTimeslot modelForDocument: doc];

        CBLQueryBuilder *queryBuilder = [[CBLQueryBuilder alloc]
                                         initWithDatabase: database
                                         select: @[@"activity", @"idTimeslot"]
                                         where: @"idTimeslot == '55f703a806ecd7065307d037'"
                                         orderBy: nil
                                         error: nil];
        
        CBLQueryEnumerator* results = [queryBuilder runQueryWithContext:nil
                                                                  error:nil];
        
        
       // CBLQuery *query = [[database viewNamed:@"CBTimeslot"] createQuery];
        // we do not need the reduce here
       // query.keys = @[@{@"idTimeslot": @"55f703a806ecd7065307d037"}];
        
      //  [query setMapOnly:YES];
       // [query setDescending:YES];
       
        
        
        /*
        CBLView* view = [database viewNamed:@"TimeslotsView"];
        if (!view.mapBlock) {
            // Register the map function, the first time we access the view:
            [view setMapBlock: MAPBLOCK({
               emit(doc[@"idTimeslot"], @"55f703a806ecd7065307d037");
            })
                  reduceBlock:nil
             version:@"1"]; // bump version any time you change the MAPBLOCK body!
        }
        CBLQueryEnumerator *result = [[view createQuery] run:nil];
        
        CBLQueryRow *row = [result rowAtIndex:0];
        NSLog(@"%@",row.documentProperties);
        */
    }
}

+ (ExecutionBlock) couchBaseReadBlockMaxReads:(NSInteger) maxRead
                                  useForestDB:(BOOL)useForestDB {
    
    ExecutionBlock block = ^() {
        [PKCouchBaseManager readTimeslotsWithCount:maxRead
                                       useForestDB:useForestDB];
    };
    
    return block;
}


@end
