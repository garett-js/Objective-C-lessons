//
//  main.m
//  HomeworkBits
//
//  Created by Роман Сергиенко on 23.11.16.
//  Copyright © 2016 ig. All rights reserved.
//

//Урок номер 15. Битовые операции
//Это довольно нужный материал, так что надо попрактиковаться хорошенько.

#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        //Ученик.
        //1. Cоздайте класс студент с соответствующим набором предметов
        //2. В цикле создайте 10 студентов и добавьте их в массив. Используйте мутабл массив
        //3. У каждого рандомно установите предметы
        NSLog(@"*** PUPIL ***");
        NSMutableArray* students = [NSMutableArray array];
        for (int i=0; i<10; i++) {
            Student* student = [Student new];
            student.subjectType = arc4random_uniform(127);
            [students addObject:student];
        }
        NSLog(@"%@",students);
        
        //Студент
        //4. В новом цикле пройдитесь по студентам и разделите их уже на два массива - технари и гуманитарии.
        //5. Также посчитайте количество тех кто учит программирование
        NSLog(@"*** STUDENT ***");
        NSMutableArray* techies = [NSMutableArray array];
        NSMutableArray* humanStudies = [NSMutableArray array];
        
        int countDeveloper = 0;
        
        for (Student* student in students) {
            if (student.subjectType & (StudentSubjectTypeEngineering | StudentSubjectTypeMath | StudentSubjectTypeDevelopment) ) {
                [techies addObject:student];
            } else {
                [humanStudies addObject:student];
            }
            if (student.subjectType & StudentSubjectTypeDevelopment) {
                countDeveloper += 1;
            }
        }
        
        NSLog(@"Технари:%@",techies);
        NSLog(@"Гуманитрии:%@",humanStudies);
        NSLog(@"Будущих программистов:%d",countDeveloper);
        
        //Мастер.
        //6. Если студенты выбрали биологию, то отмените ее у них и выведите сообщение в лог, предмет отменен
        //7. Тут придется разобраться как сбросить бит, включите логику :)
        NSLog(@"*** MASTER ***");
        for (Student* student in students) {
            if (student.subjectType & StudentSubjectTypeBiology) {
                student.subjectType &= ~StudentSubjectTypeBiology;
            }
        }
        NSLog(@"!!! -> %@",students);
        
        //Супермен.
        //8. Сгенерируйте случайный интежер в диапазоне от 0 до максимума.
        //9. Используя цикл и битовые операции (и возможно NSMutableString) выведите это число на экран в двоичном виде
        NSLog(@"*** SUPERMAN ***");
        int randomInteger = arc4random_uniform(INT_MAX);
        NSMutableArray* result = [NSMutableArray array];
        
        for (int i = 0; i < 32; i++) {
            if (randomInteger & (1 << i)) {
                [result addObject:@"1"];
            } else {
                [result addObject:@"0"];
            }
        }
        NSArray* reversedArray = [[result reverseObjectEnumerator] allObjects];
        NSLog(@"%d -2> %@",randomInteger,[reversedArray componentsJoinedByString:@""]);
        
    }
    return 0;
}
