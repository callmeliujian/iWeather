//
//  MainPageViewController.h
//  iWeather
//
//  Created by 👫 on 16/1/13.
//  Copyright © 2016年 刘健. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AFHTTPSessionManager;

@interface MainPageViewController : UIViewController

{
    UITableView* mytable;
    
    NSMutableArray* shuju;
    

    NSDateFormatter *formatter1;
    
    AFHTTPSessionManager   *ma;
    
    NSString *shishiqiwen;

//从添加地址页传过来的地址
//    NSString *search;

}

/**
 当前位置
 从添加地址页传过来的地址
 */
@property (nonatomic, strong) NSString *search;


@end
