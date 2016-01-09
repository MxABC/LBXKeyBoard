//
//  CSCDigitalKeyBoardView.m
//  LBXKeyBoard
//
//  Created by csc on 15/12/3.
//  Copyright © 2015年 zcsmart. All rights reserved.
//

#import "CSCDigitalKeyBoardView.h"
#import "CSCKeyBoardButton.h"



@interface CSCDigitalKeyBoardView()
{
    CGFloat topTitleH;
    CGFloat keyboardH;
}
@property (nonatomic, weak) UITextField *responder;
@end

@implementation CSCDigitalKeyBoardView


//- (id)init
//{
//    if (self = [super init])
//    {
//         [self __initWithFrame:CGRectZero];
//    }
//    
//    return self;
//}


- (id)initWithBoardViewHead:(BOOL)needBoardHead
{
    if (needBoardHead) {
        topTitleH = 44.0;
    }
    if (self = [super init])
    {
        [self __initWithFrame:CGRectZero];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame] )
    {
        [self __initWithFrame:CGRectZero];
    }
    
    return self;
}

- (void)__initWithFrame:(CGRect)frame
{
    keyboardH = 216;
    
    if ( CGRectEqualToRect(CGRectZero,frame) )
    {
        CGRect screenBounds = [UIScreen mainScreen].bounds;
        
        frame = CGRectMake(0, screenBounds.size.height - keyboardH - topTitleH, screenBounds.size.width, keyboardH + topTitleH);
    }
    
    self.frame = frame;
    
    [self __initButtons];
}

- (void)__initButtons
{
    self.userInteractionEnabled = YES;
    
    self.backgroundColor = [UIColor colorWithRed:200/255. green:200/255. blue:200/255. alpha:1.0];
    
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), topTitleH+1)];
    [self addSubview:topView];
    topView.backgroundColor = [UIColor colorWithRed:247/255. green:247/255. blue:247/255. alpha:1.0];
    topView.userInteractionEnabled = YES;
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(topView.frame), 1)];
    [topView addSubview:line];
    line.backgroundColor = self.backgroundColor;
    
    
    if (topTitleH > 0.0 )
    {
        UIButton *returnBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(topView.frame) - 60, 0, 60, CGRectGetHeight(topView.frame))];
        [returnBtn setTitle:@"完成" forState:UIControlStateNormal];
        [returnBtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [topView addSubview:returnBtn];
        [returnBtn addTarget:self action:@selector(returnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    
    
    int w = (CGRectGetWidth(self.frame)-2) / 3;
    int h = (CGRectGetHeight(self.frame)-3 - topTitleH) / 4;
    
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
                subH = CGRectGetHeight(self.frame) - topTitleH - 4 * margin - 3 * h;
            }
            
            CGRect rect = CGRectMake(j*margin + j * w, topTitleH + (i+1) * margin + i * h, subW, subH);
            
            CSCKeyBoardButton *btn = [[CSCKeyBoardButton alloc]initWithFrame:rect];
           
            
            int pos = i * col + j;
            
            NSString* strTitle = arrayItems[pos];
            [btn setTitle:strTitle forState:UIControlStateNormal];
            
            btn.str = strTitle;
            
//            btn.backgroundColor = [UIColor whiteColor];
            
            btn.backgroundColor = [UIColor colorWithRed:1. green:1. blue:1. alpha:1.0];
            
            [btn setBackgroundImage:[self ColortoImage:[UIColor lightGrayColor]] forState:UIControlStateHighlighted];
            
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            btn.titleLabel.font = [UIFont systemFontOfSize:26];
            
            
            
            if ([strTitle isEqualToString:@"·"] || [strTitle isEqualToString:@"Del"] )
            {
                btn.backgroundColor = [UIColor colorWithRed:209./255 green:212./255. blue:215./255. alpha:0.9];
            }
            
            if ([strTitle isEqualToString:@"Del"])
            {                
                UIImage *img = [UIImage imageNamed:@"CSCKeyBoard.bundle/CSC_keyboard_back"];
                
                UIImage *src = [self createImageWithColor:btn.backgroundColor size:btn.frame.size];
                
                img = [self addImageLogo:src centerLogoImage:img logoSize:img.size];
                
                [btn setBackgroundImage:img forState:UIControlStateNormal];
                
                [btn setTitle:@"" forState:UIControlStateNormal];
            }
            [self addSubview:btn];
            
            [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
            
        }
    }
}

//- (void)btnAction:(UIButton*)btn
//{
//    NSLog(@"btn tag:%ld",btn.tag);
//}

- (void)returnAction
{
  //  [self.responder becomeFirstResponder];
    [self.responder resignFirstResponder];
}


- (UIImage*) createImageWithColor: (UIColor*) color size:(CGSize)size
{
    CGRect rect=CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

- (UIImage*)addImageLogo:(UIImage*)srcImg centerLogoImage:(UIImage*)LogoImage logoSize:(CGSize)logoSize
{
    UIGraphicsBeginImageContext(srcImg.size);
    [srcImg drawInRect:CGRectMake(0, 0, srcImg.size.width, srcImg.size.height)];
    
    CGRect rect = CGRectMake(srcImg.size.width/2 - logoSize.width/2, srcImg.size.height/2-logoSize.height/2, logoSize.width, logoSize.height);
    [LogoImage drawInRect:rect];
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultingImage;
}

- (void)btnActionTest
{
    NSLog(@"test");
}

- (void)btnAction:(CSCKeyBoardButton*)btn
{
    NSLog(@"%@",btn.str);
    if ([btn.str isEqualToString:@"·"])
    {
        NSLog(@"%@.",btn.str);
        
        self.responder.text = [NSString stringWithFormat:@"%@.",self.responder.text];
        
    }
    else if ([btn.str isEqualToString:@"Del"])
    {
        NSLog(@"back");
        
        [self deleteBtnClick];
    }
    else
    {
        self.responder.text = [NSString stringWithFormat:@"%@%@",self.responder.text,btn.str];
    }
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


- (UIImage *) ColortoImage:(UIColor*)color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}



@end





