//
//  UIViewController+YJRouter.h
//  Demo-Mediator
//
//  Created by haoyajuan on 2018/2/7.
//  Copyright © 2018年 HYJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (YJRouter)

@property (nonatomic,strong) NSDictionary *params;

/**
 返回配置文件中url对应的控制器对象,同时会给把url中的参数转化为字典,赋值给分类中的params属性

 @param urlString 遵守http协议
 @param paramDict 除了url中的参数之外,还可以通过字典传入一些特殊格式的参数
 @param configDict 用来对应url和控制器的配置文件
 @return url对应的控制器
 */
+ (UIViewController *)openWithUrlString:(NSString*)urlString Params:(NSDictionary *)paramDict fromContentFile:(NSDictionary *)configDict;
@end
