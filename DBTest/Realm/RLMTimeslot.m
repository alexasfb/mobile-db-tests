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

- (void) setFields:(NSDictionary*)fields {
    self.activity = [fields objectForKey:FIELD_TIMESLOT_ACTIVITY];
    self.idTimeslot = [fields objectForKey:FIELD_TIMESLOT_ID];
    self.idActivity = [fields objectForKey:FIELD_TIMESLOT_ACTIVITY_ID];
    
    NSDateFormatter* formatter = [NSDateFormatter dateFormatterForFormat:FORMAT_TIMESLOT_DATE];
    //Dates send from server are using the US format. We need to set the locale of this DateFormater to be sure the date will be parse properly.
    //On iPhone OS, the user can override the default AM/PM versus 24-hour time setting (via Settings > General > Date & Time > 24-Hour Time), which causes NSDateFormatter to rewrite the format string
    [formatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"]];
    self.start = [formatter dateFromString:[fields objectForKey:FIELD_TIMESLOT_START]];
    self.end = [formatter dateFromString:[fields objectForKey:FIELD_TIMESLOT_END]];
    
    self.idFake = [fields objectForKey:FIELD_TIMESLOT_FAKE_ID];
    
    self.managerNotes = [fields objectForKey:FIELD_TIMESLOT_MANAGER_NOTES];
    self.guideNotes = [fields objectForKey:FIELD_TIMESLOT_GUIDE_NOTES];
    self.meetingLocation = [fields objectForKey:FIELD_TIMESLOT_MEETING_LOCATION];
    self.time_series_type = [fields objectForKey:FIELD_TIMESLOT_TIME_SERIES_TYPE];
    self.availabilityStatus = [fields objectForKey:FIELD_TIMESLOT_AVAILABILITY_STATUS];
}


@end
