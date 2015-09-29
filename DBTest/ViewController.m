//
//  ViewController.m
//  DBTest
//
//  Created by Alexandre TAIEB on 9/27/15.
//  Copyright © 2015 Peek. All rights reserved.
//

#import "ViewController.h"
#import "PKTimeMeasurer.h"
#import <Realm.h>
#import "RLMTimeslot.h"
#import "PKJSONParser.h"
#import <CouchbaseLite/CouchbaseLite.h>
#import "PKRealmManager.h"
#import "PKCouchBaseManager.h"
#import "PKCoreDataManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self launchDataBaseTests];
}

- (void) launchDataBaseTests {
    
    [PKCoreDataManager initDatabase];
    
    [self launchCoreDataWriteTests];
    [self launchRealmWriteTests];
    [self launchCouchSQLiteWriteTest];
    [self launchCouchForestDBWriteTest];
    
    [self launchCoreDataReadTests];
    [self launchRealmReadTests];
    [self launchCouchSQLiteReadTests];
    [self launchCouchForestDBReadTest];
    
}

#pragma mark -
#pragma mark Write

- (void) launchCoreDataWriteTests {
    NSArray *data = [self getTimeslotsData];
    ExecutionBlock block = [PKCoreDataManager coreDataInsertionBlock:data];
    
    NSString *taskName = [NSString stringWithFormat:@"CORE DATA - Persisted %lu timeslots", (unsigned long)data.count];
    
    [PKTimeMeasurer executeBlockAndMeasureTaskName:taskName
                                      objectsCount:data.count
                                         withBlock:block];
}

- (void) launchRealmWriteTests {
    
    NSArray *data = [self getTimeslotsData];
    ExecutionBlock block = [PKRealmManager realmInsertionBlock:data];
    
    NSString *taskName = [NSString stringWithFormat:@"REALM - Persisted %lu timeslots", (unsigned long)data.count];
    
    [PKTimeMeasurer executeBlockAndMeasureTaskName:taskName
                                      objectsCount:data.count
                                         withBlock:block];

}


- (void) launchCouchSQLiteWriteTest {
    
    NSArray *data = [self getTimeslotsData];
    ExecutionBlock block = [PKCouchBaseManager couchBaseInsertionBlock:data
                                                           useForestDB:NO];
    
    NSString *taskName = [NSString stringWithFormat:@"COUCHBASE - SQLITE - Persisted %lu timeslots", (unsigned long)data.count];
    
    [PKTimeMeasurer executeBlockAndMeasureTaskName:taskName
                                      objectsCount:data.count
                                         withBlock:block];
    
}

- (void) launchCouchForestDBWriteTest {
    
    NSArray *data = [self getTimeslotsData];
    ExecutionBlock block = [PKCouchBaseManager couchBaseInsertionBlock:data
                                                           useForestDB:NO];
    
    NSString *taskName = [NSString stringWithFormat:@"COUCHBASE - FOREST DB - Persisted %lu timeslots", (unsigned long)data.count];
    
    [PKTimeMeasurer executeBlockAndMeasureTaskName:taskName
                                      objectsCount:data.count
                                         withBlock:block];
    
}


#pragma mark -
#pragma mark Reads

- (void) launchCoreDataReadTests {
    
    NSInteger count = 500;
    
    ExecutionBlock block = [PKCoreDataManager coreDataReadBlockMaxReads:count];
    
    NSString *taskName = [NSString stringWithFormat:@"CORE DATA - Read %ld timeslots",count];
    
    [PKTimeMeasurer executeBlockAndMeasureTaskName:taskName
                                      objectsCount:count
                                         withBlock:block];
    
}

- (void) launchRealmReadTests {
    
    NSInteger count = 30000;
    
    ExecutionBlock block = [PKRealmManager realmReadBlockMaxReads:count];
    
    NSString *taskName = [NSString stringWithFormat:@"REALM - Read %ld timeslots",count];
    
    [PKTimeMeasurer executeBlockAndMeasureTaskName:taskName
                                      objectsCount:count
                                         withBlock:block];
    
}

- (void) launchCouchSQLiteReadTests {
    
    NSInteger count = 100;
    ExecutionBlock block = [PKCouchBaseManager couchBaseReadBlockMaxReads:count
                                                              useForestDB:NO];
    
    NSString *taskName = [NSString stringWithFormat:@"COUCHBASE - SQLITE - Read %ld timeslots", count];
    
    [PKTimeMeasurer executeBlockAndMeasureTaskName:taskName
                                      objectsCount:count
                                         withBlock:block];
    
}

- (void) launchCouchForestDBReadTest {
    
    NSInteger count = 100;
    ExecutionBlock block = [PKCouchBaseManager couchBaseReadBlockMaxReads:count
                                                              useForestDB:YES];
    
    NSString *taskName = [NSString stringWithFormat:@"COUCHBASE - FOREST DB - Read %ld timeslots", count];
    
    [PKTimeMeasurer executeBlockAndMeasureTaskName:taskName
                                      objectsCount:count
                                         withBlock:block];
    
}

#pragma mark -
#pragma markData


- (NSArray *) getTimeslotsData {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"range_payload" ofType:@"json"];
    
    NSDictionary *jsonData = [[[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil] objectFromJSONString];
    
    NSArray *timeslots = [[jsonData objectForKey:@"content"] objectForKey:@"timeslots"];
    
    NSMutableArray *results = [NSMutableArray new];
    
    [results addObjectsFromArray:timeslots];
    
    NSMutableArray *res = [NSMutableArray new];
    
    
    for (NSInteger i=1;i<=10;i++) {
        for (NSDictionary *aDico in timeslots) {
            [res addObject:[aDico copy]];
        }
    }
    
    return res;
}


@end
