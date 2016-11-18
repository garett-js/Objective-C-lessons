//
//  Patient.h
//  HomeworkClosure
//
//  Created by Роман Сергиенко on 18.11.16.
//  Copyright © 2016 ig. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    head,
    leg,
    arm,
    teeth
} PartOfTheBody;

@interface Patient : NSObject
@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) float temperature;
@property (assign, nonatomic) BOOL headache;

- (instancetype)initWithName:(NSString*)name temprature:(float)temp headache:(float)headache;
- (void) feelsBadWith:(void (^)(Patient*))closureDoc;
- (void) takePill;
- (void) makeShot;

@end
