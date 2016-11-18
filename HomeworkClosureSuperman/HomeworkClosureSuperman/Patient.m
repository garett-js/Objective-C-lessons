//
//  Patient.m
//  HomeworkClosureSuperman
//
//  Created by Роман Сергиенко on 18.11.16.
//  Copyright © 2016 ig. All rights reserved.
//

#import "Patient.h"

@implementation Patient

- (instancetype)initWithName:(NSString*)name temprature:(float)temp headache:(float)headache
{
    self = [super init];
    if (self) {
        self.name = name;
        self.temperature = temp;
        self.headache = headache;
        
        void (^closureDoc)(Patient*) = ^(Patient* patient) {
            if (patient.temperature < 38.f && patient.temperature > 36.6f) {
                [patient takePill];
            } else if (patient.temperature > 39.f) {
                [patient makeShot];
            } else {
                NSLog(@"%@ go to sleep", patient.name);
            }
        };
        
        [self performSelector:@selector(feelsBadWith:) withObject:closureDoc afterDelay:arc4random()% 11 + 5];
    }
    return self;
}

- (void) feelsBadWith:(void (^)(Patient*))closureDoc {
    closureDoc(self);
}

- (void) takePill {
    NSLog(@"Patient %@ takes a pill!", self.name);
}
- (void) makeShot {
    NSLog(@"Patient %@ make shot!", self.name);
}

@end
