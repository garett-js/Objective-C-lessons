//
//  Animal.m
//  HomeWorkArrays
//
//  Created by Роман Сергиенко on 09.11.16.
//  Copyright © 2016 ig. All rights reserved.
//

#import "Animal.h"

@implementation Animal

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.nickname = @"NoName";
    }
    return self;
}

- (void) move {
    NSLog(@"i like to move it, move it");
}
@end
