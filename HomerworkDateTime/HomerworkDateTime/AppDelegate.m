//
//  AppDelegate.m
//  HomerworkDateTime
//
//  Created by Роман Сергиенко on 25.11.16.
//  Copyright © 2016 ig. All rights reserved.
//


//Немного практики с датами нам не помешает, так что вот задание.
//(немного повышу градус сложности)


#import "AppDelegate.h"
#import "Student.h"

@interface AppDelegate ()
@property (assign, nonatomic) int countDay;
@property (strong, nonatomic) NSArray* masterStudents;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
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
        [components setMonth:arc4random_uniform(12)];
        [components setDay:7];
        
        NSDate* randomDate = [calendar dateByAddingComponents:components toDate:today options:0];
        
        student.dateOfBirth = randomDate;
        [students addObject:student];
    }
    NSDateFormatter* dateFormater = [[NSDateFormatter alloc] init];
    [dateFormater setDateFormat:@"dd MMMM yyyy"];
    
    for (Student* student in students) {
        NSLog(@"Дата рождения: %@", [dateFormater stringFromDate:student.dateOfBirth]);
    }
    
    
    // СТУДЕНТ
    //  5.Отсортируйте массив студентов по дате рождения, начиная от самого юного.
    //  6.Используя массивы имен и фамилий (по 5-10 имен и фамилий), каждому студенту установите случайное
    //    имя и случайную фамилию.
    //  7.Выведите отсортированных студентов: Имя, Фамилия, год рождения
    NSLog(@"*** STUDENT ***");
    
    [students sortUsingComparator:^NSComparisonResult(Student* obj1, Student* obj2) {
        return [obj1.dateOfBirth compare:obj2.dateOfBirth];
    }];
    
    NSArray* names = @[@"Абрам",@"Аваз",@"Августин",@"Авраам",@"Агап",
                       @"Александра",@"Алеста",@"Алина",@"Алиса",@"Алсу"];
    NSArray* lastNames = @[@"Ковалэнко",@"Бондарэнко",@"Евэнко",@"Злэнко",@"Лучэнко",
                           @"Майстрэнко",@"Ткачэнко",@"Петрэнко",@"Павлэнко",@"Шевчэнко"];
    
    for (Student* student in students) {
        student.name = [names objectAtIndex:arc4random_uniform((unsigned int)names.count)];
        student.lastName = [lastNames objectAtIndex:arc4random_uniform((unsigned int)lastNames.count)];
    }
    
    [students sortUsingComparator:^NSComparisonResult(Student* obj1, Student* obj2) {
        return [obj1.dateOfBirth compare:obj2.dateOfBirth];
    }];
    
    for (Student* student in students) {
        NSLog(@"%@ %@ : %@", student.name, student.lastName, [dateFormater stringFromDate:student.dateOfBirth]);
    }
    
    // Мастер.
    //  10.Создайте таймер в апп делегате, который отсчитывает один день за пол секунды.
    //  11.Когда таймер доходит до дня рождения любого их студентов - поздравлять его с днем рождения.
    //  12.Выведите на экран разницу в возрасте между самым молодым и самым старым студентом (количество лет, месяцев, недель и дней)
    NSLog(@"*** MASTER ***");
    
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* howYears = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth |
                                                      NSCalendarUnitWeekday | NSCalendarUnitDay
                                             fromDate:[[students firstObject] dateOfBirth]
                                               toDate:[[students lastObject] dateOfBirth]
                                              options:0];
    
    NSDateFormatter* dateForm = [NSDateFormatter new];
    [dateForm setDateStyle:NSDateFormatterFullStyle];
    
    int years = [howYears valueForComponent:NSCalendarUnitYear];
    int months = [howYears valueForComponent:NSCalendarUnitMonth];
    int weekdays = [howYears valueForComponent:NSCalendarUnitWeekday];
    int days = [howYears valueForComponent:NSCalendarUnitDay];
    
    NSLog(@"\n%@\n%@ \nРазница в возрасте: %d\nРазница в месяцах: %d\nРазница в неделях: %d\nРазница в днях: %d",
          [dateForm stringFromDate: [[students firstObject] dateOfBirth]],
          [dateForm stringFromDate: [[students lastObject] dateOfBirth]],
          years, months, weekdays, days);
    
    self.countDay = 0;
    self.masterStudents = students;
    
    [NSTimer scheduledTimerWithTimeInterval:0.0005
                                     target:self
                                   selector:@selector(happyBDay:)
                                   userInfo:nil
                                    repeats:YES];
    
    // придумать с [timer invalidate] обработку
    
    //Супермен.
    //13. Выведите на экран день недели, для каждого первого дня каждого месяца в текущем году (от начала до конца)
    //14. Выведите дату (число и месяц) для каждого воскресенья в текущем году (от начала до конца)
    //15. Выведите количество рабочих дней для каждого месяца в текущем году (от начала до конца)
    NSLog(@"*** SUPERMAN ***");
    
    NSCalendar* calendar2016 = [NSCalendar currentCalendar];
    NSDateComponents *componentsForCalendar2016 = [[NSDateComponents alloc] init];
    [componentsForCalendar2016 setCalendar:calendar2016];
    [componentsForCalendar2016 setYear:2016];
    [componentsForCalendar2016 setDay:1];
    
    
    // 13.
    for (int month=1; month<=12; month++) {
        [componentsForCalendar2016 setMonth:month];
        
        NSDateFormatter* formaterForWeekDay = [[NSDateFormatter alloc] init];
        [formaterForWeekDay setDateFormat:@"e/EEEE yyyy"];
        
        NSDate* dateForWeekDay = [calendar2016 dateFromComponents:componentsForCalendar2016];
        NSLog(@"%@", [formaterForWeekDay stringFromDate:dateForWeekDay]);
    }
    
    // 14.
    NSCalendar* calendar2 = [NSCalendar currentCalendar];
    NSDateComponents *components2 = [[NSDateComponents alloc] init];
    [components2 setCalendar:calendar2];
    [components2 setYear:2016];
    [components2 setWeekday:1];
    [components2 setWeekdayOrdinal:1];
    
    NSDateFormatter* formaterForSunday = [[NSDateFormatter alloc] init];
    [formaterForSunday setDateStyle:NSDateFormatterFullStyle];
    
    NSDate* dateSunday = [calendar2 dateFromComponents:components2];
    
    int counterWeekdayOrdinal = 1;
    
    while ([calendar2 component:NSCalendarUnitYear fromDate:dateSunday] == 2016) {
        NSLog(@"%@", [formaterForSunday stringFromDate:dateSunday]);
        [components2 setWeekdayOrdinal:++counterWeekdayOrdinal];
        dateSunday = [calendar2016 dateFromComponents:components2];
    }
    
    
    // 15.
    NSCalendar* calendar3 = [NSCalendar currentCalendar];
    NSDateComponents* components3 = [[NSDateComponents alloc] init];
    [components3 setCalendar:calendar3];
    [components3 setYear:2016];
    [components3 setDay:1];
    
    NSDate* date3 = [calendar3 dateFromComponents:components3];
    
    int countDays = 1;
    int workDays = 0;
    while ([calendar3 component:NSCalendarUnitYear fromDate:date3] == 2016) {
        if (![calendar3 isDateInWeekend:date3]) {
            ++workDays;
        }
        [components3 setDay:++countDays];
        date3 = [calendar3 dateFromComponents:components3];
    }
    NSLog(@"Workdays: %d", workDays);
     
    


    return YES;
}

- (void)happyBDay:(NSTimer*)timer {
    
    NSDateFormatter* dateFormater = [NSDateFormatter new];
    [dateFormater setDateFormat:@"dd MMMM yyyy"];
    NSString* dateB = [dateFormater stringFromDate:[NSDate dateWithTimeIntervalSinceNow:-(++self.countDay*24*60*60)]];
    //NSLog(@"< %@", dateB);
    for (Student* student in self.masterStudents) {
        NSString* dateBFromArray = [dateFormater stringFromDate:student.dateOfBirth];
        //NSLog(@"> %@",dateBFromArray);
        
        if ([dateB isEqualToString:dateBFromArray]) {
            NSLog(@"%@ Happy Birthday to you!!! [BDate: %@]", student.name, dateB);
        }
        
    }
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
