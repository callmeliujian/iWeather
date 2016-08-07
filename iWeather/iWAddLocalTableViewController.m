//
//  iWAddLocalTableViewController.m
//  iWeather
//
//  Created by 👫 on 16/1/13.
//  Copyright © 2016年 刘健. All rights reserved.
//

#import "iWAddLocalTableViewController.h"

@interface iWAddLocalTableViewController ()
/**
 搜索栏
 */
@property (nonatomic, strong) UISearchBar *search;
/**
 从cityData.plist文件中获取所有城市名
 */
@property (nonatomic, strong) NSDictionary *cityData;
/**
 临时存储城市名称
 */
@property (nonatomic, strong) NSString *cityName;

@end

@implementation iWAddLocalTableViewController

- (NSDictionary *)cityData
{
    if (!_cityData) {
        NSBundle *bundle = [NSBundle mainBundle];
        NSString *plistPath = [bundle pathForResource:@"cityData" ofType:@"plist"];
        _cityData = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    }
    return _cityData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.search=[[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    [self.search setShowsCancelButton:YES animated:YES];
    self.search.delegate = self;
    self.tableView.tableHeaderView=_search;
}

#pragma -mark 数据源方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSMutableArray *arry = [[NSMutableArray alloc] init];
    
    for (id key in self.cityData) {
        [arry addObject:key];
    }
    
    return [arry count];
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSMutableArray *arry = [[NSMutableArray alloc] init];
    for (id key in self.cityData) {
        [arry addObject:key];
    }
    NSString *groupName = [arry objectAtIndex:section];
    return groupName;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSMutableArray *arry = [[NSMutableArray alloc] init];
    for (id key in self.cityData) {
        [arry addObject:key];
    }
    NSString *groupName = [arry objectAtIndex:section];
    NSArray *listTeams = [self.cityData objectForKey:groupName];
    return [listTeams count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID=@"searchCell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    NSMutableArray *arry = [[NSMutableArray alloc] init];
    for (id key in self.cityData) {
        [arry addObject:key];
    }
    
    NSString *groupName = [arry objectAtIndex:[indexPath section]];
    NSArray *listTeams = [self.cityData objectForKey:groupName];
    cell.textLabel.text = [listTeams objectAtIndex:[indexPath row]];
    return cell;
}

#pragma -mark UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *arry = [[NSMutableArray alloc] init];
    for (id key in self.cityData) {
        [arry addObject:key];
    }
    
    NSString *groupName = [arry objectAtIndex:[indexPath section]];
    NSArray *listTeams = [self.cityData objectForKey:groupName];
    self.cityName = [listTeams objectAtIndex:[indexPath row]];
    
    [self backCityName];
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self backCityName];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    self.cityName = searchText;
}

-(void)backCityName
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"fanhui" object:self.cityName];
    [self addCityToFile:self.cityName];
}

-(void)addCityToFile:(NSString*)cityName
{
    NSString *tmp = [NSString stringWithFormat:@"%@%@",cityName,@"\n"];
    NSString *homePath = NSHomeDirectory();
    NSString *documents = [homePath stringByAppendingPathComponent:@"Documents"];
    NSString *path = [documents stringByAppendingPathComponent:@"city.txt"];
    
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:path];
    [fileHandle seekToEndOfFile];
    NSData*stringData = [tmp dataUsingEncoding:NSUTF8StringEncoding];
    [fileHandle writeData:stringData];
    [fileHandle closeFile];
}

@end
