//
//  MyAppDelegate.m
//  HomeworkNotifications
//
//  Created by Роман Сергиенко on 16.11.16.
//  Copyright © 2016 ig. All rights reserved.
//

#import "MyAppDelegate.h"
#import "AppDelegate.h"

@implementation MyAppDelegate

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(DidEnterBackgroundNotification:)
                                                     name:UIApplicationDidEnterBackgroundNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(WillEnterForegroundNotification:)
                                                     name:UIApplicationWillEnterForegroundNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(DidFinishLaunchingNotification:)
                                                     name:UIApplicationDidFinishLaunchingNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(WillResignActiveNotification:)
                                                     name:UIApplicationWillResignActiveNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(DidBecomeActiveNotification:)
                                                     name:UIApplicationDidBecomeActiveNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(WillTerminateNotification:)
                                                     name:UIApplicationWillTerminateNotification
                                                   object:nil];
        
    }
    return self;
}

#pragma mark - Notifications

- (void) DidEnterBackgroundNotification:(NSNotification *)notification {
    NSLog(@"MyappDelegate DidEnterBackgroundNotification");
}

- (void) WillEnterForegroundNotification:(NSNotification *)notification {
    NSLog(@"MyappDelegate WillEnterForegroundNotification");
}

- (void) DidFinishLaunchingNotification:(NSNotification *)notification {
    NSLog(@"MyappDelegate DidFinishLaunchingNotification");
}

- (void) WillResignActiveNotification:(NSNotification *)notification {
    NSLog(@"MyappDelegate WillResignActiveNotification");
}

- (void) DidBecomeActiveNotification:(NSNotification *)notification {
    NSLog(@"MyappDelegate DidBecomeActiveNotification");
}

- (void) WillTerminateNotification:(NSNotification *)notification {
    NSLog(@"MyappDelegate WillTerminateNotification");
}

@end
