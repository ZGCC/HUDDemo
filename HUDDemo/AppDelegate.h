//
//  AppDelegate.h
//  HUDDemo
//
//  Created by ZGCC on 15/9/9.
//  Copyright (c) 2015年 ZGCC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "MBProgressHUD+MJ.h"
#import "MBProgressHUD.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ViewController *VC;

+ (AppDelegate *)sharedAppDelegate;

@end

