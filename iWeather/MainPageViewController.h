//
//  MainPageViewController.h
//  iWeather
//
//  Created by 👫 on 16/1/13.
//  Copyright © 2016年 刘健. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <AFNetworking/AFHTTPSessionManager.h>

@interface MainPageViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

{
    UITableView* mytable;
    
    NSMutableArray* shuju;
    
    NSDateFormatter *formatter;
    NSDateFormatter *formatter1;
    
    AFHTTPSessionManager   *ma;
    
    NSString *shishiqiwen;
    
    NSMutableString *weatherdate;
//从添加地址页传过来的地址
    NSString *search;
//    UITableViewCell *cell;

    
    
}

-(UILabel*)setLabe:(NSString*)str :(NSString*)fontName :(CGFloat)fontsize:(UIColor*)fontcolor :(CGFloat)x :(CGFloat)y;

@end
