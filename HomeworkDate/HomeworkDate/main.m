//
//  main.m
//  HomeworkDate
//
//  Created by Роман Сергиенко on 24.11.16.
//  Copyright © 2016 ig. All rights reserved.
//

//Немного практики с датами нам не помешает, так что вот задание.
//(немного повышу градус сложности)

//Студент.
//5. Отсортируйте массив студентов по дате рождения, начиная от самого юного.
//6. Используя массивы имен и фамилий (по 5-10 имен и фамилий), каждому студенту установите случайное
//   имя и случайную фамилию.
//7. Выведите отсортированных студентов: Имя, Фамилия, год рождения

//Мастер.
//10. Создайте таймер в апп делегате, который отсчитывает один день за пол секунды.
//11. Когда таймер доходит до дня рождения любого их студентов - поздравлять его с днем рождения.
//12. Выведите на экран разницу в возрасте между самым молодым и
//    самым старым студентом (количество лет, месяцев, недель и дней)

//Супермен.
//13. Выведите на экран день недели, для каждого первого дня каждого месяца в текущем году (от начала до конца)
//14. Выведите дату (число и месяц) для каждого воскресенья в текущем году (от начала до конца)
//15. Выведите количество рабочих дней для каждого месяца в текущем году (от начала до конца)

#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
    
        // УЧЕНИК
        //  1.Создайте класс студент у которого будет проперти dateOfBirth (дата рождения), которая собственно NSDate.
        //  2.Инициализируйте NSMutableArray и в цикле создайте 30 студентов.
        //  3.Каждому установите дату рождения. Возраст рандомный от 16 до 50 лет.
        //  4.В другом цикле пройдитесь по всему массиву и выведите день рождения каждого студента в адекватном формате.
        NSLog(@"*** PUPIL ***");
        
        NSMutableArray* students = [NSMutableArray array];
        
        for (int i=0; i<30; i++) {
            Student* student = [[Student alloc]  init];
            
            // Случайный возраст от 16 до 50 лет
            int randomYear = 16 + arc4random_uniform(50-16);
            
            // Работа с календарем. Вычитаем из текущего года возраст чтобы определить год рождения
            NSDate *today = [[NSDate alloc] init];
            NSCalendar *calendar = [NSCalendar currentCalendar];
            NSDateComponents *components = [[NSDateComponents alloc] init];
            [components setYear:-randomYear];
            NSDate* randomDate = [calendar dateByAddingComponents:components toDate:today options:0];

            student.dateOfBirth = randomDate;
            [students addObject:student];
        }
        NSDateFormatter* dateFormater = [[NSDateFormatter alloc] init];
        [dateFormater setDateFormat:@"dd MMMM yyyy"];
        
        for (Student* student in students) {
            NSLog(@"Дата рождения: %@", [dateFormater stringFromDate:student.dateOfBirth]);
        }
    }
    
    return 0;
}

