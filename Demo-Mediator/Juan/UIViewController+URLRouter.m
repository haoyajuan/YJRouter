//
//  UIViewController+URLRouter.m
//  Demo-Mediator
//
//  Created by haoyajuan on 2017/9/7.
//  Copyright © 2017年 HYJ. All rights reserved.
//

#import "UIViewController+URLRouter.h"
#import <objc/runtime.h>

static char Params;

@implementation UIViewController (URLRouter)

- (NSDictionary *)params{
    return objc_getAssociatedObject(self, &Params);
}
- (void)setParams:(NSDictionary *)params{
    objc_setAssociatedObject(self, &Params, params, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


+ (UIViewController *)openWithUrlString:(NSString *)urlString fromContentFile:(NSDictionary *)configDict{
    return [UIViewController openWithStr:urlString Params:nil fromContentFile:configDict];
}

+ (UIViewController *)openWithUrlString:(NSString *)urlString Params:(NSDictionary *)paramDict fromContentFile:(NSDictionary *)configDict{
    return [UIViewController openWithStr:urlString Params:paramDict fromContentFile:configDict];
}

+ (UIViewController *)openWithStr:(NSString *)url Params:(NSDictionary *)paramDict fromContentFile:(NSDictionary *)listDict{
    // 支持对中文字符的编码
    NSString *encodeStr = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    
    url = [encodeStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
    NSURL *URL= [NSURL URLWithString:url];
    
    UIViewController *VC = nil;
    Class class;
    NSString *home;
    home = [NSString stringWithFormat:@"%@://%@",URL.scheme,URL.host];
    
    if ([listDict.allKeys containsObject:URL.scheme]) {
        id config = [listDict objectForKey:URL.scheme];
        if ([config isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dict = (NSDictionary *)config;
            if ([dict.allKeys containsObject:home]) {// 根据key拿到对应的控制器名称
                class = NSClassFromString([dict objectForKey:home]);
            }
        }
        
        if (class != nil) {
            VC = [[class alloc]init];
            [VC open:URL withParamsDict:paramDict];
        }
    }
    return VC;
}
 // 如果自定义url后面有拼接参数,而且又通过query传入了参数,那么优先query传入了参数
- (void)open:(NSURL *)url withParamsDict:(NSDictionary *)params{
    if (params) {
        self.params = params;
    }else {
        self.params = [self paramsURL:url];
    }
}

// 将url的参数部分转化成字典
- (NSDictionary *)paramsURL:(NSURL *)URL {
    //参数的字典
    NSMutableDictionary *paramsDict = [NSMutableDictionary dictionary];
    if (NSNotFound != [URL.absoluteString rangeOfString:@"?"].location) {
        NSString *paramsStr = [URL.absoluteString substringFromIndex:([URL.absoluteString rangeOfString:@"?"].location +1)];
        NSArray *paramsArray = [paramsStr componentsSeparatedByString:@"&"];
        for (NSString *param in paramsArray) {
            if (NSNotFound != [param rangeOfString:@"="].location) {
                NSArray *keyValue = [param componentsSeparatedByString:@"="];
                NSString *key = keyValue[0];
                NSString *value = keyValue[1];
                [paramsDict setValue:value forKey:key];
            }
        }
    }
    return paramsDict;
    
}

@end
