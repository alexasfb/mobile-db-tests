//
//  RLMTimeslot.m
//  DBTest
//
//  Created by Alexandre TAIEB on 9/27/15.
//  Copyright © 2015 Peek. All rights reserved.
//

#import "RLMTimeslot.h"
#import "NSDateFormatter+Helper.h"
#import "Constants.h"

@implementation RLMTimeslot

+ (NSDictionary *)mapFields:(NSDictionary *)fields {
    NSDateFormatter *formatter = [NSDateFormatter dateFormatterForFormat:FORMAT_TIMESLOT_DATE];
    //Dates send from server are using the US format. We need to set the locale of this DateFormater to be sure the date will be parse properly.
    //On iPhone OS, the user can override the default AM/PM versus 24-hour time setting (via Settings > General > Date & Time > 24-Hour Time), which causes NSDateFormatter to rewrite the format string
    [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"]];

    return @{
             @"activity": fields[FIELD_TIMESLOT_ACTIVITY],
             @"idTimeslot": fields[FIELD_TIMESLOT_ID],
             @"idActivity": fields[FIELD_TIMESLOT_ACTIVITY_ID],
             @"start": [formatter dateFromString:fields[FIELD_TIMESLOT_START]],
             @"end": [formatter dateFromString:fields[FIELD_TIMESLOT_END]],
             @"idFake": fields[FIELD_TIMESLOT_FAKE_ID],
             @"managerNotes": fields[FIELD_TIMESLOT_MANAGER_NOTES],
             @"guideNotes": fields[FIELD_TIMESLOT_GUIDE_NOTES],
             @"meetingLocation": fields[FIELD_TIMESLOT_MEETING_LOCATION],
             @"time_series_type": fields[FIELD_TIMESLOT_TIME_SERIES_TYPE],
             @"availabilityStatus": fields[FIELD_TIMESLOT_AVAILABILITY_STATUS]
     };
}

@end
