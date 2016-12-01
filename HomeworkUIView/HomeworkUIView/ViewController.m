//
//  ViewController.m
//  HomeworkUIView
//
//  Created by Роман Сергиенко on 30.11.16.
//  Copyright © 2016 ig. All rights reserved.
//

//Урок номер 19. UIView Геометрия

//Итак наконец-то мы начали изучать графику :) Надо тренироваться! Повышаем градус заданий :)

//Ученик
//1. В цикле создавайте квадратные UIView с черным фоном и расположите их в виде шахматной доски
//2. доска должна иметь столько клеток, как и настоящая шахматная

//Студент
//3. Доска должна быть вписана в максимально возможный квадрат, т.е. либо бока, либо верх или низ должны касаться границ экрана
//4. Применяя соответствующие маски сделайте так, чтобы когда устройство меняет ориентацию, то все клетки растягивались соответственно и ничего не
//   вылетало за пределы экрана.

//Мастер
//5. При повороте устройства все черные клетки должны менять цвет :)
//6. Сделайте так, чтобы доска при поворотах всегда строго находилась по центру

//Супермен
//8. Поставьте белые и красные шашки (квадратные вьюхи) так как они стоят на доске.
//   Они должны быть сабвьюхами главной вьюхи (у них и у клеток один супервью)
//9. После каждого переворота шашки должны быть перетасованы используя соответствующие методы иерархии UIView

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()
@property (strong, nonatomic) NSMutableArray* chekers;
@property (weak, nonatomic) UIView* desk;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _chekers = [NSMutableArray array];
    
    CGRect desk = CGRectMake(0,
                             CGRectGetHeight(self.view.bounds) / 2 - CGRectGetWidth(self.view.bounds) / 2,
                             CGRectGetWidth(self.view.bounds),
                             CGRectGetWidth(self.view.bounds));
                             
    UIView* viewDesk = [[UIView alloc] initWithFrame:desk];
    _desk = viewDesk;
                             
    [self viewFlexible:viewDesk];

    viewDesk.backgroundColor = [UIColor cyanColor];
    viewDesk.alpha = 0.9;
    [self.view addSubview:viewDesk];
    
    float x = 0.f;
    float y = 0.f;

    float widthSquare = CGRectGetWidth(self.view.bounds) / 8;
    float heightSquare = widthSquare;
    
    CGRect blackSquare = CGRectMake(x, y, widthSquare, heightSquare);
    
    for (int i=0; i<8; i++) {
        for (int j=0; j<4; j++) {
            
            UIView* viewSquare = [[UIView alloc] initWithFrame:blackSquare];
            
            viewSquare.backgroundColor = [UIColor blackColor];
            
            [viewDesk addSubview:viewSquare];
            //[self.view addSubview:viewSquare];
            
            if (i<3) {
                [self addChekerOn:viewSquare color:[UIColor redColor]];
            }else if (i>4) {
                [self addChekerOn:viewSquare color:[UIColor whiteColor]];
            }
            //else {
            //  [self viewFlexible:viewSquare];
            //}
            
            blackSquare.origin.x += blackSquare.size.width*2;
        }
        if (i%2 == 0) {
            blackSquare.origin.x = x + blackSquare.size.width;
        }else {
            blackSquare.origin.x = x;
        }
        blackSquare.origin.y += blackSquare.size.width;;
    }
    
}


- (void)viewFlexible:(UIView*)view {
        view.autoresizingMask =
            UIViewAutoresizingFlexibleBottomMargin |
            UIViewAutoresizingFlexibleTopMargin    |
            UIViewAutoresizingFlexibleLeftMargin   |
            UIViewAutoresizingFlexibleRightMargin;
}

- (void)addChekerOn:(UIView*)viewSquare color:(UIColor*)color {
    

    float width = CGRectGetWidth(viewSquare.bounds)-15;
    float height = CGRectGetHeight(viewSquare.bounds)-15;
    
    float x = viewSquare.frame.origin.x + (CGRectGetWidth(viewSquare.bounds)/2 - width/2);
    float y = viewSquare.frame.origin.y + (CGRectGetHeight(viewSquare.bounds)/2 - height/2);
    
    CGRect cheker = CGRectMake(x,y,width,height);
    
    UIView* viewCheker = [[UIView alloc] initWithFrame:cheker];
    
    viewCheker.layer.cornerRadius = width / 2.0;
    viewCheker.alpha = 0.8;
    viewCheker.backgroundColor = color;
    
    [_chekers addObject:viewCheker];
    
    //[self.view addSubview:viewCheker];
    [viewSquare.superview addSubview:viewCheker];
    
    NSLog(@"ARRAY OF CHEKERS: %d", _chekers.count);
    //[self viewFlexible:viewSquare];
    //[self viewFlexible:viewCheker];
    
}

- (void) shakeChekers {
    
    NSLog(@"%d", _chekers.count);
    
    for (UIView* cheker in _chekers) {
        
        int i = arc4random() % [_chekers count];
        
        while (i == [self.chekers indexOfObject:cheker]) {
            i = arc4random() % [_chekers count];
        }
        
        UIView* anotherCheker = _chekers[i];
        CGRect rectOfAnotherCheker = anotherCheker.frame;
        CGRect rectCheker = cheker.frame;
        
        [UIView animateWithDuration:1.7 animations:^{
            
            [cheker setFrame:rectOfAnotherCheker];
            [anotherCheker setFrame:rectCheker];
            [_desk bringSubviewToFront:cheker];
            [_desk bringSubviewToFront:anotherCheker];
        }];
    }
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator>)coordinator {
    NSLog(@"%@",[NSNumber valueWithCGSize:size]);
    
    [self shakeChekers];
    
    for (UIView* view in self.view.subviews) {
        view.backgroundColor = [UIColor colorWithRed:(arc4random()%10)*0.1
                                               green:(arc4random()%10)*0.1
                                                blue:(arc4random()%10)*0.1
                                               alpha:0.8];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
