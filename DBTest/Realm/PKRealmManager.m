//
//  PKRealmManager.m
//  DBTest
//
//  Created by Alexandre TAIEB on 9/27/15.
//  Copyright © 2015 Peek. All rights reserved.
//

#import "PKRealmManager.h"
#import "RLMTimeslot.h"
#import <Realm.h>

@implementation PKRealmManager

+ (void) persistTimeslots:(NSArray *)timeslots {
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    [realm transactionWithBlock:^{
        for (NSDictionary *timeslot in timeslots) {
            RLMTimeslot *ts = [RLMTimeslot new];
            [ts setFields:timeslot];
            [realm addObject:ts];
        }
    }];
    
    // [realm beginWriteTransaction];
    
    
    
   // [realm commitWriteTransaction];
}

+ (void) readTimeslotsWithCount:(NSInteger) maxRead {
    
    for (NSInteger i=0;i<maxRead;i++) {
        RLMResults *results = [RLMTimeslot objectsWhere:@"idTimeslot = '55f703a806ecd7065307d037'"];
    }
}



+ (ExecutionBlock) realmInsertionBlock:(NSArray *)data {
    
    ExecutionBlock block = ^() {
        [PKRealmManager persistTimeslots:data];
    };
    
    return block;
}

+ (ExecutionBlock) realmReadBlockMaxReads:(NSInteger) maxRead {
    
    ExecutionBlock block = ^() {
        [PKRealmManager readTimeslotsWithCount:maxRead];
    };
    
    return block;
}

@end
