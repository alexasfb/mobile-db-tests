//
//  PKCoreDataManager.m
//  DBTest
//
//  Created by Alexandre TAIEB on 9/27/15.
//  Copyright © 2015 Peek. All rights reserved.
//

#import "PKCoreDataManager.h"
#import <MagicalRecord.h>
#import <NSManagedObjectContext+MagicalThreading.h>
#import <NSManagedObject+MagicalRecord.h>
#import <NSManagedObjectContext+MagicalSaves.h>
#import "Timeslot.h"
#import "Constants.h"
#import "NSDateFormatter+Helper.h"

@implementation PKCoreDataManager

+ (void) initDatabase {
    [MagicalRecord setupAutoMigratingCoreDataStack];
}

+ (void) persistTimeslots:(NSArray *)timeslots {
   
    NSManagedObjectContext *localContext = [NSManagedObjectContext MR_contextForCurrentThread];
    
    for (NSDictionary* json in timeslots) {
        Timeslot *ts = [Timeslot MR_createEntityInContext:localContext];
        
        [PKCoreDataManager setFields:json
                          toTimeslot:ts];
    }
    [localContext MR_saveToPersistentStoreWithCompletion:^(BOOL success, NSError *error) {
    }];
    
}

+ (void) readTimeslotsWithCount:(NSInteger) maxRead {
    
    for (NSInteger i=0;i<maxRead;i++) {
        Timeslot *ts = [Timeslot MR_findByAttribute:@"idTimeslot" withValue:@"55f703a806ecd7065307d037"];
    }
}


+ (ExecutionBlock) coreDataInsertionBlock:(NSArray *)data {
    
    ExecutionBlock block = ^() {
        [PKCoreDataManager persistTimeslots:data];
    };
    
    return block;
}

+ (ExecutionBlock) coreDataReadBlockMaxReads:(NSInteger) maxRead {
    
    ExecutionBlock block = ^() {
        [PKCoreDataManager readTimeslotsWithCount:maxRead];
    };
    
    return block;
}

+ (void) setFields:(NSDictionary*)fields toTimeslot:(Timeslot *) ts{
    ts.activity = [fields objectForKey:FIELD_TIMESLOT_ACTIVITY];
    ts.idTimeslot = [fields objectForKey:FIELD_TIMESLOT_ID];
    ts.idActivity = [fields objectForKey:FIELD_TIMESLOT_ACTIVITY_ID];
    
    NSDateFormatter* formatter = [NSDateFormatter dateFormatterForFormat:FORMAT_TIMESLOT_DATE];
    //Dates send from server are using the US format. We need to set the locale of this DateFormater to be sure the date will be parse properly.
    //On iPhone OS, the user can override the default AM/PM versus 24-hour time setting (via Settings > General > Date & Time > 24-Hour Time), which causes NSDateFormatter to rewrite the format string
    [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"]];
    ts.start = [formatter dateFromString:[fields objectForKey:FIELD_TIMESLOT_START]];
    ts.end = [formatter dateFromString:[fields objectForKey:FIELD_TIMESLOT_END]];
    
    ts.idFake = [fields objectForKey:FIELD_TIMESLOT_FAKE_ID];
    
    ts.managerNotes = [fields objectForKey:FIELD_TIMESLOT_MANAGER_NOTES];
    ts.guideNotes = [fields objectForKey:FIELD_TIMESLOT_GUIDE_NOTES];
    ts.meetingLocation = [fields objectForKey:FIELD_TIMESLOT_MEETING_LOCATION];
    ts.time_series_type = [fields objectForKey:FIELD_TIMESLOT_TIME_SERIES_TYPE];
    ts.availabilityStatus = [fields objectForKey:FIELD_TIMESLOT_AVAILABILITY_STATUS];
}


@end
