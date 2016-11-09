//
//  main.m
//  HomeWorkArrays
//
//  Created by Роман Сергиенко on 09.11.16.
//  Copyright © 2016 ig. All rights reserved.
//
//
//Урок номер 5. Массивы
//
//Уровень ученик:
//(просто повторение того что увидел)
//
//1. Создать класс "человек", который будет содержать в себе базовые качества - "имя", "рост", "вес", "пол", а также будет иметь метод "передвижение".
//2. Создать дочерние классы (наследники) "велосипедист", "бегун", "пловец" и переопределить метод "передвижение" в каждом из этих классов.
//3. При старте программы создать по одному объекту каждого класса и объединить их в массив.
//4. В цикле пройти по всем элементам массива и вывести на экран все характеристики каждого объекта (имя, рост и тд) и у каждого вызвать метод "передвижение".
//


//Если получилось пройти уровень ученик, то можно попробовать уровень студент:
//(небольшая импровизация + дополнительная мозговая деятельность)
//
//5. Создать еще одного наследника от класса человек, добавить в него пару новых свойств, добавить в массив и в цикле вывода вывести его свойства как дополнение к свойствам человека
//6. Метод "передвижение" реализовать таким образом, чтобы перед тем как выполнить свое собственное передвижение, он выполнял передвижение реализованное в классе человек
//7. Массив выводить в обратном порядке.
//


//Уровень Мастер:
//(простор для фантазии + больше мозговой деятельности + больше практики)
//
//8. Создать класс "животное" (не наследник класса человек!) со своими собственными базовыми свойствами (отличными от человеческих) и методом "передвижение".
//9. Унаследоваться от него и создать пару других классов с переопределенным передвижением.
//10. Объединить всех людей и животных в один массив.
//11. В цикле выводить тип объекта (человек или животное) перед тем как выводить его свойства и вызывать метод
//

//Уровень Звезда:
//(разобраться с тем чего Леша не объяснял! + реальная задача!)
//
//12. Поместить всех людей в один массив, а животных в другой массив (количество людей и животных должно быть разное)
//13. В одном цикле выводить сначала человека а потом животное, доставая данные поочередно из двух разных массивов, если в одном из массивов объектов больше, то в конце должны выводиться только объекты этого массива (так как других уже нет)
//
//Уровень Супермен!
//(кодинг за гранью возможного! + вероятность успеха практически 0! + реальный вызов!)
//
//14. Соединить животных и людей в одном массиве.
//15. Используя нужный метод класса NSArray отсортировать массив (как результат будет другой массив).
//16. Сортировать так: сначала люди, а потом животные, люди отсортированы по имени, а животные по кличкам
//17. Реально требует разобраться с сортировкой самому, тяжело, но достойно уважения

#import <Foundation/Foundation.h>
#import "Human.h"
#import "Runner.h"
#import "Swimmer.h"
#import "Cyclist.h"
#import "Programmer.h"
#import "Animal.h"
#import "Cat.h"
#import "Dog.h"
#import "Kenguru.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Human* man = [[Human alloc] init];
        Runner* runner = [[Runner alloc] init];
        Swimmer* swimmer = [[Swimmer alloc] init];
        Cyclist* cyclist = [[Cyclist alloc] init];
        
        runner.name = @"Bolt";
        runner.weight = 80.f;
        runner.height = 190.f;
        runner.gender = male;
        
        swimmer.name = @"Felps";
        swimmer.weight = 95.f;
        swimmer.height = 185.f;
        swimmer.gender = male;
        
        cyclist.name = @"Alex";
        cyclist.weight = 65.f;
        cyclist.height = 175.f;
        cyclist.gender = female;
        
        // for a student part
        Programmer* programmer = [[Programmer alloc] init];
        programmer.name = @"Jhon";
        programmer.weight = 70.f;
        programmer.height = 180.f;
        programmer.gender = male;
        programmer.cupsOfCoffeeToTheDay = 10;
        
        // for a master part
        Animal* animal = [[Animal alloc] init];
        Dog* dog = [[Dog alloc] init];
        Cat* cat = [[Cat alloc] init];
        Kenguru* kenguru = [[Kenguru alloc] init];
        
        dog.nickname = @"Artemon";
        cat.nickname = @"Murka";
        kenguru.nickname = @"Mr.Bob";
        
        // for a student part
        NSArray* sportsmans = @[man, runner, swimmer, cyclist, programmer];
        NSArray* reversedArrayOfSportsmans = [[sportsmans reverseObjectEnumerator] allObjects];
        
        for (Human* man in reversedArrayOfSportsmans) {
            NSString* gender = ( man.gender == 0 ) ? @"male" : @"female";
            
            NSLog(@"name: %@, height:%f, weight:%f, gender:%@",
                  man.name, man.weight, man.height, gender);
            if ([man isKindOfClass:[Programmer class]]) {
                Programmer* coder = (Programmer*)man;
                NSLog(@"Cups of Coffee to the day: %i", coder.cupsOfCoffeeToTheDay);
            }
            
            [man move];
            NSLog(@"==========================================================");
        }
        
        // for a master part
        NSArray* animalsAndHumansTogether = @[animal, dog, cat,kenguru,
                                              man, runner, swimmer, cyclist, programmer];
        
        for (id value in animalsAndHumansTogether) {
            if ([value isKindOfClass:[Animal class]]) {
                Animal* animal = (Animal*)value;
                NSLog(@"%@",[Animal class]);
                NSLog(@"Nickname: %@", animal.nickname);
                [animal move];
                NSLog(@"++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
            }
            if ([value isKindOfClass:[Human class]]) {
                Human* human = (Human*)value;
                NSLog(@"%@",[Human class]);
                
                NSString* gender = ( human.gender == 0 ) ? @"male" : @"female";
                
                NSLog(@"name: %@, height:%f, weight:%f, gender:%@",
                      human.name, human.weight, human.height, gender);
                
                if ([human isKindOfClass:[Programmer class]]) {
                    Programmer* coder = (Programmer*)human;
                    NSLog(@"Cups of Coffee to the day: %i", coder.cupsOfCoffeeToTheDay);
                }
                
                [human move];
                
                NSLog(@"++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
            }
        }
        
        //for a star part
        NSArray* humans = @[man, runner, swimmer, cyclist, programmer];
        NSArray* animals = @[dog, cat,kenguru];
        
        NSUInteger count = humans.count + animals.count;
        
        for (int index = 0; index <  count; index++) {
            if ( index < humans.count ) {
                Human* human = [humans objectAtIndex:index];
                NSLog(@"%@: %@",human.name, human.superclass);
                NSLog(@"-----------------------------------------------------------");
            }
            if ( index < animals.count ) {
                Animal* animal = [animals objectAtIndex:index];
                NSLog(@"%@: %@", animal.nickname, animal.superclass);
                NSLog(@"-----------------------------------------------------------");
            }
        }
        
        
        // for a superman part
        NSArray *sortedArray;
        sortedArray = [animalsAndHumansTogether sortedArrayUsingComparator:^NSComparisonResult(id object1, id object2) {
            if ( [object1 isKindOfClass:[Animal class]] && [object2 isKindOfClass:[Animal class]] ) {
                return [[(Animal*)object1 nickname] compare:[(Animal*)object2 nickname]];
            } else if ( [object1 isKindOfClass:[Human class]] && [object2 isKindOfClass:[Human class]] ) {
                return [[(Human*)object1 name] compare:[(Human*)object2 name]];
            } else if ([object1 isKindOfClass:[Human class]]) {
                return NSOrderedAscending;
            } else {
                return NSOrderedDescending;
            }
        }];
        
        for (id value in sortedArray) {
            if ([value isKindOfClass:[Animal class]]) {
                Animal* animal = (Animal*)value;
                NSLog(@"%@", animal.nickname);
            }
            if ([value isKindOfClass:[Human class]]) {
                Human* human = (Human*)value;
                NSLog(@"%@",human.name);
            }
        }

        
    }
    return 0;
}






























