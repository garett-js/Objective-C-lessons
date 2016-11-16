//
//  Businessman.m
//  HomeworkNotifications
//
//  Created by Роман Сергиенко on 16.11.16.
//  Copyright © 2016 ig. All rights reserved.
//

#import "Businessman.h"
#import "Government.h"

@implementation Businessman

#pragma mark - Initialization
- (instancetype)init
{
    self = [super init];
    if (self) {
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
}

- (void) averagePriceChangeNotification:(NSNotification*)notification {
    NSLog(@"Businessman > averagePriceChangeNotification userInfo:%@", notification.userInfo);
}


@end
