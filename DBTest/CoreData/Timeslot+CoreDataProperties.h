//
//  Timeslot+CoreDataProperties.h
//  DBTest
//
//  Created by Alexandre TAIEB on 9/27/15.
//  Copyright © 2015 Peek. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Timeslot.h"

NS_ASSUME_NONNULL_BEGIN

@interface Timeslot (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *activity;
@property (nullable, nonatomic, retain) NSString *availabilityStatus;
@property (nullable, nonatomic, retain) NSDate *end;
@property (nullable, nonatomic, retain) NSString *guideNotes;
@property (nullable, nonatomic, retain) NSString *idActivity;
@property (nullable, nonatomic, retain) NSString *idFake;
@property (nullable, nonatomic, retain) NSString *idTimeslot;
@property (nullable, nonatomic, retain) NSString *managerNotes;
@property (nullable, nonatomic, retain) NSString *meetingLocation;
@property (nullable, nonatomic, retain) NSDate *start;
@property (nullable, nonatomic, retain) NSString *time_series_type;
@property (nullable, nonatomic, retain) NSSet<NSManagedObject *> *bookings;
@property (nullable, nonatomic, retain) NSOrderedSet<NSManagedObject *> *equipments;
@property (nullable, nonatomic, retain) NSOrderedSet<NSManagedObject *> *guides;

@end

@interface Timeslot (CoreDataGeneratedAccessors)

- (void)addBookingsObject:(NSManagedObject *)value;
- (void)removeBookingsObject:(NSManagedObject *)value;
- (void)addBookings:(NSSet<NSManagedObject *> *)values;
- (void)removeBookings:(NSSet<NSManagedObject *> *)values;

- (void)insertObject:(NSManagedObject *)value inEquipmentsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromEquipmentsAtIndex:(NSUInteger)idx;
- (void)insertEquipments:(NSArray<NSManagedObject *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeEquipmentsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInEquipmentsAtIndex:(NSUInteger)idx withObject:(NSManagedObject *)value;
- (void)replaceEquipmentsAtIndexes:(NSIndexSet *)indexes withEquipments:(NSArray<NSManagedObject *> *)values;
- (void)addEquipmentsObject:(NSManagedObject *)value;
- (void)removeEquipmentsObject:(NSManagedObject *)value;
- (void)addEquipments:(NSOrderedSet<NSManagedObject *> *)values;
- (void)removeEquipments:(NSOrderedSet<NSManagedObject *> *)values;

- (void)insertObject:(NSManagedObject *)value inGuidesAtIndex:(NSUInteger)idx;
- (void)removeObjectFromGuidesAtIndex:(NSUInteger)idx;
- (void)insertGuides:(NSArray<NSManagedObject *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeGuidesAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInGuidesAtIndex:(NSUInteger)idx withObject:(NSManagedObject *)value;
- (void)replaceGuidesAtIndexes:(NSIndexSet *)indexes withGuides:(NSArray<NSManagedObject *> *)values;
- (void)addGuidesObject:(NSManagedObject *)value;
- (void)removeGuidesObject:(NSManagedObject *)value;
- (void)addGuides:(NSOrderedSet<NSManagedObject *> *)values;
- (void)removeGuides:(NSOrderedSet<NSManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END
