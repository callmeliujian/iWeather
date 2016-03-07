//
//  otherViewController.m
//  iWeather
//
//  Created by 👫 on 16/1/13.
//  Copyright © 2016年 刘健. All rights reserved.
//

#import "otherViewController.h"

#define FontName @"HiraKakuProN-W3"
#define FontSize 20


@interface otherViewController ()

{
    UISwitch *fengsuqiyaSwitch;
    UISwitch *ziwaixianSwitch;
    UISwitch *pm25Switch;
    UISwitch *chuanyiSwitch;
    
    UILabel *fengsuqiyaLabel;
    UILabel *ziwaixianLabel;
    UILabel *pm25Label;
    UILabel *chuanyiLabel;
}



@end

@implementation otherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBarHidden = NO;
    
    
    fengsuqiyaLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 60, 200, 40)];
    fengsuqiyaLabel.text = @"不显示风速和气压";
    fengsuqiyaLabel.font = [UIFont fontWithName:FontName size:FontSize];
    fengsuqiyaSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(300, 65, 1, 1)];
    [fengsuqiyaSwitch setOn:[self switchHuode:@"fengsuqiya.txt"]];
    [fengsuqiyaSwitch addTarget:self action:@selector(fsqyOpenOrClose) forControlEvents:UIControlEventValueChanged];
    
    
    ziwaixianLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 110, 200, 40)];
    ziwaixianLabel.font = [UIFont fontWithName:FontName size:FontSize];
    ziwaixianLabel.text = @"不显示紫外线指数";
    ziwaixianSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(300, 115, 1, 1)];
    [ziwaixianSwitch setOn:[self switchHuode:@"ziwaixian.txt"]];
    [ziwaixianSwitch addTarget:self action:@selector(zwxOpenOrClose) forControlEvents:UIControlEventValueChanged];
    
    pm25Label = [[UILabel alloc] initWithFrame:CGRectMake(10, 160, 200, 40)];
    pm25Label.font = [UIFont fontWithName:FontName size:FontSize];
    pm25Label.text = @"不显示pm2.5指数";
    pm25Switch = [[UISwitch alloc] initWithFrame:CGRectMake(300, 165, 1, 1)];
    [pm25Switch setOn:[self switchHuode:@"pm25.txt"]];
    [pm25Switch addTarget:self action:@selector(pm25OpenOrClose) forControlEvents:UIControlEventValueChanged];
    
    chuanyiLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 210, 200, 40)];
    chuanyiLabel.font = [UIFont fontWithName:FontName size:FontSize];
    chuanyiLabel.text = @"不显示穿衣指数";
    chuanyiSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(300, 215, 1, 1)];
    [chuanyiSwitch setOn:[self switchHuode:@"chuanyi.txt"]];
    [chuanyiSwitch addTarget:self action:@selector(cyOpenOrClose) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:fengsuqiyaLabel];
    [self.view addSubview:fengsuqiyaSwitch];
    [self.view addSubview:ziwaixianLabel];
    [self.view addSubview:ziwaixianSwitch];
    [self.view addSubview:pm25Label];
    [self.view addSubview:pm25Switch];
    [self.view addSubview:chuanyiLabel];
    [self.view addSubview:chuanyiSwitch];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)fsqyOpenOrClose{
    
    if ([fengsuqiyaSwitch isOn]) {
        [self switchZhuangtai:@"fengsuqiya.txt" :@"YES"];
    }else{
        [self switchZhuangtai:@"fengsuqiya.txt" :@"NO"];
    }
    
}

-(void)zwxOpenOrClose{
    
    if ([ziwaixianSwitch isOn]) {
        [self switchZhuangtai:@"ziwaixian.txt" :@"YES"];
    }else{
        [self switchZhuangtai:@"ziwaixian.txt" :@"NO"];
    }
    
}

-(void)pm25OpenOrClose{
    
    if ([pm25Switch isOn]) {
        [self switchZhuangtai:@"pm25.txt" :@"YES"];
    } else {
        [self switchZhuangtai:@"pm25.txt" :@"NO"];
    }
    
}

-(void)cyOpenOrClose{
    
    if ([chuanyiSwitch isOn]) {
        [self switchZhuangtai:@"chuanyi.txt" :@"YES"];
    } else {
        [self switchZhuangtai:@"chuanyi.txt" :@"NO"];
    }
    
}

//保存按钮状态
-(void)switchZhuangtai:(NSString *)filename :(NSString*)nr{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSString *homePath = NSHomeDirectory();
    NSString *documents = [homePath stringByAppendingPathComponent:@"Documents"];
    NSString *path = [documents stringByAppendingPathComponent:filename];

    NSData *data = [nr dataUsingEncoding:NSUTF8StringEncoding];
    
    [fileManager createFileAtPath:path contents:data attributes:nil];
    
    NSLog(@"-----%@",homePath);
    
}

//获得按钮状态
-(BOOL)switchHuode:(NSString*)filename{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *homePath = NSHomeDirectory();
    NSString *documents = [homePath stringByAppendingPathComponent:@"Documents"];
    NSString *path = [documents stringByAppendingPathComponent:filename];
    NSData *fileDate = [fileManager contentsAtPath:path];
    NSString *content = [[NSString alloc] initWithData:fileDate encoding:NSUTF8StringEncoding];
    if ([content isEqualToString:@"YES"]) {
        return YES;
    } else {
        return NO;
    }
}



@end
