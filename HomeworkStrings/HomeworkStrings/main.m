//
//  main.m
//  HomeworkStrings
//
//  Created by Роман Сергиенко on 22.11.16.
//  Copyright © 2016 ig. All rights reserved.
//

//Урок номер 14. Строки
//Да, тема работы с текстом никогда не бывает веселой и забавной, но, как ни крути, надо это знать.

//Ученик.
//1. Возьмите текст из моего исходника и создайте на его основе строку, с которой будете работать.
//2. Выведите на экран сначала первую половину текста, а потом вторую.
//3. Создайте массив, каждый элемент которого является предложением данного текста.

//Студент.
//4. Используя массив из пункта 3 создайте новый массив, элементы которого это предложения, содержащие слово NSString. Нужно будет использовать
//   поиск и мутабл массивы.

//Мастер.
//5. Создайте новый массив на основе массива из пункта 4, но слова в предложении пусть идут наоборот, первое слово будет в конце, а последнее вначале :)
//
//Супермен.
//6.В оригинальном тексте каждое слово должно начинаться с маленькой буквы, а заканчиваться на заглавную.


#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // *** PUPIL ***
        NSLog(@"*** PUPIL ***");
        
        NSString* text = @"An elf is a type of supernatural being in Germanic mythology and folklore. Reconstructing the early concept of an elf depends almost entirely on texts in Old English or relating to Norse mythology. Later evidence for elves appears in diverse sources such as medical texts, prayers, ballads, and folktales. Recent scholars have emphasised, in the words of Ármann Jakobsson, that the time has come to resist reviewing information about álfar en masse and trying to impose generalizations on a tradition of a thousand years. Legends of álfar may have been constantly changing and were perhaps always heterogeneous so it might be argued that any particular source will only reflect the state of affairs at one given time. However, some generalisations are possible. In medieval Germanic-speaking cultures, elves seem generally to have been thought of as a group of beings with magical powers and supernatural beauty, ambivalent towards everyday people and capable of either helping or hindering them. However, the precise character of beliefs in elves across the Germanic-speaking world has varied considerably across time, space, and different cultures. In Old Norse mythological texts, elves seem at least at times to be counted among the pagan gods in medieval German texts they seem more consistently monstrous and harmful. Elves are prominently associated with sexual threats, seducing people and causing them harm. For example, a number of early modern ballads in the British Isles and Scandinavia, originating in the medieval period, describe human encounters with elves. In English literature of the Elizabethan era, elves became conflated with the fairies of Romance culture, so that the two terms began to be used interchangeably. German Romanticist writers were influenced by this notion of the elf, and reimported the English word elf in that context into the German language. In Scandinavia, probably through a process of euphemism, elves often came to be conflated with the beings called the huldra or huldufólk. Meanwhile, German folklore has tended to see the conflation of elves with dwarfs.";
        
        NSUInteger half = (NSUInteger)text.length/2;
        //NSString* half1 = [text substringWithRange:NSMakeRange(0, half)];
        //NSString* half2 = [text substringWithRange:NSMakeRange(half, text.length - half)];
        
        // OR like that:
        NSString* half1 = [text substringToIndex:half];
        NSString* half2 = [text substringFromIndex:half];
        
        NSLog(@"1 half: %@", half1);
        NSLog(@"2 half: %@", half2);
        
        NSArray* proposals = [text componentsSeparatedByString:@"."];
        
        int index = 1;
        for (NSString* string in proposals) {
            NSLog(@"#%d: %@", index++, string);
        }
        
        // *** STUDENT ***
        NSLog(@"*** STUDENT ***");
        
        NSMutableArray* newProposals = [NSMutableArray array];
        
        for (NSString* string in proposals) {
            if ( [string containsString:@"elf"] || [string containsString:@"Elf"] ) {
                [newProposals addObject:string];
            }
        }
        NSLog(@"%@", newProposals);
        
        // Попытка регулярных выражений снова убило мозг ...
        //NSRegularExpression *expr = [NSRegularExpression regularExpressionWithPattern:@"(W|^)elf(W|$)"
        //                                                                      options:NSRegularExpressionSearch
        //                                                                        error:nil];
        //NSString* textelf = @"Hello my name is elf";
        //NSArray* arr = [expr matchesInString:textelf
        //              options:0
        //                range:NSMakeRange(0, [textelf length])];
        //NSLog(@"%@", arr);
        
        // *** MASTER ***
        NSLog(@"*** MASTER ***");
        
        NSMutableArray* masterProposals = [NSMutableArray array];
        for (NSString* string in newProposals) {
            NSArray* innerString = [string componentsSeparatedByString:@" "];
            NSArray* reversedArray = [[innerString reverseObjectEnumerator] allObjects];
            
            [masterProposals addObject:[reversedArray componentsJoinedByString:@" "]];
        }
        
        NSLog(@"%@", masterProposals);
        
        // *** SUPERMAN ***
        NSLog(@"*** SUPERMAN ***");
        
        //Вот здесь бы ваще пригодились регулярки, но нужно их прям поннимать! ...
        //Ну а так, добро пожаловать в изврат ))) решение очень кастомизиновано под данный текст, ибо ... ибо!
        
        NSArray* textArray = [text componentsSeparatedByString:@" "];
        NSMutableArray* creepyArray = [NSMutableArray array];
        
        for (NSString* string in textArray) {
            
            if (string.length > 1) {
                NSUInteger endIndex = string.length-1;
            
                NSString* firstCharacter = [string substringWithRange:NSMakeRange(0,1)];
                NSString* first = [firstCharacter lowercaseString];
            
                NSString* lastCharacter = [string substringWithRange:NSMakeRange(endIndex,1)];
                if ( [lastCharacter isEqualToString:@","] || [lastCharacter isEqualToString:@"."] ) {
                    endIndex = endIndex - 2;
                    lastCharacter = [[string substringWithRange:NSMakeRange(endIndex,1)] stringByAppendingString:lastCharacter];
                }
                NSString* last = [lastCharacter uppercaseString];
            
                NSString* middle = @"";
                if (string.length > 2) {
                 middle = [string substringWithRange:NSMakeRange(1, endIndex)];
                }
                NSString* result = [[first stringByAppendingString:middle] stringByAppendingString:last];
                [creepyArray addObject:result];
            } else {
                [creepyArray addObject:string];
            }
        }
        
        NSString* newMegaSupermanText = [creepyArray componentsJoinedByString:@" "];
        NSLog(@"%@", newMegaSupermanText);
        
    }
    return 0;
}
