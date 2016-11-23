//
//  Student.m
//  HomeworkBits
//
//  Created by Роман Сергиенко on 23.11.16.
//  Copyright © 2016 ig. All rights reserved.
//

#import "Student.h"

@implementation Student

- (NSString*) answerByType:(StudentSubjectType)type {
    return self.subjectType & type ? @"Yes" : @"no";
}
- (NSString*) description {
    return [NSString stringWithFormat:@"Student studies:"
            "Math:%@ "
            "Development:%@ "
            "Biology:%@ "
            "Engineering:%@ "
            "Psychology:%@ "
            "Art:%@ "
            "Anatomy:%@ ",
            [self answerByType:StudentSubjectTypeMath],
            [self answerByType:StudentSubjectTypeDevelopment],
            [self answerByType:StudentSubjectTypeBiology],
            [self answerByType:StudentSubjectTypeEngineering],
            [self answerByType:StudentSubjectTypePsychology],
            [self answerByType:StudentSubjectTypeArt],
            [self answerByType:StudentSubjectTypeAnatomy]];
}


@end
