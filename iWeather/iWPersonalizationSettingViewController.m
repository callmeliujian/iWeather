//
//  iWPersonalizationSettingViewController.m
//  iWeather
//
//  Created by 👫 on 16/7/11.
//  Copyright © 2016年 刘健. All rights reserved.
//

#import "iWPersonalizationSettingViewController.h"

@interface iWPersonalizationSettingViewController ()

@end

@implementation iWPersonalizationSettingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *obj = [[NSBundle mainBundle] loadNibNamed:@"iWPersonalizationSettingViewController" owner:nil options:nil];
    [self.view addSubview:[obj lastObject]];
    
}

@end
