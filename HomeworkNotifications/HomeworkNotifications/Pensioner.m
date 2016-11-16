//
//  Pensioner.m
//  HomeworkNotifications
//
//  Created by Роман Сергиенко on 16.11.16.
//  Copyright © 2016 ig. All rights reserved.
//

#import "Pensioner.h"
#import "Government.h"

@interface Pensioner ()
@property (assign, nonatomic) float averagePrice;
@property (assign, nonatomic) float infliation;
@end

@implementation Pensioner

#pragma mark - Initialization
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.name = @"NoName";
        self.pension = 500.f;
        self.averagePrice = 9.f;
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(pensionChangeNotification:)
                                                     name:GovernmentPensionDidChangeNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(averagePriceChangeNotification:)
                                                     name:GovernmentAveragePriceDidChangeNotification
                                                   object:nil];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notofications

- (void) pensionChangeNotification:(NSNotification*)notification {
    NSLog(@"Pensioner > pensionChangeNotification userInfo:%@", notification.userInfo);
    
    NSNumber* numberPension = [notification.userInfo objectForKey:GovernmentPensionUserInfoKey];
    float pension = [numberPension floatValue];
    
    NSLog(@"Pensioner %@, %@", self.name,
          self.pension < pension ? @"is very happy" : @"is very very very long time ago ... ");
    
    self.pension = pension;
}

- (void) averagePriceChangeNotification:(NSNotification*)notification {
    NSLog(@"Pensioner > averagePriceChangeNotification userInfo:%@", notification.userInfo);
    
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
