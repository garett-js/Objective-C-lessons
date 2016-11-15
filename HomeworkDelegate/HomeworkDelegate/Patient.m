//
//  Patient.m
//  HomeworkDelegate
//
//  Created by Роман Сергиенко on 15.11.16.
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
    }
    return self;
}

- (void) feelsBad {
    [self.delegate patientFeelsBad:self];
}
- (void) takePill {
    NSLog(@"Patient %@ takes a pill", self.name);
}
- (void) makeShot {
    NSLog(@"Patient %@ make shot", self.name);
}
- (void) sleep {
    NSLog(@"Patient %@ should go to sleep", self.name);
}

@end
