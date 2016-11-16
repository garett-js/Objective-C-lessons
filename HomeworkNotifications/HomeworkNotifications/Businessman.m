//
//  Businessman.m
//  HomeworkNotifications
//
//  Created by Роман Сергиенко on 16.11.16.
//  Copyright © 2016 ig. All rights reserved.
//

#import "Businessman.h"
#import "Government.h"

//@private
@interface Businessman ()
@property (assign, nonatomic) float averagePrice;
@property (assign, nonatomic) float infliation;
@end

@implementation Businessman

#pragma mark - Initialization
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.name = @"NoName";
        self.taxLevel = 5.f;
        self.averagePrice = 5.f;
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(taxLevelChangeNotification:)
                                                     name:GovernmentTaxLevelDidChangeNotification
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

- (void) taxLevelChangeNotification:(NSNotification*)notification {
    NSLog(@"Businessman > taxLevelChangeNotification userInfo:%@", notification.userInfo);
    NSNumber* tax = [notification.userInfo objectForKey:GovernmentTaxLevelUserInfoKey];
    float taxLevel = [tax floatValue];
    
    NSLog(@"Businessman %@ %@.", self.name,
          self.taxLevel > taxLevel ? @"is very happy, tax decrease!" : @"is very sad, tax increase");
    
    self.taxLevel = taxLevel;
}

- (void) averagePriceChangeNotification:(NSNotification*)notification {
    NSLog(@"Businessman > averagePriceChangeNotification userInfo:%@", notification.userInfo);
    
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
