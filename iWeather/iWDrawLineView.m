//
//  iWDrawLineView.m
//  iWeather
//
//  Created by 👫 on 16/1/16.
//  Copyright © 2016年 刘健. All rights reserved.
//

#import "iWDrawLineView.h"

@implementation iWDrawLineView

-(void)drawRect:(CGRect)rect {
    
    UIColor *whiteColor = [UIColor whiteColor];
    UIFont *font = [UIFont boldSystemFontOfSize:10];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(context, kCGLineCapRound);
    //线宽
    CGContextSetLineWidth(context, 1);
    CGContextSetAllowsAntialiasing(context, true);
    //线颜色
    CGContextSetRGBStrokeColor(context, 255, 255, 255, 1);
    //文字颜色
    CGContextSetRGBFillColor(context, 255, 255, 255, 1);
    CGContextBeginPath(context);
    
    //最高气温折线图
    CGContextMoveToPoint(context, 40, 45);
    CGContextAddLineToPoint(context, 130, 45 + [self.high[0] intValue] - [self.high[1] intValue]);
    
    CGContextMoveToPoint(context, 130, 45 + [self.high[0] intValue] - [self.high[1] intValue]);
    CGContextAddLineToPoint(context, 220, 45 + [self.high[0] intValue] - [self.high[1] intValue] + [self.high[1] intValue] - [self.high[2] intValue]);
    
    CGContextMoveToPoint(context, 220, 45 + [self.high[0] intValue] - [self.high[1] intValue] + [self.high[1] intValue] - [self.high[2] intValue]);
    CGContextAddLineToPoint(context, 310, 45 + [self.high[0] intValue] - [self.high[1] intValue] + [self.high[1] intValue] - [self.high[2] intValue] + [self.high[2] intValue] - [self.high[3] intValue]);
    CGContextStrokePath(context);
    
    CGContextSetLineWidth(context, 0.5);
    CGContextSetRGBFillColor(context, 255, 255, 255, 1);
    //最高气温变化图
    //折线图显示最高气温的文字
    
    [self.high[0] drawInRect:CGRectMake(40,45, 20, 10) withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:whiteColor}];
    
    //折线的点
    CGContextFillEllipseInRect(context, CGRectMake(40, 42, 6, 6));
    
    [self.high[1] drawInRect:CGRectMake(130, 45 + [self.high[0] intValue] - [self.high[1] intValue], 20, 10) withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:whiteColor}];
    
    CGContextFillEllipseInRect(context, CGRectMake(130, 45 + [self.high[0] intValue] - [self.high[1] intValue] - 3, 6, 6));
    
    [self.high[2] drawInRect:CGRectMake(220, 45 + [self.high[0] intValue] - [self.high[1] intValue] + [self.high[1] intValue] - [self.high[2] intValue], 20, 10) withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:whiteColor}];
    
    CGContextFillEllipseInRect(context, CGRectMake(220, 45 + [self.high[0] intValue] - [self.high[1] intValue] + [self.high[1] intValue] - [self.high[2] intValue] - 3, 6, 6));
    
    [self.high[3] drawInRect:CGRectMake(310, 45 + [self.high[0] intValue] - [self.high[1] intValue] + [self.high[1] intValue] - [self.high[2] intValue] + [self.high[2] intValue] - [self.high[3] intValue], 20, 10) withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:whiteColor}];
    
    CGContextFillEllipseInRect(context, CGRectMake(310, 45 + [self.high[0] intValue] - [self.high[1] intValue] + [self.high[1] intValue] - [self.high[2] intValue] + [self.high[2] intValue] - [self.high[3] intValue] - 3, 6, 6));
    
    
    //最低气温折线图
    CGContextMoveToPoint(context, 40, 135);
    CGContextAddLineToPoint(context, 130, 135 + [self.low[0] intValue] - [self.low[1] intValue]);
    
    CGContextMoveToPoint(context, 130, 135 + [self.low[0] intValue] - [self.low[1] intValue]);
    CGContextAddLineToPoint(context, 220, 135 + [self.low[0] intValue] - [self.low[1] intValue] + [self.low[1] intValue] - [self.low[2] intValue]);
    
    CGContextMoveToPoint(context, 220, 135 + [self.low[0] intValue] - [self.low[1] intValue] + [self.low[1] intValue] - [self.low[2] intValue]);
    CGContextAddLineToPoint(context, 310, 135 + [self.low[0] intValue] - [self.low[1] intValue] + [self.low[1] intValue] - [self.low[2] intValue] + [self.low[2] intValue] - [self.low[3] intValue]);
    
    CGContextStrokePath(context);
    
    [self.low[0] drawInRect:CGRectMake(40,135, 20, 10) withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:whiteColor}];
    
    CGContextFillEllipseInRect(context, CGRectMake(40, 132, 6, 6));
    
    [self.low[1] drawInRect:CGRectMake(130,135 + [self.low[0] intValue] - [self.low[1] intValue], 20, 10) withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:whiteColor}];
    
    CGContextFillEllipseInRect(context, CGRectMake(130, 135 + [self.low[0] intValue] - [self.low[1] intValue] - 3, 6, 6));
    
    [self.low[2] drawInRect:CGRectMake(220, 135 + [self.low[0] intValue] - [self.low[1] intValue] + [self.low[1] intValue] - [self.low[2] intValue], 20, 10) withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:whiteColor}];
    
    CGContextFillEllipseInRect(context, CGRectMake(220, 135 + [self.low[0] intValue] - [self.low[1] intValue] + [self.low[1] intValue] - [self.low[2] intValue] - 3, 6, 6));
    
    [self.low[3] drawInRect:CGRectMake(310, 135 + [self.low[0] intValue] - [self.low[1] intValue] + [self.low[1] intValue] - [self.low[2] intValue] + [self.low[2] intValue] - [self.low[3] intValue], 20, 10) withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:whiteColor}];
    
    CGContextFillEllipseInRect(context, CGRectMake(310, 135 + [self.low[0] intValue] - [self.low[1] intValue] + [self.low[1] intValue] - [self.low[2] intValue] + [self.low[2] intValue] - [self.low[3] intValue] - 3, 6, 6));
}

@end
