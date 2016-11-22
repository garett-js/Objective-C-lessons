//
//  Student.h
//  HomeworkMultithreading
//
//  Created by Роман Сергиенко on 20.11.16.
//  Copyright © 2016 ig. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ResultBlockType)(NSString*, double);

@interface Student : NSObject
@property (strong, nonatomic) NSString* name;

- (instancetype)initWithName:(NSString*)name;
- (void) guessAnswer:(int)randomNumber range:(int)range;
- (void) guessAnswer:(int)randomNumber range:(int)range resultBlock:(ResultBlockType)block;
@end
