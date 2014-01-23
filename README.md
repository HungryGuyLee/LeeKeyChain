# LeeKeychainManager

因为有项目用到keychain，但是官方的例子 [GenericKeychain](https://developer.apple.com/library/ios/samplecode/GenericKeychain/Introduction/Intro.html) 不够简单明了，所以自己看了文档，写了一个类，轻量的实现自己的需求

## 使用方法

1. 添加 `Security.framework` 框架
2. 导入文件 `KeychainManager.h` 和 `KeychainManager.m` 

相关的函数

```objective-c
+(NSMutableDictionary *)KeychainQueryDictionaryWithService:(NSString *)service;
+(void)saveObject:(id)data withService:(NSString *)service;
+(id)loadObjectWithService:(NSString *)service;
+(void)removeWithService:(NSString *)service;
+(void)list;
```

这里是头文件  叮叮叮 ([KeychainManager.h](https://github.com/HungryGuyLee/LeeLibWithOC/blob/master/Lib/KeychainManager.h) ）

