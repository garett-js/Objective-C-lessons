//
//  BadDoctor.m
//  HomeworkDelegate
//
//  Created by Роман Сергиенко on 15.11.16.
//  Copyright © 2016 ig. All rights reserved.
//

#import "BadDoctor.h"
#import "Patient.h"

@implementation BadDoctor

- (void) patientFeelsBad:(Patient *)patient {
    if (patient.headache == true) {
        NSLog(@"YOU SHALL NOT PASS !!!");
    }
    
    if (patient.temperature >= 37.f && patient.temperature <= 39.f) {
        [patient sleep];
    } else if (patient.temperature > 39.f) {
        NSLog(@"Bye Bye motherfucker !!!");
    } else {
        NSLog(@"Patient %@ ahahahahaha! Go away!!!", patient.name);
    }
}

@end
