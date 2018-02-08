//
//  JuanRouter.h
//  Demo-Mediator
//
//  Created by haoyajuan on 2017/8/30.
//  Copyright © 2017年 HYJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIViewController+URLRouter.h"
#import "URLNavigation.h"


@interface JuanRouter : NSObject
@property (nonatomic,strong) NSDictionary *configList;



+ (instancetype)shareManager;

+ (UIViewController *)openControllerWithURL:(NSString*)url;

//+ (void)pushVCWithUrl:(NSString *)urlString animated:(BOOL)animated;

@end
