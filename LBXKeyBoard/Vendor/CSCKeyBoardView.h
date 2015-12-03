//
//  CSCKeyBoardView.h
//  LBXKeyBoard
//
//  Created by csc on 15/12/3.
//  Copyright © 2015年 zcsmart. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum CSCKeyBoardType
{
    CSCKeyBoardType_Money,//数字+·
    CSCKeyBoardType_NumPad,//默认显示数字，可切换字母，符号等
    CSCKeyBoardType_AlphaPad//默认字符，可切换数字，符号等
    
}CSCKeyBoardType;

@interface CSCKeyBoardView : UIView


- (id)initWithType:(CSCKeyBoardType)boardType;

@end
