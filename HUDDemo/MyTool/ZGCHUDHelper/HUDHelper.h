//
//  HUDHelper.h
//  ProgressHUDDemo
//
//  Created by ZGCC on 16/7/9.
//  Copyright © 2016年 ZGCC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

@interface HUDHelper : NSObject

+ (void)showIndeterminateHUD;
+ (void)showIndeterminateHUDWithText:(NSString *)text;
+ (void)showHUDWithText:(NSString *)text hideDelay:(NSTimeInterval)delay;
+ (void)showHUDWithImage:(NSString *)imageName text:(NSString *)text;
+ (void)hideHUD;

@end
