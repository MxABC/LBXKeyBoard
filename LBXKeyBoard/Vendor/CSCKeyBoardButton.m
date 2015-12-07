//
//  CSCKeyBoardButton.m
//  LBXKeyBoard
//
//  Created by csc on 15/12/3.
//  Copyright © 2015年 zcsmart. All rights reserved.
//

#import "CSCKeyBoardButton.h"



@interface CSCKeyBoardButton()

@property (nonatomic, strong) UIColor *colorBack;
@end

@implementation CSCKeyBoardButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        
    }
    
    return self;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.colorBack = self.backgroundColor;
    
    self.backgroundColor = [UIColor lightGrayColor];
}


- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.backgroundColor = self.colorBack;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.backgroundColor = self.colorBack;
}


@end



