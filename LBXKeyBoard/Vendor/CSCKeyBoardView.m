//
//  CSCKeyBoardView.m
//  LBXKeyBoard
//
//  Created by csc on 15/12/3.
//  Copyright © 2015年 zcsmart. All rights reserved.
//

#import "CSCKeyBoardView.h"
#import "CSCDigitalKeyBoardView.h"


@interface CSCKeyBoardView()

@property (nonatomic, assign) CSCKeyBoardType keyboardType;
@property (nonatomic, weak) UITextField *responder;

@end

@implementation CSCKeyBoardView



- (id)init
{
    if (self = [super init]) {
        
        self.keyboardType = CSCKeyBoardType_Money;
    }
    
    [self __init];
    
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
    
    [self __init];
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
         self.keyboardType = CSCKeyBoardType_Money;
    }
    [self __init];
    return self;
}

- (void) __init
{
    
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



