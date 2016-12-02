//
//  ViewController.h
//  HomeworkIBOutlets
//
//  Created by Роман Сергиенко on 02.12.16.
//  Copyright © 2016 ig. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *viewDesk;

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *blackSquare;

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *cheker;

@end

