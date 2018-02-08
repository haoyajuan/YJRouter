//
//  URLNavigation.m
//  Demo-Mediator
//
//  Created by haoyajuan on 2017/9/11.
//  Copyright © 2017年 HYJ. All rights reserved.
//

#import "URLNavigation.h"

@implementation URLNavigation
static URLNavigation *_instance;
+ (instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[URLNavigation alloc]init];
    });
    return _instance;
}

- (UIViewController*)currentViewController {
    UIViewController* rootViewController = [UIApplication sharedApplication].delegate.window.rootViewController;
    return [self currentViewControllerFrom:rootViewController];
}

- (UINavigationController*)currentNavigationViewController {
    UIViewController* currentViewController = self.currentViewController;
    return currentViewController.navigationController;
}

+ (void)pushViewController:(UIViewController *_Nullable)viewController animated:(BOOL)animated{
    UINavigationController *navigationVC = [[URLNavigation shareInstance] currentNavigationViewController];
    [navigationVC pushViewController:viewController animated:YES];
}

// 通过递归拿到当前控制器
- (UIViewController*)currentViewControllerFrom:(UIViewController*)viewController {
    
    if ([viewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController* navigationController = (UINavigationController *)viewController;
        return [self currentViewControllerFrom:navigationController.viewControllers.lastObject];
    } // 如果传入的控制器是导航控制器,则返回最后一个
    else if([viewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController* tabBarController = (UITabBarController *)viewController;
        return [self currentViewControllerFrom:tabBarController.selectedViewController];
    } // 如果传入的控制器是tabBar控制器,则返回选中的那个
    else if(viewController.presentedViewController != nil) {
        return [self currentViewControllerFrom:viewController.presentedViewController];
    } // 如果传入的控制器发生了modal,则就可以拿到modal的那个控制器
    else {
        return viewController;
    }
}

@end
