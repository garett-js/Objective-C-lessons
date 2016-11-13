//
//  main.m
//  HomeworkProtocols
//
//  Created by Роман Сергиенко on 13.11.16.
//  Copyright © 2016 ig. All rights reserved.
//

//1. Реализуйте протоколы Jumpers, Swimmers, Runners. Каждый протокол должен иметь
// пару свойств, например скорость или максимальная высота прыжка и пару методов,
// например прыгать или плыть, нырять и тд. Включите фантазию!!!
//
//2. Часть методов делайте обязательными (например у пловцов обязательный метод это
// плыть а у бегунов - бежать, логично?), а другую часть не обязательными.
//
//3. Используйте классы из задания про массивы, там где у вас люди и животные.
// Например у кенгуру и у особых спортсменов реализуйте протокол Jumpers, тоже самое
// с другими протоколами. Пусть каждый протокол будет реализован как некоторыми
// классами животных, так и некоторыми классами людей.
//
//4. Положите всех в одни массив. Тех кто прыгает заставьте прыгать и рассказывать
// про свои свойства. Причем у некоторых объектов пусть будут одни необязательные
// свойства или методы, а у других другие. Тот кто бегает пусть бегает, а тот кто
// плавает, пусть плавает. Тот кто ничего не делает должен быть выведен на экран как
// лодырь :)
//
//5. Сделайте так чтобы один какой-то класс мог и бегать и прыгать и плавать и
// посмотрите как он себя поведет в цикле.


#import <Foundation/Foundation.h>
#import "Cat.h"
#import "Kenguru.h"
#import "Runner.h"
#import "Swimmer.h"
#import "Programmer.h"
#import "Superman.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Cat* cat = [[Cat alloc] init];
        Kenguru* kenguru = [[Kenguru alloc] init];
        Runner* runner = [[Runner alloc] init];
        Swimmer* swimmer = [[Swimmer alloc] init];
        Programmer* programmer = [[Programmer alloc] init];
        Superman* superman = [[Superman alloc] init];
        
        cat.name = @"KuroNeko";
        cat.runSpeed = 10.f;
        
        kenguru.name = @"Mr.Bob";
        kenguru.jumpHeight = 4.f;
        
        runner.name = @"Bolt";
        runner.runSpeed = 20.f;
        
        swimmer.name = @"Felps";
        swimmer.swimSpeed = 25.f;
        
        superman.name = @"Klark Kent";
        superman.runSpeed = 100500.f;
        superman.swimSpeed = 100500.f;
        superman.jumpHeight = 100500.f;
        
        programmer.name = @"Jhon";
        
        NSArray* strangeСreatures = @[cat, kenguru, runner, swimmer, programmer, superman];
        for (id<Runners, Swimmers, Jumpers> object in strangeСreatures) {
            if ([object conformsToProtocol:@protocol(Runners)]) {
                [object run];
                NSLog(@"name:%@, speed:%f",object.name, object.runSpeed);
                if ([object respondsToSelector:@selector(drinkWater)]) {
                    [object drinkWater];
                }
            }
            if ([object conformsToProtocol:@protocol(Swimmers)]) {
                [object swim];
                NSLog(@"name:%@, speed: %f",object.name, object.swimSpeed);
                if ([object respondsToSelector:@selector(walk)]) {
                    [object walk];
                }
            }
            if ([object conformsToProtocol:@protocol(Jumpers)]) {
                [object jump];
                NSLog(@"name:%@, height:%f",object.name, object.jumpHeight);
                if ([object respondsToSelector:@selector(sleep)]) {
                    [object sleep];
                }
            }
            
            if (![object conformsToProtocol:@protocol(Jumpers)] &&
                ![object conformsToProtocol:@protocol(Runners)] &&
                ![object conformsToProtocol:@protocol(Swimmers)]) {
                
                NSLog(@"%@ Лодырь! =)",[object class]);
            }
            
            
        }
        
    }
    return 0;
}





