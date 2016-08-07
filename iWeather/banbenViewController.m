//
//  banbenViewController.m
//  iWeather
//
//  Created by 👫 on 16/1/22.
//  Copyright © 2016年 刘健. All rights reserved.
//

#import "banbenViewController.h"

@interface banbenViewController ()

@end

@implementation banbenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBarHidden = NO;
    
    UILabel *banben = [[UILabel alloc] initWithFrame:CGRectMake(120, 60, 200, 50)];
    banben.text = @"iWeather 1.0";
    banben.textColor = [UIColor blackColor];
    
    [self.view addSubview:banben];
    
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
