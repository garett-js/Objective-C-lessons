//
//  Student.h
//  Dictionary
//
//  Created by Роман Сергиенко on 13.11.16.
//  Copyright © 2016 ig. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Student : NSObject
@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* lastName;
@property (strong, nonatomic) NSString* helloPhrase;

- (instancetype)initWithName:(NSString*)name andLastName:(NSString*)lastName andHelloPhrase:(NSString*)helloPhrase;

@end
