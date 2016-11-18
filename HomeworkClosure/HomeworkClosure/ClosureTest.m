//
//  ClosureTest.m
//  HomeworkClosure
//
//  Created by Роман Сергиенко on 18.11.16.
//  Copyright © 2016 ig. All rights reserved.
//

#import "ClosureTest.h"
#import "Patient.h"

@interface ClosureTest ()
@property (strong, nonatomic) NSArray* patiens;
@end

@implementation ClosureTest

- (void) methodForClosure:(ClosureStr)closure {
    NSLog(@"invoke closure: %@", closure());
}

@end
