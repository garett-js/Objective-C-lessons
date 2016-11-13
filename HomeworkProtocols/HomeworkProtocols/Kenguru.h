//
//  Kenguru.h
//  HomeWorkArrays
//
//  Created by Роман Сергиенко on 09.11.16.
//  Copyright © 2016 ig. All rights reserved.
//

#import "Animal.h"
#import "Jumpers.h"

@interface Kenguru : Animal <Jumpers>
@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) float jumpHeight;

@end
