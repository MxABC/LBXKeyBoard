//
//  CSCDigitalKeyBoardView.h
//  LBXKeyBoard
//
//  Created by csc on 15/12/3.
//  Copyright © 2015年 zcsmart. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSCDigitalKeyBoardView : UIView

/**
 @brief  初始化
 @param needBoardHead 是否需要键盘头部，方便点击键盘小时
 @return 当前类对象
 */
- (instancetype)initWithBoardViewHead:(BOOL)needBoardHead;

@end
