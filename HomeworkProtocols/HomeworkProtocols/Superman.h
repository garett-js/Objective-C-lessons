//
//  Superman.h
//  HomeworkProtocols
//
//  Created by Роман Сергиенко on 13.11.16.
//  Copyright © 2016 ig. All rights reserved.
//

#import "Human.h"
#import "Runners.h"
#import "Jumpers.h"
#import "Swimmers.h"

@interface Superman : Human <Runners, Swimmers, Jumpers>
@property (assign, nonatomic) float runSpeed;
@property (assign, nonatomic) float swimSpeed;
@property (assign, nonatomic) float jumpHeight;

@end
