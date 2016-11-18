//
//  ClosureTest.h
//  HomeworkClosure
//
//  Created by Роман Сергиенко on 18.11.16.
//  Copyright © 2016 ig. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^Closure)(void);
typedef NSString* (^ClosureIntToStr)(NSInteger);
typedef NSString* (^ClosureStr)(void);

@interface ClosureTest : NSObject

@property (copy, nonatomic) Closure closure;
@property (copy, nonatomic) ClosureIntToStr closureIntToStr;
@property (copy, nonatomic) ClosureStr closureStr;

- (void) methodForClosure:(ClosureStr)closure;

@end
