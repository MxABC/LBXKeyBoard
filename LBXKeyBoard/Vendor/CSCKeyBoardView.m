//
//  CSCKeyBoardView.m
//  LBXKeyBoard
//
//  Created by csc on 15/12/3.
//  Copyright © 2015年 zcsmart. All rights reserved.
//

#import "CSCKeyBoardView.h"



@interface CSCKeyBoardView()

@property (nonatomic,assign) CSCKeyBoardType keyboardType;
@property (nonatomic, weak) UITextField *responder;

@end

@implementation CSCKeyBoardView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)init
{
    if (self = [super init]) {
        
        self.keyboardType = CSCKeyBoardType_Money;
    }
    return self;
}


- (id)initWithType:(CSCKeyBoardType)boardType
{
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    CGRect frame = CGRectMake(0, screenBounds.size.height - 216, screenBounds.size.width, 216);
    
    self.keyboardType = boardType;
    
    if (self = [super initWithFrame:frame])
    {
        
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
         self.keyboardType = CSCKeyBoardType_Money;
    }
    
    return self;
}

- (void) __init
{
    //根据对应键盘，显示不同键盘效果。
}

- (UITextField *)responder{
    //    if (!_responder) {  // 防止多个输入框采用同一个inputview
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    UIView *firstResponder = [keyWindow valueForKey:@"firstResponder"];
    _responder = (UITextField *)firstResponder;
    //    }
    return _responder;
}

- (void)deleteBtnClick{
    if (self.responder.text.length) {
        self.responder.text = [self.responder.text substringToIndex:self.responder.text.length-1];
    }
}

@end
