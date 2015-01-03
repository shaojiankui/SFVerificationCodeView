//
//  RandomCodeView.h
//  RandomCode-Demo
//
//  Created by Jakey on 15/1/3.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^DidChangeCode)(NSString*code);

@interface RandomCodeView : UIView
{
    DidChangeCode _didChangeCode;
    UITapGestureRecognizer *_tap;
}
-(void)didChangeCode:(DidChangeCode)didChangeCode;
@property (nonatomic)  NSUInteger count;

@end
