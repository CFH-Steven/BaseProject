//
//  AppDelegate.m
//  BaseProject
//
//  Created by chenfeihong on 2020/2/8.
//  Copyright © 2020 chenfeihong. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()<UITabBarControllerDelegate, CYLTabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
   
    [self wwNetworkConfig];
    // 设置主窗口,并设置根控制器
    self.window = [[UIWindow alloc]init];
    self.window.backgroundColor = kwhite;
    self.window.frame = ScreenFrame;
    [self.window makeKeyAndVisible];
    //跳转到主页
    [self showMain];
    return YES;
}

#pragma mark - Private

/**
 网络配置
 */
- (void)wwNetworkConfig {
    //一次设置全程有效
    [WWNetworkHelper setRequestSerializer:WWRequestSerializerHTTP];
    [WWNetworkHelper setResponseSerializer:WWResponseSerializerJSON];
    [WWNetworkHelper openLog];
    // 实时监测网络状态
    [self monitorNetworkStatus];
    
}

/**
 实时监测网络状态
 */
- (void)monitorNetworkStatus
{
    // 网络状态改变一次, networkStatusWithBlock就会响应一次
    [WWNetworkHelper networkStatusWithBlock:^(WWNetworkStatusType networkStatus) {
        switch (networkStatus) {
            case WWNetworkStatusUnknown:
                // 未知网络
                break;
            case WWNetworkStatusNotReachable:
                 // 无网络
                break;
            case WWNetworkStatusReachableViaWWAN:
                // 手机网络
                break;
            case WWNetworkStatusReachableViaWiFi:
                // 无线网络
                break;
        }
    }];
}


/**
 展示主页
 */
- (void)showMain{
    CYLTabBarControllerConfig *tabBarControllerConfig = [[CYLTabBarControllerConfig alloc] init];
    CYLTabBarController *tabBarController = tabBarControllerConfig.tabBarController;
    tabBarController.selectedIndex = 0;
    self.window.rootViewController = tabBarController;
    tabBarController.delegate = self;
    [tabBarController hideTabBadgeBackgroundSeparator];
}

#pragma mark - Delegate

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    [[self cyl_tabBarController] updateSelectionStatusIfNeededForTabBarController:tabBarController shouldSelectViewController:viewController];
    return YES;
}
@end
