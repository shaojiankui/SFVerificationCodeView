RandomCodeView
==============

RandomCodeView,实现IOS生成随机验证码.  验证码其实主要用来防止机器人恶意注册与登陆，基本用于web网页端

![image](https://raw.githubusercontent.com/shaojiankui/RandomCodeView/master/s.png)

## XIB拖拽方式

@property (weak, nonatomic) IBOutlet RandomCodeView *codeView;

[self.codeView didChangeCode:^(NSString *code) {

  NSLog(@"code:%@",code);
        
 }];
##代码方式
 RandomCodeView *view = [[RandomCodeView alloc]initWithFrame:CGRectMake(100, 100, 100, 30)];
    
view.backgroundColor = [UIColor blackColor];
    
[self.view addSubview:view];
    
[view didChangeCode:^(NSString *code) {

   NSLog(@"view code:%@",code);
   
}];