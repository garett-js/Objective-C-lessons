//
//  AppDelegate.m
//  HomeworkNotifications
//
//  Created by Роман Сергиенко on 16.11.16.
//  Copyright © 2016 ig. All rights reserved.
//

#import "AppDelegate.h"
#import "MyAppDelegate.h"
#import "Government.h"
#import "Doctor.h"
#import "Pensioner.h"
#import "Businessman.h"

@interface AppDelegate ()
@property (strong, nonatomic) Government* government;
@property (strong, nonatomic) Businessman* businessman;
@property (strong, nonatomic) Doctor* doctor;
@property (strong, nonatomic) Pensioner* pensioner;
@property (strong, nonatomic) MyAppDelegate* myAppDelegate;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.government = [[Government alloc] init];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(governmentNotification:)
                                                 name:GovernmentTaxLevelDidChangeNotification
                                               object:nil];
    
    
    self.businessman = [Businessman new];
    self.businessman.name = @"Tramp";
    
    self.doctor = [Doctor new];
    self.doctor.name = @"House";
    
    self.pensioner = [Pensioner new];
    self.pensioner.name = @"Jhon";
    
    
    self.government.taxLevel = 5.5f;
    self.government.salary = 1100.f;
    self.government.pension = 550.f;
    self.government.averagePrice = 15.f;
    
    self.government.salary = 600.f;
    self.government.pension = 2000.f;
    
    
    self.myAppDelegate = [MyAppDelegate new];
    
    NSLog(@"TRUE AppDelegate next");
    
    return YES;
}

- (void) governmentNotification:(NSNotification*)notification {
    NSLog(@"governmentNotification userInfo:%@", notification.userInfo);
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
