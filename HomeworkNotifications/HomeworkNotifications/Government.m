//
//  Government.m
//  HomeworkNotifications
//
//  Created by Роман Сергиенко on 16.11.16.
//  Copyright © 2016 ig. All rights reserved.
//

#import "Government.h"

NSString* const GovernmentTaxLevelDidChangeNotification = @"GovernmentTaxLevelDidChangeNotification";
NSString* const GovernmentSalaryDidChangeNotification = @"GovernmentSalaryDidChangeNotification";
NSString* const GovernmentPensionDidChangeNotification = @"GovernmentPensionDidChangeNotification";
NSString* const GovernmentAveragePriceDidChangeNotification = @"GovernmentAveragePriceDidChangeNotification";

NSString* const GovernmentTaxLevelUserInfoKey = @"GovernmentTaxLevelUserInfoKey";
NSString* const GovernmentSalaryUserInfoKey = @"GovernmentSalaryUserInfoKey";
NSString* const GovernmentPensionUserInfoKey = @"GovernmentPensionUserInfoKey";
NSString* const GovernmentAveragePriceUserInfoKey = @"GovernmentAveragePriceUserInfoKey";

@implementation Government
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.taxLevel     = 5.f;
        self.salary       = 1000.f;
        self.pension      = 500.f;
        self.averagePrice = 10.f ;
    }
    return self;
}

- (void) setTaxLevel:(float)taxLevel {
    _taxLevel = taxLevel;
    
    NSDictionary* dictInfo = @{GovernmentTaxLevelUserInfoKey : [NSNumber numberWithFloat:taxLevel]};
    
    [[NSNotificationCenter defaultCenter] postNotificationName:GovernmentTaxLevelDidChangeNotification
                                                        object:nil
                                                      userInfo:dictInfo];
}

- (void) setSalary:(float)salary {
    _salary = salary;
    
    NSDictionary* dictInfo = @{GovernmentSalaryUserInfoKey : [NSNumber numberWithFloat:salary]};
    
    [[NSNotificationCenter defaultCenter] postNotificationName:GovernmentSalaryDidChangeNotification
                                                        object:nil
                                                      userInfo:dictInfo];
}

- (void) setPension:(float)pension {
    _pension = pension;
    
    NSDictionary* dictInfo = @{GovernmentPensionUserInfoKey : [NSNumber numberWithFloat:pension]};
    
    [[NSNotificationCenter defaultCenter] postNotificationName:GovernmentPensionDidChangeNotification
                                                        object:nil
                                                      userInfo:dictInfo];
}

- (void) setAveragePrice:(float)averagePrice {
    _averagePrice = averagePrice;
    
    NSDictionary* dictInfo = @{GovernmentAveragePriceUserInfoKey : [NSNumber numberWithFloat:averagePrice]};
    
    [[NSNotificationCenter defaultCenter] postNotificationName:GovernmentAveragePriceDidChangeNotification
                                                        object:nil
                                                      userInfo:dictInfo];
}


@end
