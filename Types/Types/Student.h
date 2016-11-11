//
//  Student.h
//  Types
//
//  Created by Роман Сергиенко on 10.11.16.
//  Copyright © 2016 ig. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum {
    blue,
    red,
    black,
    brown,
    green
} enColorEyes;

@interface Student : NSObject
@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) enColorEyes colorEyes;
@end
