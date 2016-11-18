//
//  AppDelegate.m
//  HomeworkClosureSuperman
//
//  Created by Роман Сергиенко on 18.11.16.
//  Copyright © 2016 ig. All rights reserved.
//

#import "AppDelegate.h"
#import "Patient.h"

@interface AppDelegate ()
@property (strong, nonatomic) NSArray* patients;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    Patient* patient1 = [[Patient alloc] initWithName:@"Alex" temprature:39.f headache:true];
    Patient* patient2 = [[Patient alloc] initWithName:@"Jshon" temprature:36.1f headache:true];
    Patient* patient3 = [[Patient alloc] initWithName:@"Dasha" temprature:37.2f headache:true];
    Patient* patient4 = [[Patient alloc] initWithName:@"Masha" temprature:38.3f headache:true];
    Patient* patient5 = [[Patient alloc] initWithName:@"Dima" temprature:41.1f headache:true];
    
    self.patients = @[patient1,patient2,patient3,patient4,patient5];
    return YES;
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
