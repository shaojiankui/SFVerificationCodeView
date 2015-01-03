//
//  ViewController.m
//  RandomCode-Demo
//
//  Created by Jakey on 15/1/3.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    RandomCodeView *view = [[RandomCodeView alloc]initWithFrame:CGRectMake(100, 100, 100, 30)];
    view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:view];
    
    [view didChangeCode:^(NSString *code) {
        NSLog(@"view code:%@",code);

    }];
    
    [self.codeView didChangeCode:^(NSString *code) {
        NSLog(@"self.codeView code:%@",code);
    }];
}
@end
