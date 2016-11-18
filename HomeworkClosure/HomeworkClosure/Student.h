//
//  Student.h
//  HomeworkClosure
//
//  Created by Роман Сергиенко on 18.11.16.
//  Copyright © 2016 ig. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* lastName;

- (instancetype)initWithName:(NSString*)name lastName:(NSString*)lastName;

@end
