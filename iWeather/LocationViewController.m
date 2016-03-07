//
//  LocationViewController.m
//  iWeather
//
//  Created by 👫 on 16/1/21.
//  Copyright © 2016年 刘健. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import "LocationViewController.h"

@interface LocationViewController ()<CLLocationManagerDelegate>

@property (strong,nonatomic)CLLocationManager *locationManager;

@end

@implementation LocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBarHidden = NO;
    
    self.locationManager = [[CLLocationManager alloc]init];
    
    [self.locationManager requestAlwaysAuthorization];
    [self.locationManager requestWhenInUseAuthorization];
    

    [self huodejw];
}

-(void)huodejw{
    
    // 如果定位服务可用
    if([CLLocationManager locationServicesEnabled])
    {
        NSLog( @"开始执行定位服务" );
        // 设置定位精度：最佳精度
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        // 设置距离过滤器为50米，表示每移动50米更新一次位置
        self.locationManager.distanceFilter = 50;
        // 将视图控制器自身设置为CLLocationManager的delegate
        // 因此该视图控制器需要实现CLLocationManagerDelegate协议
        self.locationManager.delegate = self;
        // 开始监听定位信息
        [self.locationManager startUpdatingLocation];
    }
    else
    {
        NSLog( @"无法使用定位服务！" );
    }

    
}

-(void)locationManager:(CLLocationManager *)manager
    didUpdateLocations:(NSArray *)locations
{
    // 获取最后一个定位数据
    CLLocation* location = [locations lastObject];
    // 依次获取CLLocation中封装的经度、纬度、高度、速度、方向等信息。
//    self.latitudeTxt.text = [NSString stringWithFormat:@"%g",
//                             location.coordinate.latitude];
//    self.longitudeTxt.text = [NSString stringWithFormat:@"%g",
//                              location.coordinate.longitude];
//    self.altitudeTxt.text = [NSString stringWithFormat:@"%g",
//                             location.altitude];
//    self.speedTxt.text = [NSString stringWithFormat:@"%g",
//                          location.speed];
//    NSLog(@"~~~~%g" , location.speed);
//    self.courseTxt.text = [NSString stringWithFormat:@"%g",
//                           location.course];
    
    NSLog(@"jd---%g",location.coordinate.latitude);
    NSLog(@"wd---%g",location.coordinate.longitude);
    
    
}
// 定位失败时激发的方法
- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    NSLog(@"定位失败: %@",error);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
