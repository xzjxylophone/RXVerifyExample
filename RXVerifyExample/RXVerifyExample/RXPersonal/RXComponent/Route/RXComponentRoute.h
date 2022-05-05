//
//  RXComponentRoute.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/3/5.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

// https://www.cnblogs.com/oc-bowen/p/6489070.html

/**
 思考如下的问题，平时我们开发中是如何优雅的解决的：
 
 1.3D-Touch功能或者点击推送消息，要求外部跳转到App内部一个很深层次的一个界面。
 比如微信的3D-Touch可以直接跳转到“我的二维码”。“我的二维码”界面在我的里面的第三级界面。或者再极端一点，产品需求给了更加变态的需求，要求跳转到App内部第十层的界面，怎么处理？
 
 2.自家的一系列App之间如何相互跳转？
 如果自己App有几个，相互之间还想相互跳转，怎么处理？
 
 3.如何解除App组件之间和App页面之间的耦合性？
 随着项目越来越复杂，各个组件，各个页面之间的跳转逻辑关联性越来越多，如何能优雅的解除各个组件和页面之间的耦合性？
 
 4.如何能统一iOS和Android两端的页面跳转逻辑？甚至如何能统一三端的请求资源的方式？
 项目里面某些模块会混合ReactNative，Weex，H5界面，这些界面还会调用Native的界面，以及Native的组件。那么，如何能统一Web端和Native端请求资源的方式？
 
 5.如果使用了动态下发配置文件来配置App的跳转逻辑，那么如果做到iOS和Android两边只要共用一套配置文件？ // 解决
 
 6.如果App出现bug了，如何不用JSPatch，就能做到简单的热修复功能？   // 解决
 比如App上线突然遇到了紧急bug，能否把页面动态降级成H5，ReactNative，Weex？或者是直接换成一个本地的错误界面？
 
 7.如何在每个组件间调用和页面跳转时都进行埋点统计？每个跳转的地方都手写代码埋点？利用Runtime AOP ？
 
 8.如何在每个组件间调用的过程中，加入调用的逻辑检查，令牌机制，配合灰度进行风控逻辑？
 
 9.如何在App任何界面都可以调用同一个界面或者同一个组件？只能在AppDelegate里面注册单例来实现？
 比如App出现问题了，用户可能在任何界面，如何随时随地的让用户强制登出？或者强制都跳转到同一个本地的error界面？或者跳转到相应的H5，ReactNative，Weex界面？如何让用户在任何界面，随时随地的弹出一个View ？
 
 以上这些问题其实都可以通过在App端设计一个路由来解决。那么我们怎么设计一个路由呢？
 **/

extern NSString *kRXComponetRouteErrorRoute; // 当页面跳转路由没有找到的时候,需要跳转到的错误页面
extern NSString *kRXComponetRouteAsyncDataCompletionKey; // 组件间异步获取数据




//@protocol RXComponentRouteDelegate <NSObject>
//@optional
//- (NSArray *)routeStrategyList;
//@end



@protocol RXComponentRouteRegisterDelegate <NSObject>
+ (void)registerIntoRoute;
@end




@interface RXComponentRoute : NSObject

+ (void)setupWithComponents:(NSArray *)components;

+ (void)updateStrategy:(NSArray *)strategyList;


#pragma mark - register
+ (void)registerViewController:(NSString *)route block:(UIViewController *(^)(NSDictionary *))block;
+ (void)registerSyncData:(NSString *)route block:(NSDictionary *(^)(NSDictionary *))block;
+ (void)registerAsyncData:(NSString *)route block:(void(^)(NSDictionary *))block;




#pragma mark - route
+ (id)routeViewController:(NSString *)route params:(NSDictionary *)params;
+ (id)routeDataSync:(NSString *)route params:(NSDictionary *)params;
+ (void)routeDataAsync:(NSString *)route params:(NSDictionary *)params competion:(void(^)(NSDictionary *))competion;
@end
