//
//  iWWeatherDataResultWeather_data.h
//  iWeather
//
//  Created by 👫 on 16/7/10.
//  Copyright © 2016年 刘健. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface iWWeatherDataResultWeather_data : NSObject

/**
 日期
 */
@property (copy, nonatomic) NSString *date;
/**
 天气
 */
@property (copy, nonatomic) NSString *weather;
/**
 风力
 */
@property (copy, nonatomic) NSString *wind;
/**
 气温
 */
@property (copy, nonatomic) NSString *temperature;

@end