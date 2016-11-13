//
//  Student.m
//  Dictionary
//
//  Created by Роман Сергиенко on 13.11.16.
//  Copyright © 2016 ig. All rights reserved.
//

#import "Student.h"

@implementation Student

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"";
        self.lastName = @"";
        self.helloPhrase = @"";
    }
    return self;
}

- (instancetype)initWithName:(NSString*)name andLastName:(NSString*)lastName andHelloPhrase:(NSString*)helloPhrase {
    self = [super init];
    if (self) {
        self.name = name;
        self.lastName = lastName;
        self.helloPhrase = helloPhrase;
    }
    return self;
}

@end
