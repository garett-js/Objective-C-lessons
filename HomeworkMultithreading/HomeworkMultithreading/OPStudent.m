//
//  OPStudent.m
//  HomeworkMultithreading
//
//  Created by Роман Сергиенко on 22.11.16.
//  Copyright © 2016 ig. All rights reserved.
//

#import "OPStudent.h"
#import <UIKit/UIKit.h>

@implementation OPStudent

+ (NSOperationQueue*)sharedOperationQueue {
    static NSOperationQueue *operationQueue;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        operationQueue = [NSOperationQueue new];
    });
    return operationQueue;
}

- (instancetype)initWithName:(NSString*)name {
    self = [super init];
    if (self) {
        self.name = name;
    }
    return self;
}

- (void) guessAnswer:(int)randomNumber range:(int)range resultBlock:(ResultBlockType)block {
    NSOperationQueue* queue = [OPStudent sharedOperationQueue];
    
    [queue addOperationWithBlock:^{
        double startTime = CACurrentMediaTime();
        
        NSInteger studentAnswer;
        do {
            studentAnswer = arc4random_uniform(range);
        } while (studentAnswer != randomNumber);
        
        __weak OPStudent* weakSelf = self;
        block(weakSelf.name, CACurrentMediaTime() - startTime);
    }];
}

@end
