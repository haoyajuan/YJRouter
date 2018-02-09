# YJRouter
解耦组件化工具类,使用运行时机制动态添加参数,使用URL进行页面跳转
### 简介
* 组件化解耦工具类
* 支持使用URL进行页面跳转,使用URL传递参数,URL遵守http协议
* 支持传递特殊格式的参数,比如图片,二进制数据等
* 参数传递方式: 使用关联对象动态的为分类添加属性

### 工具类
**1. 配置对应关系**

创建一个plist文件,使控制器的名称与URL中的Host以键值对的形式一一对应

```objc
<dict>
<key>HYJAPP</key>
<dict>
<key>HYJAPP://AAAViewController</key>
<string>AAAViewController</string>
<key>HYJAPP://BBBViewController</key>
<string>BBBViewController</string>
<key>HYJAPP://CCCViewController</key>
<string>CCCViewController</string>
</dict>
</dict>
```
**2. 添加UIViewController的分类**

解析URL,创建对应的控制器对象,并为参数赋值

```objc
@property (nonatomic,strong) NSDictionary *params;

/**
返回配置文件中url对应的控制器对象,同时会给把url中的参数转化为字典,赋值给分类中的params属性

@param urlString 遵守http协议
@param paramDict 除了url中的参数之外,还可以通过字典传入一些特殊格式的参数
@param configDict 用来对应url和控制器的配置文件
@return url对应的控制器
*/
+ (UIViewController *)openWithUrlString:(NSString*)urlString Params:(NSDictionary *)paramDict fromContentFile:(NSDictionary *)configDict;

```
**3. 创建负责跳转的工具类**

读取配置文件,提供跳转接口

```objc
+ (UIViewController *)openControllerWithURL:(NSString *)url;
+ (UIViewController *)openControllerWithURL:(NSString *)url extraParams:(NSDictionary *)paramDict ;

```
### 使用方式
* 不传参数
```objc
NSString * url = @"HYJAPP://BBBViewController";
UIViewController *vc = [YJRouter openControllerWithURL:url];

```
* 传递普通参数
```objc
NSString * url = @"HYJAPP://AAAViewController?name=哈哈&age=123456";
UIViewController *vc = [YJRouter openControllerWithURL:url];

```

* 传递特殊参数
```objc
NSString * url = @"HYJAPP://CCCViewController?name=哈哈&productId=123456";
NSMutableDictionary *dict = [NSMutableDictionary dictionary];
UIImage *image = [UIImage imageNamed:@"testImag"];
[dict setValue:image forKey:@"image"];
UIViewController *vc = [YJRouter openControllerWithURL:url extraParams:dict];

```

[参考了某位大神的封装,在此基础上简化,小程序猿认为,控制器的弹出方式,还是放在外面更为灵活][2]
[2]: https://github.com/DarielChen/DCURLRouter
