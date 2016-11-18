//
//  main.m
//  HomeworkClosure
//
//  Created by Роман Сергиенко on 18.11.16.
//  Copyright © 2016 ig. All rights reserved.
//


//Урок номер 12. Блоки (прим.меня опять они Замыкания по своему назвали XD)

//Ученик.
//1. В апп делегате создайте блок с без возвращаемой переменной и без параметров и вызовите его.
//2. Создайте блоки с параметрами и передайте туда строку, которую выведите на экран в последствии.
//3. Если вы не определили тип данных для ваших блоков, то сделайте это сейчас и используйте их
//4. Создайте метод который принимает блок и вызывает его и вызовите этот метод.

//Студент.
//5. Создайте класс студент с проперти имя и фамилия.
//6. Создайте в аппделегате 10 разных студентов, пусть у парочки будут одинаковые фамилии.
//7. Поместите всех в массив.
//8. Используя соответствующий метод сортировки массива (с блоком) отсортируйте массив студентов сначала по
//   фамилии, а если они одинаковы то по имени.

//Мастер.
//9. Задание из видео. Из урока о делегатах. У пациентов удалите протокол делегат и соответствующее проперти.
//10. Добавьте метод принимающий блок когда им станет плохо.
//11. Блок должен передавать указатель на самого студента ну и на те параметры, которые были в задании по делегатам.
//12. Теперь когда пациентам поплохеет, они должны вызывать блок, а в блоке нужно принимать решения что
//    делать (доктор не нужен делайте все в апп делегате)

//Супермен
//13. Познайте истинное предназначение блоков :) Пусть пациентам становится плохо не тогда когда вы их
//    вызываете в цикле(это убрать), а через случайное время 5-15 секунд после создания (используйте
//    специальный метод из урока по селекторам в ините пациента).
//14. не забудьте массив пациентов сделать проперти аппделегата, а то все помрут по выходе из функции так и не дождавшись :)


#import <Foundation/Foundation.h>
#import "ClosureTest.h"
#import "Student.h"
#import "Patient.h"

typedef void (^ClosureDoc)(Patient*);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        ClosureTest* clr = [ClosureTest new];
        
        // *** Pupil ***
        NSLog(@"*** Pupil ***");
        clr.closure = ^{
            NSLog(@"Simple Closure");
        };
        clr.closure();
        
        clr.closureIntToStr = ^(NSInteger intValue) {
            return [NSString stringWithFormat:@"New string value:%ld from integer", intValue];
        };
        NSLog(@"%@",clr.closureIntToStr(777));
        
        [clr methodForClosure:^{
            return @"Something from closure";
        }];
        
        // *** Student ***
        NSLog(@"*** Student ***");
        Student* student1 = [[Student alloc] initWithName:@"Alex" lastName:@"Shiskin"];
        Student* student2 = [[Student alloc] initWithName:@"Den" lastName:@"Medvedev"];
        Student* student3 = [[Student alloc] initWithName:@"Roma" lastName:@"Vlasov"];
        Student* student4 = [[Student alloc] initWithName:@"Misha" lastName:@"Gorbunov"];
        Student* student5 = [[Student alloc] initWithName:@"Valentin" lastName:@"Sudakov"];
        Student* student6 = [[Student alloc] initWithName:@"Artem" lastName:@"KArtasov"];
        Student* student7 = [[Student alloc] initWithName:@"Dasha" lastName:@"Chalpanova"];
        Student* student8 = [[Student alloc] initWithName:@"Olya" lastName:@"Rekunova"];
        Student* student9 = [[Student alloc] initWithName:@"Varvara" lastName:@"Kapp"];
        Student* student10 = [[Student alloc] initWithName:@"Dasha" lastName:@"Funny"];
        
        NSArray* friends = @[student1,student2,student3,student4,student5,
                             student6,student7,student8,student9,student10];
        
        NSArray* sortedFriendds = [friends sortedArrayUsingComparator:^NSComparisonResult(Student* obj1, Student* obj2) {
            if (obj1.name == obj2.name) {
               return [obj1.lastName compare:obj2.lastName];
            }
            return [obj1.name compare:obj2.name];
        }];
        
        for (Student* value in sortedFriendds) {
            NSLog(@"%@", [value.name stringByAppendingString:value.lastName]);
        }
        
        // *** Master ***
        NSLog(@"*** Master ***");
        Patient* patient1 = [[Patient alloc] initWithName:@"Benedict" temprature:39.2f headache:true];
        Patient* patient2 = [[Patient alloc] initWithName:@"Hobbit" temprature:36.7f headache:true];
    
        ClosureDoc closureDoc = ^(Patient* patient) {
            if (patient.temperature < 38.f && patient.temperature > 36.6f) {
                [patient takePill];
            } else if (patient.temperature > 39.f) {
                [patient makeShot];
            } else {
                NSLog(@"%@ go to sleep", patient.name);
            }
        };
        [patient1 feelsBadWith:closureDoc];
        [patient2 feelsBadWith:closureDoc];
        
    }
    return 0;
}
























