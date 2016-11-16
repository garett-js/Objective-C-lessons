//
//  main.m
//  HomeworkDelegate
//
//  Created by Роман Сергиенко on 15.11.16.
//  Copyright © 2016 ig. All rights reserved.
//
//Урок номер 9. Делегаты

//Ученик:
//1. Создать пару пациентов и доктора по тому же принципу что и в видео. (Доктор
//   делегат у пациентов)
//2. У пациента пусть будет температура и другие симптомы, по которым доктор может
//   принимать решение.
//3. У пациента сделайте метод типа стало хуже и пусть когда станет хуже, то он идет
//   к доктору
//4. Всех пациентов объедините в массив и в цикле вызовите метод "стало хуже".
//5. Доктор должен лечить каждого согласно симптомам.

//Студент:
//6. Создайте другой класс доктора, не наследника от первого доктора, например друг :)
//7. этот друг должен лечить своих пациентов своими собственными методами и короче
//   плохой он доктор
//8. пусть кто-то ходит к врачу, а кто-то к нему
//9. создайте пару разных объектов класса друг и пусть они лечат своих пациентов
//   (чтобы понять что делегат это не класс, а объект)

//Мастер:
//10. Создайте список частей тела в делегате пациента (голова, живот, нога и тд) и
//    когда пациент приходит к врачу, пусть говорит что болит.
//11. Доктор должен принимать во внимание что болит
//12. Создайте у доктора метод "рапорт". Пусть в конце дня, когда все уже
//    нажаловались достаточно, доктор составит рапорт (выдаст имена) тех у кого
//    болит голова, потом тех у кого болел живот и тд

//Супермен
//13. Создайте в классе пациента проперти - оценка доктору.
//14. Когда доктор вам назначает лечение некоторые пациенты должны стать недовольны.
//15. В конце дня после того как все лечение будет сделано и доктор напишет рапорт,
//    надо пройтись по пациентам и всем недовольным поменять доктора.
//16. Начать новый день и убедиться что Недовольные пациенты таки поменяли доктора

#import <Foundation/Foundation.h>
#import "Patient.h"
#import "Doctor.h"
#import "BadDoctor.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        /// *** Ученик *** ///
        NSLog(@"======= PUPIL =======");
        Doctor* doctor = [Doctor new]; // [Doctor alloc] init];
        
        Patient* patient1 = [[Patient alloc] initWithName:@"Alex"  temprature:36.6f headache:true];
        Patient* patient2 = [[Patient alloc] initWithName:@"Jhon"  temprature:37.6f headache:false];
        Patient* patient3 = [[Patient alloc] initWithName:@"Dima"  temprature:38.6f headache:false];
        Patient* patient4 = [[Patient alloc] initWithName:@"Sasha" temprature:39.6f headache:false];
        Patient* patient5 = [[Patient alloc] initWithName:@"Masha" temprature:40.6f headache:false];
        
        NSArray* patients = @[patient1,patient2,patient3,patient4,patient5];
        
        for (Patient* patient in patients) {
            //patient.delegate = doctor;
            [patient feelsBad];
        }
        
        /// *** Студент *** ///
        NSLog(@"======= Student =======");
        BadDoctor* badDoctor1 = [BadDoctor new];
        BadDoctor* badDoctor2 = [BadDoctor new];
        
        patient1.delegate = badDoctor1;
        patient2.delegate = doctor;
        patient3.delegate = doctor;
        patient4.delegate = badDoctor2;
        patient5.delegate = badDoctor2;
        
        for (Patient* patient in patients) {
            [patient feelsBad];
        }
        
        /// *** Мастер *** ///
        NSLog(@"======= MASTER =======");
        Patient* patient6 = [[Patient alloc] initWithName:@"Nastya" temprature:41.6f headache:true];
        Patient* patient7 = [[Patient alloc] initWithName:@"Dasha" temprature:42.6f headache:false];
        
        patient1.delegate = doctor; patient2.delegate = doctor; patient3.delegate = doctor;
        patient4.delegate = doctor; patient5.delegate = doctor; patient6.delegate = doctor;
        patient7.delegate = doctor;
        
        [patient1 feelsBadWith:head];
        [patient2 feelsBadWith:head];
        [patient3 feelsBadWith:arm];
        [patient4 feelsBadWith:arm];
        [patient5 feelsBadWith:leg];
        [patient6 feelsBadWith:teeth];
        [patient7 feelsBadWith:teeth];
        
        [doctor raport];
        
        /// *** Супермен *** ///
        NSLog(@"======= SUPERMAN =======");
        
        NSArray* newPatients = @[patient1,patient2,patient3,patient4,patient5, patient6, patient7];
        
        patient1.feedBack = dislike;
        patient2.feedBack = dislike;
        patient6.feedBack = dislike;
        
        for (Patient* pat in newPatients) {
            if (pat.feedBack == dislike) {
                pat.delegate = badDoctor1;
                [pat feelsBad];
            }
        }
        
        [badDoctor1 raport];
        
        
        
    }
    return 0;
}



















