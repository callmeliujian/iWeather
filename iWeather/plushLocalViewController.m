//
//  plushLocalViewController.m
//  iWeather
//
//  Created by 👫 on 16/1/13.
//  Copyright © 2016年 刘健. All rights reserved.
//

#import "plushLocalViewController.h"

@interface plushLocalViewController ()

{
    
    NSMutableArray *shuju;
    NSString *str;
    NSDictionary *dictData;
}

@end

@implementation plushLocalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    str = [[NSString alloc] init];
    
    // Do any additional setup after loading the view.
    
    _search=[[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    
    [_search setShowsCancelButton:YES animated:YES];
    
    _search.delegate = self;
    
    self.tableView.tableHeaderView=_search;
    
    shuju=[[NSMutableArray alloc] init];
    
    [shuju addObject:@"1"];
    [shuju addObject:@"2"];
    [shuju addObject:@"3"];
    [shuju addObject:@"4"];
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"cityData" ofType:@"plist"];
    
    dictData = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    
    
    
    
}

-(void)addCity:(NSString*)cityName{
    
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSUInteger section = [indexPath section];
    NSUInteger row = [indexPath row];
    
    NSMutableArray *arry = [[NSMutableArray alloc] init];
    for (id key in dictData) {
        [arry addObject:key];
    }
    
    NSString *groupName = [arry objectAtIndex:section];
    NSArray *listTeams = [dictData objectForKey:groupName];
    
    
    str = [listTeams objectAtIndex:row];
    [self back];
    [self.navigationController popViewControllerAnimated:YES];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSMutableArray *arry = [[NSMutableArray alloc] init];
    for (id key in dictData) {
        [arry addObject:key];
    }
    
    return [arry count];
    
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    NSMutableArray *arry = [[NSMutableArray alloc] init];
    for (id key in dictData) {
        [arry addObject:key];
    }
    NSString *groupName = [arry objectAtIndex:section];
    return groupName;
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSMutableArray *arry = [[NSMutableArray alloc] init];
    for (id key in dictData) {
        [arry addObject:key];
    }
    
    NSString *groupName = [arry objectAtIndex:section];
    
    NSArray *listTeams = [dictData objectForKey:groupName];
    
    return [listTeams count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *s=@"mm";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:s];
    
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:s];
    }
    
    
    NSUInteger section = [indexPath section];
    NSUInteger row = [indexPath row];
    
    NSMutableArray *arry = [[NSMutableArray alloc] init];
    for (id key in dictData) {
        [arry addObject:key];
    }
    
    NSString *groupName = [arry objectAtIndex:section];
    NSArray *listTeams = [dictData objectForKey:groupName];
    
    cell.textLabel.text = [listTeams objectAtIndex:row];
    
    
    return cell;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self back];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    str = searchText;
}

-(void)back{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"fanhui" object:str];
    [self addCity:str];
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
