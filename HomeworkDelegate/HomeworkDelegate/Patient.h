//
//  Patient.h
//  HomeworkDelegate
//
//  Created by Роман Сергиенко on 15.11.16.
//  Copyright © 2016 ig. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum {
    head,
    leg,
    arm,
    teeth
} PartOfTheBody;

typedef enum {
    like,
    dislike
} Feedback;

@protocol PatientDelegate;

@interface Patient : NSObject
@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) float temperature;
@property (assign, nonatomic) BOOL headache;
@property (assign, nonatomic) Feedback feedBack;
@property (weak, nonatomic) id<PatientDelegate> delegate;

- (instancetype)initWithName:(NSString*)name temprature:(float)temp headache:(float)headache;
- (void) feelsBadWith:(PartOfTheBody)part;
- (void) feelsBad;
- (void) takePill;
- (void) makeShot;
- (void) sleep;
@end

@protocol PatientDelegate <NSObject>

@optional
- (void) patient:(Patient*)patient somethingWith:(PartOfTheBody)part;
- (void) patientFeelsBad:(Patient*)patient;
@end
