//
//  ViewController.m
//  HomeworkIBOutlets
//
//  Created by Роман Сергиенко on 02.12.16.
//  Copyright © 2016 ig. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%lu", (unsigned long)self.blackSquare.count);
}


- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator>)coordinator {
    
    
    for (UIView* cheker in self.cheker) {
        
        int i = arc4random() % [self.cheker count];
        
        while (i == [self.cheker indexOfObject:cheker]) {
            i = arc4random() % [self.cheker count];
        }
        
        UIView* anotherCheker = self.cheker[i];
        CGRect rectOfAnotherCheker = anotherCheker.frame;
        CGRect rectCheker = cheker.frame;
        
        [UIView animateWithDuration:1.7 animations:^{
            
            [cheker setFrame:rectOfAnotherCheker];
            [anotherCheker setFrame:rectCheker];
            [self.viewDesk bringSubviewToFront:cheker];
            [self.viewDesk bringSubviewToFront:anotherCheker];
            
            self.viewDesk.backgroundColor = [UIColor colorWithRed:(arc4random()%10)*0.1 green:(arc4random()%10)*0.1 blue:(arc4random()%10)*0.1 alpha:0.8];
        }];
    }
                                     
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
