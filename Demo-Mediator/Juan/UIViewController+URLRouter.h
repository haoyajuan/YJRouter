//
//  UIViewController+URLRouter.h
//  Demo-Mediator
//
//  Created by haoyajuan on 2017/9/7.
//  Copyright © 2017年 HYJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (URLRouter)
@property (nonatomic,strong) NSDictionary *params;

//+ (UIViewController *)openControllerWithURL:(NSString*)url;

/**
 参数拼接在url之中
 */
+ (UIViewController *)openWithUrlString:(NSString *)urlString fromContentFile:(NSDictionary *)configDict;

/**
 支持url之外单独传入一个参数字典
 */
+ (UIViewController *)openWithUrlString:(NSString *)urlString Params:(NSDictionary *)paramDict fromContentFile:(NSDictionary *)configDict;
@end
