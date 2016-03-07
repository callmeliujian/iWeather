//
//  other1UIViewController.m
//  iWeather
//
//  Created by 👫 on 16/1/13.
//  Copyright © 2016年 刘健. All rights reserved.
//

#import "other1UIViewController.h"

@implementation other1UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBarHidden = NO;
    
    str = [[NSString alloc] init];
    cityNameTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, 375, [[UIScreen mainScreen] bounds].size.height)];
    cityNameTable.dataSource = self;
    cityNameTable.delegate = self;
    cityName = [[NSArray alloc] init];
    [self huodeCity];
    
    for (int i = 0; i < [cityName count]; i++) {
        NSLog(@"--cityname--%@",cityName[i]);
    }
    [self.view addSubview:cityNameTable];
    
    NSLog(@"hhhhhh");

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [cityName count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *ids = @"mycell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ids];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ids];
    }
    
    NSArray *vv = [cell.contentView subviews];
    for (UIView *cc in vv) {
        [cc removeFromSuperview];
    }
    
    cell.textLabel.text = cityName[indexPath.row];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"--xuanze--%ld",(long)indexPath.row);
    NSLog(@"--%lu",(unsigned long)[cityName count]);
    if (indexPath.row  != [cityName count] - 2) {
        str = cityName[indexPath.row];
    }
    
    [self back];
}


-(NSArray *)huodeCity{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSString *homePath = NSHomeDirectory();
    NSString *documents = [homePath stringByAppendingPathComponent:@"Documents"];
    NSString *path = [documents stringByAppendingPathComponent:@"city.txt"];
    
    NSData *fileData = [fileManager contentsAtPath:path];
    NSString *content = [[NSString alloc] initWithData:fileData encoding:NSUTF8StringEncoding];
    
    cityName = [content componentsSeparatedByString:@"\n"];
    
    return cityName;
    
}

-(void)back{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"fanhui" object:str];
    NSLog(@"--str--%@",str);
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
