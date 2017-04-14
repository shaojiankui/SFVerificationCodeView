SFVerificationCodeView
==============

SFVerificationCodeView,实现iOS本地生成随机验证码, 从服务器读取并生成验证码 

验证码其实主要用来防止机器人恶意注册与登陆，基本用于web网页端

![image](https://raw.githubusercontent.com/shaojiankui/SFVerificationCodeView/master/s.png)

## XIB拖拽方式

```
//设置验证码生成模式  本地生成
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

//模拟异步从后台接口请求验证码
- (void)getData:(id)data  completion:(void (^)(NSDictionary *dict))completion{
    //网络请求
    NSString *code = [NSString stringWithFormat:@"server%zd",arc4random() % 100];
    NSDictionary *dict = @{@"code":code};
    completion(dict);
}
```

## 代码方式

```
//设置验证码生成模式 服务器请求验证码
view.mode = SFVerificationCodeModeLocal;
[view willChangeVerificationCode:^(SFVerificationCodeMode mode) {
    NSLog(@"本地随机生成code");

}];
[view didChangeVerificationCode:^(NSString *code) {
    NSLog(@"view code:%@",code);

}];
//开始生成code
[view generateVerificationCode];
```
