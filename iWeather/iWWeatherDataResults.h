//
//  iWWeatherDataResults.h
//  iWeather
//
//  Created by 👫 on 16/7/10.
//  Copyright © 2016年 刘健. All rights reserved.
//

#import <Foundation/Foundation.h>

@class iWWeatherDataResultsIndex;

@interface iWWeatherDataResults : NSObject

/**
 当前城市
 */
@property (copy, nonatomic) NSString *currentCity;

@property(strong, nonatomic) NSString *pm25;

@property(strong, nonatomic) NSMutableArray *index;

@property(strong, nonatomic) NSMutableArray *weather_data;

@end
