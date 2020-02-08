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
    // 日志配置
    [self logConfig];
    // 网络配置
    [self wwNetworkConfig];
    DLog(@"app init , start running")
    // 设置主窗口,并设置根控制器
    self.window = [[UIWindow alloc]init];
    self.window.backgroundColor = kwhite;
    self.window.frame = ScreenFrame;
    [self.window makeKeyAndVisible];
    //跳转到主页
    [self showMain];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    DLog(@"applicationWillResignActive")
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    DLog(@"applicationDidEnterBackground")
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    DLog(@"applicationWillEnterForeground")
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    DLog(@"applicationDidBecomeActive")
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
   DLog(@"applicationWillTerminate")
}

#pragma mark - Private

/**
 日志信息的配置
 */
- (void)logConfig{
    // 添加DDASLLogger，你的日志语句将被发送到Xcode控制台
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    // 添加DDFileLogger，你的日志语句将写入到一个文件中，默认路径在沙盒的Library/Caches/Logs/目录下，文件名为bundleid+空格+日期.log。
    DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
    fileLogger.rollingFrequency = 60 * 60 * 24;
    fileLogger.logFileManager.maximumNumberOfLogFiles = 10;
    [DDLog addLogger:fileLogger];
}

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
