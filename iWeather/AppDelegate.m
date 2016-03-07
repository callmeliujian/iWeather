//
//  AppDelegate.m
//  iWeather
//
//  Created by 👫 on 16/1/13.
//  Copyright © 2016年 刘健. All rights reserved.
//

#import "AppDelegate.h"
#import "MainPageViewController.h"
#import "LeftSortsViewController.h"
#import "NotificationViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];   //设置通用背景颜色
    [self.window makeKeyAndVisible];
    
    MainPageViewController *mainVC = [[MainPageViewController alloc] init];
    self.mainNavigationController = [[UINavigationController alloc] initWithRootViewController:mainVC];
    LeftSortsViewController *leftVC = [[LeftSortsViewController alloc] init];
    self.LeftSlideVC = [[LeftSlideViewController alloc] initWithLeftView:leftVC andMainView:self.mainNavigationController];
    self.window.rootViewController = self.LeftSlideVC;
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor blackColor]];
    
    [self firstconein];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

// 本地通知回调函数，当应用程序在前台时调用
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    NSLog(@"noti:%@",notification);
    
    // 这里真实需要处理交互的地方
    // 获取通知所带的数据
//    NSString *notMess = [notification.userInfo objectForKey:@"key"];
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"本地通知(前台)"
//                                                    message:notMess
//                                                   delegate:nil
//                                          cancelButtonTitle:@"OK"
//                                          otherButtonTitles:nil];
//    [alert show];
//    
//    // 更新显示的徽章个数
    NSInteger badge = [UIApplication sharedApplication].applicationIconBadgeNumber;
    badge--;
    badge = badge >= 0 ? badge : 0;
    [UIApplication sharedApplication].applicationIconBadgeNumber = badge;
    
    // 在不需要再推送时，可以取消推送
    [NotificationViewController cancelLocalNotificationWithKey:@"key"];
}


-(void)firstconein{
    
    NSString *homePath = NSHomeDirectory();
    NSString *documents = [homePath stringByAppendingPathComponent:@"Documents"];
    NSString *path = [documents stringByAppendingPathComponent:@"city.txt"];
    
    NSFileHandle *file = [NSFileHandle fileHandleForReadingAtPath:path];
    
    if (file == nil) {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSData *data = [@"哈尔滨\n" dataUsingEncoding:NSUTF8StringEncoding];
        [fileManager createFileAtPath:path contents:data attributes:nil];
    }
    
    
}


@end
