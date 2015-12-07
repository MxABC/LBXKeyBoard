//
//  CSCKeyBoardButton.h
//  LBXKeyBoard
//
//  Created by csc on 15/12/3.
//  Copyright © 2015年 zcsmart. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSCKeyBoardButton : UIButton

/**
 @brief  描述文字
 */
@property (nonatomic, strong) NSString* str;

/**
 @brief  按下颜色
 */
@property (nonatomic, strong) UIColor* touchDownColor;


@end
