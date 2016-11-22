//
//  AppDelegate.m
//  HomeworkMultithreading
//
//  Created by Роман Сергиенко on 20.11.16.
//  Copyright © 2016 ig. All rights reserved.
//

#import "AppDelegate.h"
#import "Student.h"
#import "OPStudent.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // *** PUPIL ***
    NSArray* students = @[[[Student alloc] initWithName:@"Student1"],
                          [[Student alloc] initWithName:@"Student2"],
                          [[Student alloc] initWithName:@"Student3"],
                          [[Student alloc] initWithName:@"Student4"],
                          [[Student alloc] initWithName:@"Student5"]];
    
    for (Student* value in students) { [value guessAnswer:25 range:100]; }
    
    // *** STUDENT MASTER ***
    for (Student* value in students) { [value guessAnswer:25 range:100 resultBlock:^(NSString *name, double time) {
        NSLog(@"student: %@, time:%f", name, time);
    }]; }
    
    // *** STUDENT SUPERMAN ***
    NSArray* students2 = @[[[OPStudent alloc] initWithName:@"Student1"],
                          [[OPStudent alloc] initWithName:@"Student2"],
                          [[OPStudent alloc] initWithName:@"Student3"],
                          [[OPStudent alloc] initWithName:@"Student4"],
                          [[OPStudent alloc] initWithName:@"Student5"]];
    
    for (OPStudent* value in students2) { [value guessAnswer:25 range:100 resultBlock:^(NSString *name, double time) {
        NSLog(@"student2: %@, time:%f", name, time);
    }]; }
    
    
    
    // Not homework
//    NSLog(@"dispatch_barrier_async");
//    dispatch_queue_t queue = dispatch_queue_create("com.ig.HomeworkMultithreading.queue", DISPATCH_QUEUE_CONCURRENT);
//    
//    void(^block_read)() = ^{
//        sleep(1+rand()%3);
//        NSLog(@"Write!");
//        sleep(1+rand()%3);
//    };
//    void(^block_write)() = ^{
//        sleep(1+rand()%3);
//        NSLog(@"Read!");
//        sleep(1+rand()%3);
//    };
//    
//    dispatch_async(queue, block_write);
//    dispatch_async(queue, block_write);
//    dispatch_async(queue, block_write);
//    dispatch_async(queue, block_write);
//    
//    dispatch_barrier_async(queue, block_read);
//    
//    dispatch_async(queue, block_write);
//    dispatch_async(queue, block_write);
//    dispatch_async(queue, block_write);
//    dispatch_async(queue, block_write);


    
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
