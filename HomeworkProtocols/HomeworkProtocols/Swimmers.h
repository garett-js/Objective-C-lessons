//
//  Swimmers.h
//  HomeworkProtocols
//
//  Created by Роман Сергиенко on 13.11.16.
//  Copyright © 2016 ig. All rights reserved.
//

@protocol Swimmers <NSObject>

@required
@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) float swimSpeed;

- (void) swim;

@optional
- (void) walk;

@end
