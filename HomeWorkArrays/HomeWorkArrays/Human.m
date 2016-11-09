//
//  Human.m
//  HomeWorkArrays
//
//  Created by Роман Сергиенко on 09.11.16.
//  Copyright © 2016 ig. All rights reserved.
//

#import "Human.h"

@implementation Human

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"NoName";
        self.weight = 0.f;
        self.height = 0.f;
        self.gender = male;
    }
    return self;
}

- (void) move {
    NSLog(@"Human walks");
}

@end
