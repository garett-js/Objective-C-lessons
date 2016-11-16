//
//  Pensioner.m
//  HomeworkNotifications
//
//  Created by Роман Сергиенко on 16.11.16.
//  Copyright © 2016 ig. All rights reserved.
//

#import "Pensioner.h"
#import "Government.h"

@implementation Pensioner

#pragma mark - Initialization
- (instancetype)init
{
    self = [super init];
    if (self) {
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
}

- (void) averagePriceChangeNotification:(NSNotification*)notification {
    NSLog(@"Pensioner > averagePriceChangeNotification userInfo:%@", notification.userInfo);
}


@end
