//
//  Student.m
//  HomeworkMultithreading
//
//  Created by Роман Сергиенко on 20.11.16.
//  Copyright © 2016 ig. All rights reserved.
//

#import "Student.h"
#import <UIKit/UIKit.h>



@implementation Student

// Вот так вот работает потокбезопасный синглтон в Objective-C
// Static method (Singleton) for a Master part
+ (dispatch_queue_t)sharedQueue {
    static dispatch_queue_t queue;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        queue = dispatch_queue_create("com.ig.HomeworkMultithreading.queue", DISPATCH_QUEUE_CONCURRENT);
    });
    return queue;
}

- (instancetype)initWithName:(NSString*)name {
    self = [super init];
    if (self) {
        self.name = name;
    }
    return self;
}

// method for a PUPIL part
- (void) guessAnswer:(int)randomNumber range:(int)range {
    
    //dispatch_queue_t queue = dispatch_queue_create("com.ig.HomeworkMultithreading.queue", DISPATCH_QUEUE_CONCURRENT);
    
    //Блок кода выполняется на фоне
    dispatch_async([Student sharedQueue], ^{
        double startTime = CACurrentMediaTime();
        
        NSInteger studentAnswer;
        do {
            studentAnswer = arc4random_uniform(range);
        } while (studentAnswer != randomNumber);
        
        __weak Student* weakSelf = self;
        
        NSLog(@"Student name:%@, guess number:%ld, time:%f",
              weakSelf.name, (long)studentAnswer, CACurrentMediaTime() - startTime);
    });
}

// method for a STUDENT part
- (void) guessAnswer:(int)randomNumber range:(int)range resultBlock:(ResultBlockType)block {
    
    //dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    //Блок кода выполняется на фоне
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        double startTime = CACurrentMediaTime();
        
        NSInteger studentAnswer;
        do {
            studentAnswer = arc4random_uniform(range);
        } while (studentAnswer != randomNumber);
        
        // !Разобраться с этим, не понимаю как работает ...
        
        //Блок кода выполняется на главном потоке
        dispatch_async(dispatch_get_main_queue(), ^{
            __weak Student* weakSelf = self;
            block(weakSelf.name, CACurrentMediaTime() - startTime);
        });
    });
}

@end
