//
//  HUDHelper.m
//  ProgressHUDDemo
//
//  Created by ZGCC on 16/7/9.
//  Copyright © 2016年 ZGCC. All rights reserved.
//

#import "HUDHelper.h"

#define DispatchMainThread(mainQueueBlock) dispatch_async(dispatch_get_main_queue(), mainQueueBlock);

@implementation HUDHelper

+ (void)showIndeterminateHUD{
    
    DispatchMainThread(^{
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow.rootViewController.view animated:YES];
        hud.userInteractionEnabled = NO;
        hud.removeFromSuperViewOnHide = YES;
        hud.dimBackground = YES;
    });
}

+ (void)showIndeterminateHUDWithText:(NSString *)text{
    [self showHUDWithText:text hideDelay:0];
}

+ (void)showHUDWithText:(NSString *)text hideDelay:(NSTimeInterval)delay{
    
    DispatchMainThread(^{
        
        [MBProgressHUD hideAllHUDsForView:[UIApplication sharedApplication].keyWindow.rootViewController.view animated:YES];
        
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow.rootViewController.view animated:YES];
        hud.userInteractionEnabled = NO;
        
        if (delay > 0) {
            hud.mode = MBProgressHUDModeCustomView;
            hud.detailsLabelText = text;
            [hud hide:YES afterDelay:delay];
        }else{
            hud.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            hud.labelText = text;
            hud.removeFromSuperViewOnHide = YES;
            hud.dimBackground = YES;
        }
        
    });
    
}

+ (void)showHUDWithImage:(NSString *)imageName text:(NSString *)text{
    
    // Make the customViews 37 by 37 pixels for best results (those are the bounds of the build-in progress indicators)
    
    DispatchMainThread(^{
        
        [MBProgressHUD hideAllHUDsForView:[UIApplication sharedApplication].keyWindow.rootViewController.view animated:YES];
        
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow.rootViewController.view animated:YES];
        hud.userInteractionEnabled = NO;
        hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        hud.mode = MBProgressHUDModeCustomView;
        hud.labelText = text;
        hud.dimBackground = YES;
        [hud hide:YES afterDelay:3];
    });
}

+ (void)hideHUD{
    
    DispatchMainThread(^{
        [MBProgressHUD hideAllHUDsForView:[UIApplication sharedApplication].keyWindow.rootViewController.view animated:YES];
    });
    
}

@end
