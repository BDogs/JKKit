//
//  UINavigationController+JKPopPush.m
//  XS
//
//  Created by Futao on 16/3/30.
//  Copyright © 2016年 JKSoft. All rights reserved.
//

#import "UINavigationController+JKPopPush.h"

@implementation UINavigationController (JKPopPush)
- (NSArray<__kindof UIViewController *> *)popToViewControllerClass:(Class)viewControllerClass animated:(BOOL)animated {
    return [self navigateToViewControllerClass:viewControllerClass animated:animated foundControllerUsingBlock:NULL unfoundPushControllerUsingBlock:NULL enumerateChildViewControllers:YES];
}
- (NSArray<__kindof UIViewController *> *)navigateToViewControllerClass:(Class)viewControllerClass animated:(BOOL)animated unfoundPushControllerUsingBlock:(UIViewController * (^)())whenNotFoundBlock {
    
    return [self navigateToViewControllerClass:viewControllerClass animated:animated foundControllerUsingBlock:NULL unfoundPushControllerUsingBlock:whenNotFoundBlock];
}
- (NSArray<__kindof UIViewController *> *)navigateToViewControllerClass:(Class)viewControllerClass animated:(BOOL)animated foundControllerUsingBlock:(void (^)(UIViewController *))whenFoundBlock unfoundPushControllerUsingBlock:(UIViewController * (^)())whenNotFoundBlock {
    
    return [self navigateToViewControllerClass:viewControllerClass animated:animated foundControllerUsingBlock:whenFoundBlock unfoundPushControllerUsingBlock:whenNotFoundBlock enumerateChildViewControllers:YES];
}
- (NSArray<__kindof UIViewController *> *)navigateToViewControllerClass:(Class)viewControllerClass animated:(BOOL)animated foundControllerUsingBlock:(void (^)(UIViewController *))whenFoundBlock unfoundPushControllerUsingBlock:(UIViewController * (^)())whenNotFoundBlock enumerateChildViewControllers:(BOOL)enumerateChildViewControllers {
    
    BOOL ret = NO;
    for (UIViewController *popViewController in self.viewControllers) {
        if ([popViewController isKindOfClass:viewControllerClass]) {
            [self popToViewController:popViewController animated:animated];
            if (whenFoundBlock) {
                whenFoundBlock(popViewController);
            }
            ret = YES;
            if (enumerateChildViewControllers) {
                if (!ret) {
                    for (UIViewController *childViewController in popViewController.childViewControllers) {
                        if ([childViewController isKindOfClass:viewControllerClass]) {
                            [self popToViewController:popViewController animated:animated];
                            if (whenFoundBlock) {
                                whenFoundBlock(popViewController);
                            }
                            ret = NO;
                            break;
                        }
                    }
                }
            }
            break;
        }
    }
    if (ret) {
        if (whenNotFoundBlock) {
            UIViewController *detailViewController = whenNotFoundBlock();
            if (detailViewController) {
                [self pushViewController:detailViewController animated:animated];
            }
        }
    }
    return self.viewControllers;
}

@end
