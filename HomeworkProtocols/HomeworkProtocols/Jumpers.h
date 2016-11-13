//
//  Jumpers.h
//  HomeworkProtocols
//
//  Created by Роман Сергиенко on 13.11.16.
//  Copyright © 2016 ig. All rights reserved.
//

@protocol Jumpers <NSObject>

@required
@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) float jumpHeight;

- (void) jump;

@optional
- (void) sleep;


@end

