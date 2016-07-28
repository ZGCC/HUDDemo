//
//  ViewController.m
//  HUDDemo
//
//  Created by ZGCC on 15/9/9.
//  Copyright (c) 2015年 ZGCC. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "HUDHelper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *array = @[@"Indeterminate HUD",
                       @"Indeterminate Text HUD",
                       @"Text HUD Then hide",
                       @"Image HUD",
                       @"Hide"];
    
    [array enumerateObjectsUsingBlock:^(NSString *str, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 100 + 50 * idx, self.view.bounds.size.width - 40, 35)];
        btn.tag = idx;
        [btn setBackgroundColor:[UIColor blackColor]];
        [btn setTitle:str forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnAct:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }];
    
}

- (void)btnAct:(UIButton *)sender{
    NSLog(@"--- %s", __FUNCTION__);
    
    switch (sender.tag) {
        case 0:
        {
            [HUDHelper showIndeterminateHUD];
            break;
        }
        case 1:
        {
            [HUDHelper showIndeterminateHUDWithText:@"wait"];
            break;
        }
        case 2:
        {
            [HUDHelper showHUDWithText:@"test" hideDelay:3.0];
            break;
        }
        case 3:
        {
            [HUDHelper showHUDWithImage:@"done" text:@"ok"];
            break;
        }
        default:
        {
            [HUDHelper hideHUD];
            break;
        }
            
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
