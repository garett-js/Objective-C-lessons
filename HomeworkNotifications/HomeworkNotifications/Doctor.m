//
//  Doctor.m
//  HomeworkNotifications
//
//  Created by Роман Сергиенко on 16.11.16.
//  Copyright © 2016 ig. All rights reserved.
//

#import "Doctor.h"
#import "Government.h"
#import "AppDelegate.h"


@interface Doctor ()
@property (assign, nonatomic) float averagePrice;
@property (assign, nonatomic) float infliation;
@end

@implementation Doctor

#pragma mark - Initialization
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.name = @"NoName";
        self.salary = 1000.f;
        self.averagePrice = 8.f;
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(salaryChangeNotification:)
                                                     name:GovernmentSalaryDidChangeNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(averagePriceChangeNotification:)
                                                     name:GovernmentAveragePriceDidChangeNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(didEnterBackgroundNotification:)
                                                     name:UIApplicationDidEnterBackgroundNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(willEnterForegroundNotification:)
                                                     name:UIApplicationWillEnterForegroundNotification
                                                   object:nil];
        
    }
    return self;
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notifications

- (void) didEnterBackgroundNotification:(NSNotification*)notification {
    NSLog(@"%@ going to sleep! userInfo:%@", self.name, notification.userInfo);
}

- (void) willEnterForegroundNotification:(NSNotification*)notification {
    NSLog(@"%@ wake up! userInfo:%@", self.name, notification.userInfo);
}

- (void) salaryChangeNotification:(NSNotification*)notification {
    NSNumber* numberSalary = [notification.userInfo objectForKey:GovernmentSalaryUserInfoKey];
    
    float salary = [numberSalary floatValue];
    
    NSLog(@"Doctor %@, %@", self.name,
          self.salary < salary ? @"is very happy" : @"is not happy ... ");
    
    self.salary = salary;
    
    NSLog(@"Doctor > salaryChangedNotification userInfo:%@", notification.userInfo);
}

- (void) averagePriceChangeNotification:(NSNotification*)notification {
    NSLog(@"Doctor > averagePriceChangeNotification userInfo:%@", notification.userInfo);
    
    NSNumber* numberPrice = [notification.userInfo objectForKey:GovernmentAveragePriceUserInfoKey];
    float averagePrice = [numberPrice floatValue];
    
    self.infliation = (averagePrice - self.averagePrice) / self.averagePrice * 100;
    
    if (self.infliation > 0) {
        NSLog(@"%@: Average price: %f-> %f. Infliation: %f %@\n",
              self.name, self.averagePrice, averagePrice, self.infliation, @"%");
    } else {
        NSLog(@"Нет что-то сил придумывать что-то забавное сегодня");
    }
    
    self.averagePrice = averagePrice;
}


@end
