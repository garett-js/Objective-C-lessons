//
//  Runners.h
//  HomeworkProtocols
//
//  Created by Роман Сергиенко on 13.11.16.
//  Copyright © 2016 ig. All rights reserved.
//

@protocol Runners <NSObject>

@required
@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) float runSpeed;

- (void) run;

@optional
- (void) drinkWater;

@end
