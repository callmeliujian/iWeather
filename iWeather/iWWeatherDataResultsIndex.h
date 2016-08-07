//
//  iWWeatherDataResultsIndex.h
//  iWeather
//
//  Created by 👫 on 16/7/10.
//  Copyright © 2016年 刘健. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface iWWeatherDataResultsIndex : NSObject

/**
 标题
 */
@property (copy, nonatomic) NSString *title;
/**
 气候
 */
@property (copy, nonatomic) NSString *zs;
/**
 指数
 */
@property (copy, nonatomic) NSString *tipt;
/**
 建议
 */
@property (copy, nonatomic) NSString *des;

@end
