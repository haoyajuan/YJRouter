//
//  YJRouter.h
//  Demo-Mediator
//
//  Created by haoyajuan on 2018/2/7.
//  Copyright © 2018年 HYJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface YJRouter : NSObject
@property (nonatomic,strong) NSDictionary *configList;
+ (instancetype)shareManager;

+ (UIViewController *)openControllerWithURL:(NSString *)url;
+ (UIViewController *)openControllerWithURL:(NSString *)url extraParams:(NSDictionary *)paramDict ;
@end
