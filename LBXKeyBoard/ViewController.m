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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    CSCDigitalKeyBoardView *kv = [[CSCDigitalKeyBoardView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height - 216, self.view.frame.size.width, 216)];
    
    [self.view addSubview:kv];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
