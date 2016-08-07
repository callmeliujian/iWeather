//
//  NotificationViewController.h
//  iWeather
//
//  Created by 👫 on 16/1/21.
//  Copyright © 2016年 刘健. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotificationViewController : UIViewController

// 设置本地通知
+ (void)registerLocalNotification:(NSInteger)alertTime;
+ (void)cancelLocalNotificationWithKey:(NSString *)key;

@end
