//
//  main.m
//  Dictionary
//
//  Created by Роман Сергиенко on 13.11.16.
//  Copyright © 2016 ig. All rights reserved.
//
//Урок номер 8. NSDictionary
//Уровень Ученик
//
//1. Создайте класс студент со свойствами имя, фамилия и фраза приветствия.
//2. Создайте 10 - 15 объектов этого класса.
//3. Теперь мы создадим дикшинари типо школьный журнал, где ключ будет фамилия + имя, а значение сам студент.
//4. Распечатайте дикшинари
//
//Уровень Студент.
//
//4. В цикле пройдемся по всем ключам в дикшинари и распечатаем имя и фамилию каждого студента + его фразу приветствия.
//
//Уровень Мастер.
//
//5. Чтобы сделать тоже самое но по какому-то порядку, отсортируйте массив ключей по возрастанию и выведите приветствие каждого студента из дикшинари, но уже по отсортированному списку.

#import <Foundation/Foundation.h>
#import "Student.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Student* student1 = [[Student alloc] initWithName:@"Alex" andLastName:@"Petrenko" andHelloPhrase:@"Hi"];
        Student* student2 = [[Student alloc] initWithName:@"Vasya" andLastName:@"Doge" andHelloPhrase:@"Hi all"];
        Student* student3 = [[Student alloc] initWithName:@"Misha" andLastName:@"Cool" andHelloPhrase:@"Ohayo"];
        Student* student4 = [[Student alloc] initWithName:@"Denis" andLastName:@"Medved" andHelloPhrase:@"Hello"];
        Student* student5 = [[Student alloc] initWithName:@"Roma" andLastName:@"Serg" andHelloPhrase:@"What's up"];
        
    
        NSDictionary* classDictionary = @{[student1.name stringByAppendingString:student1.lastName] : student1,
                                          [student2.name stringByAppendingString:student2.lastName] : student2,
                                          [student3.name stringByAppendingString:student3.lastName] : student3,
                                          [student4.name stringByAppendingString:student4.lastName] : student4,
                                          [student5.name stringByAppendingString:student5.lastName] : student5,};
        
        for (NSString* key in classDictionary) {
            NSLog(@"%@, my name is %@ %@",
                  [classDictionary[key] helloPhrase],
                  [classDictionary[key] name],
                  [classDictionary[key] lastName]);
        }
        

        NSArray* sortedKeysInClassDictionary =
        [classDictionary keysSortedByValueUsingComparator: ^(id obj1, id obj2) {
            return [[obj1 name] compare:[obj2 name]];
        }];
        
        
        for (NSString* value in sortedKeysInClassDictionary) {
            NSLog(@"%@", [classDictionary[value] helloPhrase]);
        }
    }
    return 0;
}
