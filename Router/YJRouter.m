//
//  YJRouter.m
//  Demo-Mediator
//
//  Created by haoyajuan on 2018/2/7.
//  Copyright © 2018年 HYJ. All rights reserved.
//

#import "YJRouter.h"
#import "UIViewController+YJRouter.h"

static YJRouter *manager;
@implementation YJRouter
+ (instancetype)shareManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[YJRouter alloc]init];
    });
    return manager;
}

+ (UIViewController *)openControllerWithURL:(NSString *)url extraParams:(NSDictionary *)paramDict{
    UIViewController *vc = [UIViewController openWithUrlString:url Params:paramDict fromContentFile:[YJRouter shareManager].configList];
    return vc;
}
+ (UIViewController *)openControllerWithURL:(NSString *)url{
    UIViewController *vc = [UIViewController openWithUrlString:url Params:nil fromContentFile:[YJRouter shareManager].configList];
    return vc;
}

- (NSDictionary *)configList{
    if (!_configList) {
        NSString *plistPath = [[NSBundle mainBundle]pathForResource:@"Router" ofType:@".plist"];
        NSDictionary *configDict = [NSDictionary dictionaryWithContentsOfFile:plistPath];
        if (configDict) {
            _configList = configDict;
        }else{
            NSLog(@"请按照说明添加对应的plist文件");
        }
    }
    return _configList;
}
@end
