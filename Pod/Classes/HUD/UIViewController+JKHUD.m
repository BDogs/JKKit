//
//  UIViewController+JKRefresControll.m
//  MX
//
//  Created by Futao on 16/3/9.
//  Copyright © 2016年 JKSoft. All rights reserved.
//

#import "UIViewController+JKHUD.h"
#import <MBProgressHUD/MBProgressHUD.h>

@implementation UIViewController (JKRefresControll)
- (void)showHUDIndeterminate
{
    [self showHUDIndeterminateWithText:@"正在加载..."];
}
- (void)showHUDIndeterminateWithText:(NSString *)text {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = text;
    [hud show:YES];
}
- (void)hideHUDIndeterminate {
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}
- (void)showHUDWithDetailText:(NSString *)text {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.detailsLabelText = text;
    [hud hide:YES afterDelay:2.0];
}
- (void)showHUDWithText:(NSString *)text detailText:(NSString *)detailText {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = text;
    hud.detailsLabelText = detailText;
    [hud hide:YES afterDelay:2.0];
}
- (void)showHUDWithText:(NSString *)text detailText:(NSString *)detailText afterDelay:(float)afterDelay{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = text;
    hud.detailsLabelText = detailText;
    [hud hide:YES afterDelay:afterDelay];
}
@end
