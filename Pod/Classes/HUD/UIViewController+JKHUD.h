//
//  UIViewController+JKRefresControll.h
//  MX
//
//  Created by Futao on 16/3/9.
//  Copyright © 2016年 JKSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (JKRefresControll)
- (void)showHUDIndeterminate;
- (void)showHUDIndeterminateWithText:(NSString *)text;
- (void)hideHUDIndeterminate;
- (void)showHUDWithDetailText:(NSString *)text;
- (void)showHUDWithText:(NSString *)text detailText:(NSString *)detailText;
- (void)showHUDWithText:(NSString *)text detailText:(NSString *)detailText afterDelay:(float)afterDelay;
@end
