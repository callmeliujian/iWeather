//
//  iWWratherData.h
//  
//
//  Created by 👫 on 16/7/10.
//
//

#import <Foundation/Foundation.h>

@interface iWWratherData : NSObject

/**
 状态
 */
@property (copy, nonatomic) NSString *status;
/**
 结果
 */
@property (strong, nonatomic) NSMutableArray *results;


@property (nonatomic, strong) id colorObserveToken;


@end
