//
//  UIViewController+YJRouter.m
//  Demo-Mediator
//
//  Created by haoyajuan on 2018/2/7.
//  Copyright © 2018年 HYJ. All rights reserved.
//

#import "UIViewController+YJRouter.h"
#import <objc/runtime.h>


@implementation UIViewController (YJRouter)
- (NSDictionary *)params{
    return objc_getAssociatedObject(self, @selector(params));
}
- (void)setParams:(NSDictionary *)params{
    objc_setAssociatedObject(self, @selector(params), params, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (UIViewController *)openWithUrlString:(NSString *)urlString Params:(NSDictionary *)paramDict fromContentFile:(NSDictionary *)configDict{
    //支持中文
    NSString* encodedString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    NSString *encodeStr = [encodedString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *URL = [NSURL URLWithString:encodedString];
    Class vcClass;//类名
    NSString *home = [NSString stringWithFormat:@"%@://%@",URL.scheme,URL.host];
    
    if ([configDict.allKeys containsObject:URL.scheme]) {
        //根据plist文件结构,找到本项目或者模块对应的字典
        NSDictionary *proDict = configDict[URL.scheme];
        if ([proDict.allKeys containsObject:home]) {
            //根据URL生成的key找到控制器的类名
            vcClass = NSClassFromString(proDict[home]);
        }
    }
    UIViewController *VC;
    //处理URL中的参数
    if (vcClass != nil) {
        //创建控制器对象
        VC = [[vcClass alloc]init];
        //解析url中的参数,并给分类中的params赋值
        [VC open:URL withParamsDict:paramDict];
    }
    return VC;
}
- (void)open:(NSURL *)url withParamsDict:(NSDictionary *)params{
    self.params = [self paramsWithURL:url];
    //如果有额外的参数就拼在url参数的后面
    if (params) {
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        [dict addEntriesFromDictionary:self.params];
        [dict addEntriesFromDictionary:params];
        self.params = dict;
    }
}
/**把URL中的参数转化成字典*/
- (NSDictionary *)paramsWithURL:(NSURL *)URL{
    NSMutableDictionary *paramsDict = [NSMutableDictionary dictionary];
    if (NSNotFound != [URL.absoluteString rangeOfString:@"?"].location) {
        //截取出参数字符串
        NSString *paramString = [URL.absoluteString substringFromIndex:[URL.absoluteString rangeOfString:@"?"].location+1];
        paramString = [paramString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

        //把参数用&符号分割成数组
        NSArray *paramsArray = [paramString componentsSeparatedByString:@"&"];
        //把数组中的每一组参数转化成字典
        for (NSString *keyValueStr in paramsArray) {
            if (NSNotFound != [keyValueStr rangeOfString:@"="].location) {
                NSString *key = [keyValueStr substringToIndex:[keyValueStr rangeOfString:@"="].location];
                NSString *value = [keyValueStr substringFromIndex:[keyValueStr rangeOfString:@"="].location+1];
                [paramsDict setValue:value forKey:key];
            }
        }
    }
    return [paramsDict mutableCopy];
}
//@"APPTicket://AAAViewController?name=哈哈&productId=123456"
@end
