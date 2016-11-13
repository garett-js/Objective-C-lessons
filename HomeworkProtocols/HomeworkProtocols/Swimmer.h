//
//  Swimmer.h
//  HomeWorkArrays
//
//  Created by Роман Сергиенко on 09.11.16.
//  Copyright © 2016 ig. All rights reserved.
//

#import "Human.h"
#import "Swimmers.h"

@interface Swimmer : Human <Swimmers>
@property (assign, nonatomic) float swimSpeed;

@end
