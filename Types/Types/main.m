//
//  main.m
//  Types
//
//  Created by Роман Сергиенко on 10.11.16.
//  Copyright © 2016 ig. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Student* studentA = [[Student alloc] init];
        studentA.name = @"Best Student";
        
        NSLog(@"student A = %@", studentA.name);
        Student* studentB = studentA;
        studentB.name = @"Bad Student";
        studentB.colorEyes = green;
        
        NSString* color = @"";
        if (studentB.colorEyes == green) { color = @"Green Eyes"; }
        NSLog(@"student A = %@, color: %@", studentA.name, color);
        
        CGPoint pointn;
        pointn.x = 12;
        pointn.y = 10;
        
        CGSize size;
        size.height = 4;
        size.width = 4;
        
        CGRect rect;
        rect.origin = pointn;
        rect.size = size;
        
        NSNumber* intergerValue = [NSNumber numberWithInteger:234];
        NSArray* array = [NSArray arrayWithObjects: intergerValue,intergerValue, nil];
        
        NSInteger number = [[array objectAtIndex:0] integerValue];
        
        NSArray* list = @[@12,@23,@34];
        NSInteger index = [list[1] integerValue];
        NSLog(@"%ld, %ld",number, index);
        
        // ПРИМИТИВНЫЕ ТИПЫ ЧТОБЫ ДОБАВИТЬ В МАССИВ НУЖНО ОБЕРНУТЬ В ОБЪЕКТ NSNumber
        // А СТРУКТУРЫ НЕОБХОДИМО ОБОРАЧИВАТЬ В ОБЪЕКТ NSValue
        
        
        
//Надо попрактиковаться со структурами. Например такое небольшое задание: на поле 10х10 рандомно создайте точек (разберитесь как рандомно генерировать цифры, подсказка - функция arc4random()) и проверяйте какая из точек попадает в квадрат размером 3х3 в самом центре поля. Грубо говоря надо определить какие из точек в массиве попадают в центр и вывести их на печать. Пробуйте и задавайте вопросы.
        
        CGRect centerField = CGRectMake(3, 3, 3, 3);
        CGPoint point1 = CGPointMake(arc4random_uniform(10), arc4random_uniform(10));
        CGPoint point2 = CGPointMake(arc4random_uniform(10), arc4random_uniform(10));
        CGPoint point3 = CGPointMake(arc4random_uniform(10), arc4random_uniform(10));
        
        NSArray* dots = [NSArray arrayWithObjects:
                         [NSValue valueWithPoint:point1],
                         [NSValue valueWithPoint:point2],
                         [NSValue valueWithPoint:point3],
                         nil];
        for (NSValue* value in dots) {
            NSString* result = CGRectContainsPoint(centerField, [value pointValue]) ? @"Hit the target" : @"Missed";
            
            NSLog(@"%@: %@",NSStringFromPoint([value pointValue]), result);
        }
    }
    return 0;
}
