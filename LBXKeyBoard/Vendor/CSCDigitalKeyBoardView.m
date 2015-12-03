//
//  CSCDigitalKeyBoardView.m
//  LBXKeyBoard
//
//  Created by csc on 15/12/3.
//  Copyright © 2015年 zcsmart. All rights reserved.
//

#import "CSCDigitalKeyBoardView.h"
#import "CSCKeyBoardButton.h"

@implementation CSCDigitalKeyBoardView


- (id)init
{
    if (self = [super init])
    {
        
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    if ( CGRectEqualToRect(CGRectZero,frame) )
    {
        CGRect screenBounds = [UIScreen mainScreen].bounds;
        
        frame = CGRectMake(0, screenBounds.size.height - 216, screenBounds.size.width, 216);
    }
    
    if (self = [super initWithFrame:frame] )
    {
        [self __initButtons];
    }
    
    return self;
}

- (void)__initButtons
{
    int w = (CGRectGetWidth(self.frame)-2) / 3;
    int h = (CGRectGetHeight(self.frame)-3) / 4;
    
    int row = 4;
    int col = 3;
    
    int margin = 1;
    
    NSArray *arrayItems = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"·",@"0",@"Del"];
    
    for (int i = 0; i < row; i++)
    {
        for (int j = 0; j < col; j++)
        {
            int subW = w;
            int subH = h;
            
            //多余的放在最后button上
            if ( j == (col - 1) ) {
                subW = CGRectGetWidth(self.frame) - 2 * margin - 2 * w;
            }
            if (i == (row - 1) )
            {
                subH = CGRectGetHeight(self.frame) - 3 * margin - 3 * h;
            }
            
            CGRect rect = CGRectMake(j*margin + j * w, i*margin + i*h, subW, subH);
            
            CSCKeyBoardButton *btn = [[CSCKeyBoardButton alloc]initWithFrame:rect];
            
            
            int pos = i * col + j;
            
            NSString* strTitle = arrayItems[pos];
            [btn setTitle:strTitle forState:UIControlStateNormal];
            
            btn.str = strTitle;
            
//            btn.backgroundColor = [UIColor whiteColor];
            
            btn.backgroundColor = [UIColor colorWithRed:1. green:1. blue:1. alpha:0.6];
            
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            btn.titleLabel.font = [UIFont systemFontOfSize:26];
            
            [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
            
            [self addSubview:btn];
            
            
        }
    }
    
    self.backgroundColor = [UIColor clearColor];
}

- (void)btnAction:(CSCKeyBoardButton*)btn
{
    NSLog(@"%@",btn.str);
    if ([btn.str isEqualToString:@"·"])
    {
        NSLog(@"%@.",btn.str);
    }
    else if ([btn.str isEqualToString:@"Del"])
    {
        NSLog(@"back");
    }
}


@end




