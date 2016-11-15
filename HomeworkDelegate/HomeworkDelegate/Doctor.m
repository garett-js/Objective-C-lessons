//
//  Doctor.m
//  HomeworkDelegate
//
//  Created by Роман Сергиенко on 15.11.16.
//  Copyright © 2016 ig. All rights reserved.
//

#import "Doctor.h"
#import "Patient.h"

//@private
@interface Doctor ()
@property (strong, nonatomic) NSDictionary* listOfPart;
@property (strong, nonatomic) NSMutableArray* headache;
@property (strong, nonatomic) NSMutableArray* leg;
@property (strong, nonatomic) NSMutableArray* arm;
@property (strong, nonatomic) NSMutableArray* teeth;
@end

@implementation Doctor

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.headache = [NSMutableArray arrayWithCapacity:0];
        self.leg = [NSMutableArray arrayWithCapacity:0];
        self.arm = [NSMutableArray arrayWithCapacity:0];
        self.teeth = [NSMutableArray arrayWithCapacity:0];
    }
    return self;
}

- (void) raport {
    NSLog(@"Patients raport:");
//    self.listOfPart = @{[NSNumber numberWithInt:head]: self.headache,
//                        [NSNumber numberWithInt:leg]: self.leg,
//                        [NSNumber numberWithInt:arm]: self.arm,
//                        [NSNumber numberWithInt:teeth]: self.teeth,};
//    
    self.listOfPart = @{@"head":  self.headache,
                        @"leg":   self.leg,
                        @"arm":   self.arm,
                        @"teeth": self.teeth,};
    
    
    NSLog(@"%@",self.listOfPart);
}

#pragma mark - PatientDelegate

- (void) patient:(Patient *)patient somethingWith:(PartOfTheBody)part {
    
    switch (part) {
        case head:
            NSLog(@"The patient %@ has a headache", patient.name);
            [patient takePill];
            [self.headache addObject:patient.name];
            break;
        case leg:
            NSLog(@"The patient %@ has a sore leg", patient.name);
            [patient makeShot];
            [self.leg addObject:patient.name];
            break;
        case arm:
            NSLog(@"The patient %@ has a sore arm", patient.name);
            [patient makeShot];
            [self.arm addObject:patient.name];
            break;
        case teeth:
            NSLog(@"In a patient %@ with dental problems", patient.name);
            [self.teeth addObject:patient.name];
            break;
        default:
            break;
    }
}

- (void) patientFeelsBad:(Patient *)patient {
    if (patient.headache == true) {
        [patient takePill];
        [patient sleep];
    }
    
    if (patient.temperature >= 37.f && patient.temperature <= 39.f) {
        [patient takePill];
    } else if (patient.temperature > 39.f) {
        [patient makeShot];
    } else {
        NSLog(@"Patient %@ should rest!!!", patient.name);
    }
}

@end
