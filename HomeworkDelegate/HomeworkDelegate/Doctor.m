//
//  Doctor.m
//  HomeworkDelegate
//
//  Created by Роман Сергиенко on 15.11.16.
//  Copyright © 2016 ig. All rights reserved.
//

#import "Doctor.h"
#import "Patient.h"

@implementation Doctor

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
        NSLog(@"Patient %@ should rest", patient.name);
    }
}

@end
