//
//  AppDelegate.h
//  iWeather
//
//  Created by 👫 on 16/1/13.
//  Copyright © 2016年 刘健. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftSlideViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) LeftSlideViewController *LeftSlideVC;
@property (strong, nonatomic) UINavigationController *mainNavigationController;

@end


