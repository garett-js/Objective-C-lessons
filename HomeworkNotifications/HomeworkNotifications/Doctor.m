//
//  Doctor.m
//  HomeworkNotifications
//
//  Created by Роман Сергиенко on 16.11.16.
//  Copyright © 2016 ig. All rights reserved.
//

#import "Doctor.h"
#import "Government.h"

@implementation Doctor

#pragma mark - Initialization
- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(salaryChangeNotification:)
                                                     name:GovernmentSalaryDidChangeNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(averagePriceChangeNotification:)
                                                     name:GovernmentAveragePriceDidChangeNotification
                                                   object:nil];
        
    }
    return self;
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notifications
- (void) salaryChangeNotification:(NSNotification*)notification {
    NSNumber* value = [notification.userInfo objectForKey:GovernmentSalaryUserInfoKey];
    
    float salary = [value floatValue];
    
    if (salary < self.salary) {
        NSLog(@"Doctors are not happy");
    } else {
        NSLog(@"Doctors are happy");
    }
    
    self.salary = salary;
    
    NSLog(@"Doctor > salaryChangedNotification userInfo:%@", notification.userInfo);
}

- (void) averagePriceChangeNotification:(NSNotification*)notification {
    NSLog(@"Doctor > averagePriceChangeNotification userInfo:%@", notification.userInfo);
}


@end
