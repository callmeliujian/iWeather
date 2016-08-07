//
//  location1ViewController.h
//  iWeather
//
//  Created by 👫 on 16/1/21.
//  Copyright © 2016年 刘健. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface location1ViewController : UIViewController<MKMapViewDelegate,CLLocationManagerDelegate>

@property(nonatomic,strong) CLLocationManager *locaManager;
-(void)getUSerLocation;
+ (location1ViewController *)sharedManager;

@end
