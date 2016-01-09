//
//  ViewController.m
//  LBXKeyBoard
//
//  Created by csc on 15/12/3.
//  Copyright © 2015年 zcsmart. All rights reserved.
//

#import "ViewController.h"
#import "CSCDigitalKeyBoardView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textfield1;
@property (weak, nonatomic) IBOutlet UITextField *textfield2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]init];
    
    [tap addTarget:self action:@selector(tapAction)];
    [self.view addGestureRecognizer:tap];
    
  
    
    CSCDigitalKeyBoardView *kv = [[CSCDigitalKeyBoardView alloc]initWithBoardViewHead:YES];
    
    
    _textfield1.inputView = kv;
    
    _textfield2.inputView = kv;
    
}


- (void)tapAction
{
    [_textfield1 resignFirstResponder];
    [_textfield2 resignFirstResponder];
}


@end
