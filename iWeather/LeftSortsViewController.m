//
//  LeftSortsViewController.m
//  iWeather
//
//  Created by 👫 on 16/1/13.
//  Copyright © 2016年 刘健. All rights reserved.
//

#import "LeftSortsViewController.h"
#import "AppDelegate.h"
#import "otherViewController.h"
#import "other1UIViewController.h"
#import "NotificationViewController.h"
#import "LocationViewController.h"
#import "location1ViewController.h"
#import "banbenViewController.h"
#import "iWPersonalizationSettingViewController.h"

@interface LeftSortsViewController () <UITableViewDelegate,UITableViewDataSource>

@end

@implementation LeftSortsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageview.image = [UIImage imageNamed:@"leftbackiamge"];
    [self.view addSubview:imageview];
    
    UITableView *tableview = [[UITableView alloc] init];
    self.tableview = tableview;
    tableview.frame = self.view.bounds;
    tableview.dataSource = self;
    tableview.delegate  = self;
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:tableview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Identifier = @"Identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font = [UIFont systemFontOfSize:20.0f];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"个性化设置";
    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"选择城市";
    } else if (indexPath.row == 2) {
        cell.textLabel.text = @"通知功能";
    } else if (indexPath.row == 3) {
        cell.textLabel.text = @"版本";
    }     return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if (indexPath.row == 0) {
        otherViewController *vc = [[otherViewController alloc] init];
        [tempAppDelegate.LeftSlideVC closeLeftView];//关闭左侧抽屉
        
        [tempAppDelegate.mainNavigationController pushViewController:vc animated:NO];
    } else if (indexPath.row == 1) {
        other1UIViewController* vc = [[other1UIViewController alloc] init];
        [tempAppDelegate.LeftSlideVC closeLeftView];//关闭左侧抽屉
        
        [tempAppDelegate.mainNavigationController pushViewController:vc animated:NO];
    } else if (indexPath.row == 2) {
        NotificationViewController *vc = [[NotificationViewController alloc] init];
        [tempAppDelegate.LeftSlideVC closeLeftView];//关闭左侧抽屉
        
        [tempAppDelegate.mainNavigationController pushViewController:vc animated:NO];
    } else if (indexPath.row == 3) {
        banbenViewController *vc = [[banbenViewController alloc] init];
        [tempAppDelegate.LeftSlideVC closeLeftView];//关闭左侧抽屉
        
        [tempAppDelegate.mainNavigationController pushViewController:vc animated:NO];
    }
    
    //    otherViewController *vc = [[otherViewController alloc] init];
    //    [tempAppDelegate.LeftSlideVC closeLeftView];//关闭左侧抽屉
    //
    //    [tempAppDelegate.mainNavigationController pushViewController:vc animated:NO];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 180;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableview.bounds.size.width, 180)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}
@end
