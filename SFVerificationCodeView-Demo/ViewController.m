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
    SFVerificationCodeView *view = [[SFVerificationCodeView alloc]initWithFrame:CGRectMake(100, 100, 100, 30)];
    view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:view];
    
    //设置验证码生成模式 默认为Local
    view.mode = SFVerificationCodeModeLocal;
    [view willChangeVerificationCode:^(SFVerificationCodeMode mode) {
        NSLog(@"本地随机生成code");

    }];
    [view didChangeVerificationCode:^(NSString *code) {
        NSLog(@"view code:%@",code);

    }];
    //开始生成code
    [view generateVerificationCode];
    
    self.codeView.mode = SFVerificationCodeModeServer;
    [self.codeView willChangeVerificationCode:^(SFVerificationCodeMode mode) {
        NSLog(@"请求服务器生成code");
        [self getData:nil completion:^(NSDictionary *dict) {
            self.codeView.code = [dict objectForKey:@"code"];
        }];
    }];
    [self.codeView didChangeVerificationCode:^(NSString *code) {
        NSLog(@"self.codeView code:%@",code);
    }];
    //开始生成code
    [self.codeView generateVerificationCode];
}

//模拟异步从后台接口请求验证码
- (void)getData:(id)data  completion:(void (^)(NSDictionary *dict))completion{
    //....
    NSString *code = [NSString stringWithFormat:@"server%zd",arc4random() % 100];
    NSDictionary *dict = @{@"code":code};
    completion(dict);
}
@end
