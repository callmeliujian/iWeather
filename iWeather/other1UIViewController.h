//
//  other1UIViewController.h
//  iWeather
//
//  Created by 👫 on 16/1/13.
//  Copyright © 2016年 刘健. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface other1UIViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

{
    NSArray *cityName;
    UITableView *cityNameTable;
    NSString *str;
}

@end
