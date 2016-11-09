//
//  Human.h
//  HomeWorkArrays
//
//  Created by Роман Сергиенко on 09.11.16.
//  Copyright © 2016 ig. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Human : NSObject

typedef enum GenderType : NSUInteger {
    male,
    female
} GenderType;

@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) float weight;
@property (assign, nonatomic) float height;
@property (assign, nonatomic) GenderType gender;

- (void) move;

@end
