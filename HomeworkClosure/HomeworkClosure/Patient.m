//
//  Patient.m
//  HomeworkClosure
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
