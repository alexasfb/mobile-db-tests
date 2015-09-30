//
//  RLMTimeslot.h
//  DBTest
//
//  Created by Alexandre TAIEB on 9/27/15.
//  Copyright © 2015 Peek. All rights reserved.
//

#import "RLMObject.h"

@interface RLMTimeslot : RLMObject

@property NSString * activity;
@property NSDate * end;
@property NSString * guideNotes;
@property NSString * idActivity;
@property NSString * idFake;
@property NSString * idTimeslot;
@property NSString * managerNotes;
@property NSString * meetingLocation;
@property NSDate * start;
@property NSString * time_series_type;
@property NSString *availabilityStatus;

+ (NSDictionary *)mapFields:(NSDictionary *)fields;

@end
