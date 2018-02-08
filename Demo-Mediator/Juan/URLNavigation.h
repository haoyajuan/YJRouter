//
//  URLNavigation.h
//  Demo-Mediator
//
//  Created by haoyajuan on 2017/9/11.
//  Copyright © 2017年 HYJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface URLNavigation : NSObject
//@property (nonatomic,strong) UIViewController *currentViewController;

+ (instancetype _Nullable )shareInstance;
+ (void)pushViewController:(UIViewController *_Nullable)viewController animated:(BOOL)animated;
//+ (void)presentViewController:(UIViewController *_Nullable)viewController animated: (BOOL)flag completion:(void (^ __nullable)(void))completion;

@end
