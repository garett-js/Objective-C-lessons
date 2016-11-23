//
//  Student.h
//  HomeworkBits
//
//  Created by Роман Сергиенко on 23.11.16.
//  Copyright © 2016 ig. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    
    StudentSubjectTypeMath          = 1 << 0, // 2**0 = 1
    StudentSubjectTypeDevelopment   = 1 << 1, // 2**1 = 2
    StudentSubjectTypeBiology       = 1 << 2, // 2**2 = 4
    StudentSubjectTypeEngineering   = 1 << 3, // 2**3 = 8
    StudentSubjectTypePsychology    = 1 << 4, // 2**4 = 16
    StudentSubjectTypeArt           = 1 << 5, // 2**5 = 32
    StudentSubjectTypeAnatomy       = 1 << 6, // 2**6 = 64
    
    
    
} StudentSubjectType;

@interface Student : NSObject
@property (assign, nonatomic) StudentSubjectType subjectType;

@end
