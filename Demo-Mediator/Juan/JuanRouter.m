//
//  JuanRouter.m
//  Demo-Mediator
//
//  Created by haoyajuan on 2017/8/30.
//  Copyright © 2017年 HYJ. All rights reserved.
//

#import "JuanRouter.h"

@implementation JuanRouter
static JuanRouter *_instance;
+ (instancetype)shareManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[JuanRouter alloc]init];
    });
    return _instance;
}

+ (UIViewController *)openControllerWithURL:(NSString*)url{
 
    UIViewController *vc =[UIViewController openWithUrlString:url fromContentFile:[JuanRouter shareManager].configList];
//    [URLNavigation pushViewController:vc animated:YES];
    
    
    return vc;
}


- (NSDictionary *)configList{
    if (!_configList) {
        
        NSString *plistPath = [[NSBundle mainBundle]pathForResource:@"Router" ofType:@".plist"];
        NSDictionary *listDict = [[NSDictionary alloc]initWithContentsOfFile:plistPath];
        if (listDict) {
            _configList = listDict;
        }else {
            NSLog(@"请按照说明添加对应的plist文件");
        }
    }
    return _configList;
}


/**
 获取跳转配置的plist文件
 */
+ (void)loadConfigDictFromPlist:(NSString *)pistName {
    NSString *plistPath = [[NSBundle mainBundle]pathForResource:@"Router" ofType:@".plist"];
    NSDictionary *listDict = [[NSDictionary alloc]initWithContentsOfFile:plistPath];
    if (listDict) {
        
    }else {
        NSLog(@"请按照说明添加对应的plist文件");
    }
}
@end
