//
//  Student.m
//  HomeworkClosure
//
//  Created by Роман Сергиенко on 18.11.16.
//  Copyright © 2016 ig. All rights reserved.
//

#import "Student.h"

@implementation Student

- (instancetype)initWithName:(NSString*)name lastName:(NSString*)lastName {
    self = [super init];
    if (self) {
        self.name = name;
        self.lastName = lastName;
    }
    return self;
}

@end
