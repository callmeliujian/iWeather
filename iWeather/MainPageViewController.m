//
//  MainPageViewController.m
//  iWeather
//
//  Created by 👫 on 16/1/13.
//  Copyright © 2016年 刘健. All rights reserved.
//

#import "MainPageViewController.h"
#import "AppDelegate.h"
#import "iWAddLocalTableViewController.h"
#import "iWDrawLineView.h"
#import <Masonry/Masonry.h>
#import <AFNetworking.h>
#import "MJExtension.h"
#import "iWWratherData.h"
#import "iWWeatherDataResults.h"
#import "iWWeatherDataResultsIndex.h"
#import "iWWeatherDataResultWeather_data.h"
#import "iWUltravioletraysView.h"
#import "iWPm25View.h"
#import "iWDressingIndexView.h"


#define vBackBarButtonItemName  @"backArrow.png"    //导航条返回默认图片名

#define temperatureFontName @"HiraKakuProN-W3"
#define temperatureFontSize 95
#define hightemperatureFontName @"HiraKakuProN-W3"
#define hightemperatureFontSize 11
#define lowhtemperatureFontName @"HiraKakuProN-W3"
#define lowtemperatureFontSize 11
#define sunORcloudFontName @"HiraKakuProN-W3"
#define sunORcloudFontSize 20
#define windFontName @"HiraKakuProN-W3"
#define windFontSize 15
#define ziwaixianFontName @"HiraKakuProN-W3"
#define ziwaixoanFontSize 17
#define pm25FontName @"HiraKakuProN-W3"
#define pm25FontSize 14
#define clothesFontName @"HiraKakuProN-W3"
#define clothesFontSize 14





@interface MainPageViewController ()<UITableViewDataSource,UITableViewDelegate>

{
    int i;
    
    id value1;
    
    UIImageView *blade_big;
    UIImageView *blade_s;
    
    NSMutableDictionary *weather;
    
    NSMutableDictionary *tmpDic;
    
    UITableViewCell* cell1;
    
    UILabel *temperature;
    UIImageView *color1;
    UIImageView *color2;
    UIImageView *color3;
    UIImageView *leftimage;
    UILabel *zuigaoqiwen;
    UIImageView *rightimage;
    UILabel *zuidiqiwen;
    UIImageView *sunORcloudimage;
    UILabel *sunORcloud;
    NSDictionary *responseObject1;
    UILabel *wind;
    UILabel *ziwaixianqiangruo;
    UILabel *pm25;
    UILabel *chuanyilabel;
    
    UIImageView *drawLine;
    
    //    UIImageView *fengsuandqiya;
    //    UIImageView *beijing;
    UIImageView *pmbeijing;
    UIImageView *chuanyibeijing;
    
    NSIndexPath *indexpath;
    
}


/**
 主气温
 */
@property (nonatomic, strong) UILabel *mainTemperatureLabel;

/**
 存储四天中的最高气温
 */
@property (nonatomic, strong) NSMutableArray *highTemperatureArray;
/**
 存储四天中的最低气温
 */
@property (nonatomic, strong) NSMutableArray *lowTemperatureArray;
/**
 菜单按钮
 */
@property (nonatomic, strong) UIButton *menuBtn;
/**
 当前位置
 */
@property (nonatomic, strong) UILabel *currentLocationLabel;
/**
 当前时间
 */
@property (nonatomic, strong) UILabel *currentTimeLabel;
/**
 添加地区按钮
 */
@property (nonatomic, strong) UIButton *addLocationButton;
/**
 天气图标
 */
@property (nonatomic, strong) UIImageView *weatherIcon;
/**
 天气文字
 */
@property (nonatomic, strong) UILabel *weatherWord;

/**
 摄氏度图标
 */
@property (nonatomic, strong) UIImageView *circleLabel;
/**
 最高气温变化图标
 */
@property (nonatomic, strong) UIImageView *maximumTemperatureChangeLabel;
/**
 最高气温
 */
@property (nonatomic, strong) UILabel *highestTemperatureLabel;
/**
 最低气温变化图标
 */
@property (nonatomic, strong) UIImageView *minimumTemperatureChangeLabel;
/**
 最低气温
 */
@property (nonatomic, strong) UILabel *lowestTemperatureLabel;
/**
 最高气温摄氏度图标
 */
@property (nonatomic, strong) UIImageView *highestCircleLabel;
/**
 最低气温摄氏度图标
 */
@property (nonatomic, strong) UIImageView *lowestCircleLabel;
/**
 风速和起亚
 */
@property (nonatomic, strong) UIImageView *windSpeedAndPressureImageView;
/**
 紫外线强度背景
 */
@property (nonatomic, strong) UIImageView *UltravioletraysImageView;
/**
 紫外线强度文字
 */
@property (nonatomic, strong) UILabel *UltravioletraysLabel;
/**
 紫外线强度
 */
@property (nonatomic, strong) iWUltravioletraysView *ultravioletraysView;
/**
 pm25指数
 */
@property (nonatomic, strong) iWPm25View *pm25View;
/**
 穿衣指数
 */
@property (nonatomic, strong) iWDressingIndexView *dressingIndexView;






@end

@implementation MainPageViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    indexpath = [[NSIndexPath alloc] initWithIndex:1];
    
    
    
    weather = [[NSMutableDictionary alloc] init];
    
    tmpDic = [[NSMutableDictionary alloc] init];
    
    self.highTemperatureArray = [[NSMutableArray alloc] init];
    self.lowTemperatureArray = [[NSMutableArray alloc] init];
    
    
    self.title = @"主界面";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageview.image = [UIImage imageNamed:@"clear_d_portrait"];
    
    mytable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height) style:UITableViewStylePlain];
    
    mytable.dataSource = self;
    mytable.delegate = self;
    mytable.allowsSelection = NO;
    
    mytable.backgroundColor = [UIColor clearColor];
    //加载紫外线View的xib
    self.ultravioletraysView = [[[NSBundle mainBundle] loadNibNamed:@"iWUltravioletraysView" owner:nil options:nil] lastObject];
    //加载pm2.5View的xib
    self.pm25View = [[[NSBundle mainBundle] loadNibNamed:@"iWPm25View" owner:nil options:nil] lastObject];
    //加载穿衣指数View的xib
    self.dressingIndexView = [[[NSBundle mainBundle] loadNibNamed:@"iWDressingIndexView" owner:nil options:nil] lastObject];
    
    
    [self.view addSubview:imageview];
    [self.view addSubview:mytable];
    
    
}

-(void)viewDidAppear:(BOOL)animated{
    animated = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jieshou:) name:@"fanhui" object:nil];
    [self getWeather];
    [self tableView:mytable heightForRowAtIndexPath:nil];
}


//每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    //return [shuju count];
    
    return 3;
    
}

//每行样式
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //设置cell
    static NSString* cellID = @"mycell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    //防止重叠
    NSArray* vv = [cell.contentView subviews];
    for (UIView*cc in vv) {
        [cc removeFromSuperview];
    }
    //设置cell的背景色为透明
    cell.backgroundColor = [UIColor clearColor];
    
    if (indexPath.row==0){
        //菜单按钮添加
        self.menuBtn = [[UIButton alloc] init];
        self.menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.menuBtn setBackgroundImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
        [self.menuBtn addTarget:self action:@selector(openOrCloseLeftList) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:self.menuBtn];
        [self.menuBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(cell.contentView).offset(10);
        }];
        
        //显示地区
        self.search = @"哈尔滨";
        
        self.currentLocationLabel = [[UILabel alloc] init];
        self.currentLocationLabel.font = [UIFont systemFontOfSize:16];
        NSString *str = @"哈尔滨";
        self.currentLocationLabel.text = str;
        self.currentLocationLabel.textColor = [UIColor whiteColor];
        [self.currentLocationLabel setFont:[UIFont fontWithName:@"Arial" size:17]];
        self.currentLocationLabel.numberOfLines = 0;
        self.currentLocationLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        CGSize maximumLabelSize = CGSizeMake(100, 9999);
        CGSize expectSize = [self.currentLocationLabel sizeThatFits:maximumLabelSize];
        [self.view addSubview:self.currentLocationLabel];
        [self.currentLocationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(CGPointMake(0, -([UIScreen mainScreen].bounds.size.height)/2 + expectSize.height));
            make.size.mas_equalTo(CGSizeMake(expectSize.width, expectSize.height));
        }];
        
        //添加时间
        NSDateFormatter *currentTimeFormatter = [[NSDateFormatter alloc] init];
        [currentTimeFormatter setDateFormat:@"h:mm"];
        NSDate *date = [NSDate date];
        NSString *currentTime = [currentTimeFormatter stringFromDate:date];
        
        self.currentTimeLabel = [[UILabel alloc] init];
        self.currentTimeLabel.font = [UIFont systemFontOfSize:16];
        self.currentTimeLabel.text = currentTime;
        self.currentTimeLabel.textColor = [UIColor whiteColor];
        [self.currentTimeLabel setFont:[UIFont fontWithName:@"Arial" size:17]];
        self.currentTimeLabel.numberOfLines = 0;
        self.currentTimeLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        CGSize currentTimeLabelExpectSize = [self.currentTimeLabel sizeThatFits:maximumLabelSize];
        [self.view addSubview:self.currentTimeLabel];
        [self.currentTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(-9);
            make.centerY.mas_equalTo(self.currentLocationLabel.mas_bottom).offset(10);
            make.size.mas_equalTo(CGSizeMake(currentTimeLabelExpectSize.width, currentTimeLabelExpectSize.height));
        }];
        
        //添加地区按钮
        
        self.addLocationButton = [[UIButton alloc] init];
        self.addLocationButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.addLocationButton setBackgroundImage:[UIImage imageNamed:@"editlocplus"] forState:UIControlStateNormal];
        [self.addLocationButton addTarget:self action:@selector(plushLocal) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:self.addLocationButton];
        [self.addLocationButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(cell.contentView).offset(10);
            make.right.equalTo(cell.contentView).offset(-10);
        }];
        
        //设置天气图标
        
        self.weatherIcon = [[UIImageView alloc] init];
        self.weatherIcon.image = [UIImage imageNamed:@"sun"];
        [cell.contentView addSubview:self.weatherIcon];
        [self.weatherIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(cell.contentView).offset(20);
            make.bottom.mas_equalTo(cell.contentView).offset(-150);
            make.size.mas_equalTo(CGSizeMake(25, 25));
        }];
        
        //天气文字
        self.weatherWord = [[UILabel alloc] init];
        [self.weatherWord setFont:[UIFont fontWithName:sunORcloudFontName size:sunORcloudFontSize]];
        self.weatherWord.text = @"晴天";
        self.weatherWord.textColor = [UIColor whiteColor];
        [cell.contentView addSubview:self.weatherWord];
        [self.weatherWord mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.weatherIcon);
            make.left.mas_equalTo(self.weatherIcon).offset(30);
        }];
        
        //主气温显示
        
        self.mainTemperatureLabel = [[UILabel alloc] init];
        [self.mainTemperatureLabel setFont:[UIFont fontWithName:temperatureFontName size:temperatureFontSize]];
        self.mainTemperatureLabel.text = @"72";
        self.mainTemperatureLabel.textColor = [UIColor whiteColor];
        [cell.contentView addSubview:self.mainTemperatureLabel];
        [self.mainTemperatureLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(cell.contentView).offset(-20);
            make.left.mas_equalTo(cell.contentView).offset(15);
        }];
        
        //摄氏度图标显示
        
        self.circleLabel = [[UIImageView alloc] init];
        self.circleLabel.image = [UIImage imageNamed:@"circle"];
        [cell.contentView addSubview:self.circleLabel];
        [self.circleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mainTemperatureLabel);
            make.left.mas_equalTo(self.mainTemperatureLabel.mas_right).offset(0);
        }];
        
        //最高气温变化图标
        
        self.maximumTemperatureChangeLabel = [[UIImageView alloc] init];
        self.maximumTemperatureChangeLabel.image = [UIImage imageNamed:@"high"];
        [cell.contentView addSubview:self.maximumTemperatureChangeLabel];
        [self.maximumTemperatureChangeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(cell.contentView).offset(25);
            make.bottom.mas_equalTo(self.mainTemperatureLabel.mas_top).offset(-10);
        }];
        
        //最高气温显示
        
        self.highestTemperatureLabel = [[UILabel alloc] init];
        [self.highestTemperatureLabel setFont:[UIFont fontWithName:hightemperatureFontName size:hightemperatureFontSize]];
        self.highestTemperatureLabel.text = @"72";
        self.highestTemperatureLabel.textColor = [UIColor whiteColor];
        [cell.contentView addSubview:self.highestTemperatureLabel];
        [self.highestTemperatureLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.maximumTemperatureChangeLabel).offset(3);
            make.left.mas_equalTo(self.maximumTemperatureChangeLabel.mas_right).offset(15);
        }];
        
        //最高气温摄氏度图标
        //    self.highestCircleLabel = [[UIImageView alloc] init];
        //    self.highestCircleLabel.image = [UIImage imageNamed:@"circle"];
        //    [cell.contentView addSubview:self.highestCircleLabel];
        //    [self.circleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.top.mas_equalTo(self.highestTemperatureLabel);
        //        make.left.mas_equalTo(self.highestTemperatureLabel.mas_right).offset(0);
        //        //make.size.mas_equalTo(CGSizeMake(3,3));
        //    }];
        
        //最低气温变化图标
        self.minimumTemperatureChangeLabel = [[UIImageView alloc] init];
        self.minimumTemperatureChangeLabel.image = [UIImage imageNamed:@"low"];
        [cell.contentView addSubview:self.minimumTemperatureChangeLabel];
        [self.minimumTemperatureChangeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.highestTemperatureLabel.mas_right).offset(15);
            make.top.mas_equalTo(self.maximumTemperatureChangeLabel);
        }];
        
        //最低气温显示
        self.lowestTemperatureLabel = [[UILabel alloc] init];
        [self.lowestTemperatureLabel setFont:[UIFont fontWithName:hightemperatureFontName size:hightemperatureFontSize]];
        self.lowestTemperatureLabel.text = @"72";
        self.lowestTemperatureLabel.textColor = [UIColor whiteColor];
        [cell.contentView addSubview:self.lowestTemperatureLabel];
        [self.lowestTemperatureLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.minimumTemperatureChangeLabel).offset(3);
            make.left.mas_equalTo(self.minimumTemperatureChangeLabel.mas_right).offset(15);
        }];
        
    }else if (indexPath.row == 1){
        //风速和气压显示
        self.windSpeedAndPressureImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 360, 170)];
        self.windSpeedAndPressureImageView.image = [UIImage imageNamed:@"windSpeedAndPressure"];
        
        UIImageView *bigpole = [[UIImageView alloc] initWithFrame:CGRectMake(40, 80, 10, 70)];
        bigpole.image = [UIImage imageNamed:@"bigpole"];
        blade_big = [[UIImageView alloc] initWithFrame:CGRectMake(20, 55, 50, 50)];
        blade_big.image = [UIImage imageNamed:@"blade_big"];
        
        UIImageView *smallpole = [[UIImageView alloc] initWithFrame:CGRectMake(80, 100, 8, 50)];
        smallpole.image = [UIImage imageNamed:@"smallpole"];
        blade_s = [[UIImageView alloc] initWithFrame:CGRectMake(69, 88, 30, 30)];
        blade_s.image = [UIImage imageNamed:@"blade_s"];
        
        [self.windSpeedAndPressureImageView addSubview:bigpole];
        [self.windSpeedAndPressureImageView addSubview:blade_big];
        [self.windSpeedAndPressureImageView addSubview:smallpole];
        [self.windSpeedAndPressureImageView addSubview:blade_s];
        
        self.windSpeedAndPressureImageView.hidden = [self switchHuode:@"fengsuqiya.txt"];
        
        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(windMillTurn) userInfo:nil repeats:YES];
        
        
        //紫外线强度
        self.ultravioletraysView.frame = CGRectMake(5, 180, 360, 39);
        [cell.contentView addSubview:self.ultravioletraysView];
//        self.ultravioletraysView.hidden = [self switchHuode:@"ziwaixian.txt"];

        //pm25View添加
//        pmbeijing = [[UIImageView alloc] initWithFrame:CGRectMake(5, 225, 360, 40)];
//        pmbeijing.image = [UIImage imageNamed:@"beijing"];
//        
//        UILabel *pm = [[UILabel alloc] initWithFrame:CGRectMake(1, 5, 200, 30)];
//        pm.textColor = [UIColor whiteColor];
//        pm.text = @"pm2.5指数:";
//        [pm setBackgroundColor:[UIColor clearColor]];
//        [pmbeijing addSubview:pm];
//        
//        
//        pm25 = [[UILabel alloc] initWithFrame:CGRectMake(300, 5, 30, 30)];
//        pm25.textColor = [UIColor whiteColor];
//        [pm25 setFont:[UIFont fontWithName:pm25FontName size:pm25FontSize]];
//        [pm25 setNumberOfLines:0];
//        [pm25 setBackgroundColor:[UIColor clearColor]];
//        
//        pm25.text = [[[responseObject1 objectForKey:@"results"] objectAtIndex:0] objectForKey:@"pm25"];
//        [pmbeijing addSubview:pm25];
//        
//        
//        //        [cell.contentView addSubview:pmbeijing];
//        pmbeijing.hidden = [self switchHuode:@"pm25.txt"];
        self.pm25View.frame = CGRectMake(5, 225, 360, 39);
        [cell.contentView addSubview:self.pm25View];
        
        self.dressingIndexView.frame = CGRectMake(1, 10, 50, 50);
        [cell.contentView addSubview:self.dressingIndexView];
//
//        UIImageView *clothes = [[UIImageView alloc] initWithFrame:CGRectMake(1, 10, 50, 50)];
//        clothes.image = [UIImage imageNamed:@"clothes"];
//        
//        for (int j = 0; j < [[[[responseObject1 objectForKey:@"results"] objectAtIndex:0] objectForKey:@"index"] count]; j++) {
//            for (id key in [[[[responseObject1 objectForKey:@"results"] objectAtIndex:0] objectForKey:@"index"] objectAtIndex:j]) {
//                id value = [[[[[responseObject1 objectForKey:@"results"] objectAtIndex:0] objectForKey:@"index"] objectAtIndex:j] objectForKey:key];
//                
//                if ([key isEqualToString:@"des"] && j == 0) {
//                    
//                    chuanyilabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 5, 290, 50)];
//                    chuanyilabel.textColor = [UIColor whiteColor];
//                    chuanyilabel.font = [UIFont fontWithName:clothesFontName size:clothesFontSize];
//                    [chuanyilabel setNumberOfLines:3];
//                    chuanyilabel.text = value;
//                    [chuanyibeijing addSubview:chuanyilabel];
//                    
//                }
//                
//            }
//            
//        }
//        
//        [chuanyibeijing addSubview:clothes];
//        //        [cell.contentView addSubview:chuanyibeijing];
//        chuanyibeijing.hidden = [self switchHuode:@"chuanyi.txt"];
//        NSLog(@"chuanyibeijing----%f",chuanyibeijing.frame.size.height);
//        
//        CGFloat tmp1 = 5;
//        
//        if (![self switchHuode:@"fengsuqiya.txt"]) {
//            self.windSpeedAndPressureImageView.frame = CGRectMake(5, tmp1, 360, 170);
//            tmp1 = tmp1 + self.windSpeedAndPressureImageView.frame.size.height + 5;
//            [cell.contentView addSubview:self.windSpeedAndPressureImageView];
//        }
//        
//        if (![self switchHuode:@"ziwaixian.txt"]) {
//            self.UltravioletraysImageView.frame = CGRectMake(5, tmp1, 360, 40);
//            tmp1 = tmp1 +self.UltravioletraysImageView.frame.size.height + 5;
//            [cell.contentView addSubview:self.UltravioletraysImageView];
//        }
//        
//        if (![self switchHuode:@"pm25.txt"]) {
//            pmbeijing.frame = CGRectMake(5, tmp1, 360, 40);
//            tmp1 = tmp1 + pmbeijing.frame.size.height + 5;
//            [cell.contentView addSubview:pmbeijing];
//        }
//        
//        if (![self switchHuode:@"chuanyi.txt"]) {
//            chuanyibeijing.frame = CGRectMake(5, tmp1, 360, 80);
//            [cell.contentView addSubview:chuanyibeijing];
//        }
        
    }
    else if (indexPath.row == 2){
//        if ((self.highTemperatureArray == nil && self.lowTemperatureArray == nil)) {
//            drawLine = [[UIImageView alloc] initWithFrame:CGRectMake(5, 20, 360, 180)];
//            drawLine.image = [UIImage imageNamed:@"backgroundofLinegraph"];
//            [cell.contentView addSubview:drawLine];
//        } else {
//            drawLine = [[UIImageView alloc] initWithFrame:CGRectMake(5, 20, 360, 180)];
//            drawLine.image = [UIImage imageNamed:@"backgroundofLinegraph_1"];
//            iWDrawLineView *line = [[iWDrawLineView alloc] init];
//            [line setHigh:self.highTemperatureArray];
//            [line setLow:self.lowTemperatureArray];
//            line.backgroundColor = [UIColor clearColor];
//            line.frame = drawLine.frame;
//            [drawLine addSubview:line];
//            [cell.contentView addSubview:drawLine];
//        }
    }
    return cell;
}

-(void)backtemperature{
    // [[NSNotificationCenter defaultCenter] postNotificationName:@"high" object:high];
    //  [[NSNotificationCenter defaultCenter] postNotificationName:@"low" object:low];
}


-(void)windMillTurn{
    
    i++;
    i = i % 18;
    CGAffineTransform traxs = CGAffineTransformMakeRotation(3.14 * 20.0 * i / 180);
    blade_big.transform = traxs;
    blade_s.transform = traxs;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UITableViewCell *cc=[tableView cellForRowAtIndexPath:indexPath];
    
    cc.selectionStyle=UITableViewCellSelectionStyleNone;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        return [[UIScreen mainScreen] bounds].size.height;
    }else if (indexPath.row ==1){
        NSLog(@"********123*************");
        CGFloat fengsuandqiyahigh;
        CGFloat beijinghigh;
        CGFloat pmbeijinghigh;
        CGFloat chuanyibeijinghigh;
        if (self.windSpeedAndPressureImageView.hidden) {
            fengsuandqiyahigh = 0;
            NSLog(@"隐藏");
        }else{
            fengsuandqiyahigh = self.windSpeedAndPressureImageView.frame.size.height;
            NSLog(@"显示");
        }
        
        if (self.UltravioletraysImageView.hidden) {
            beijinghigh = 0;
        }else{
            beijinghigh = self.UltravioletraysImageView.frame.size.height;
        }
        
        if (pmbeijing.hidden) {
            pmbeijinghigh = 0;
        }else{
            pmbeijinghigh = self.UltravioletraysImageView.frame.size.height;
        }
        
        if (chuanyibeijing.hidden) {
            chuanyibeijing = 0;
        }else{
            chuanyibeijinghigh = chuanyibeijing.frame.size.height;
        }
        
        NSLog(@"------%f",fengsuandqiyahigh + beijinghigh + pmbeijinghigh + chuanyibeijinghigh);
        
        if (fengsuandqiyahigh + beijinghigh + pmbeijinghigh + chuanyibeijinghigh != 0) {
            return  fengsuandqiyahigh + beijinghigh + pmbeijinghigh + chuanyibeijinghigh + 10;
        }else{
            return fengsuandqiyahigh + beijinghigh + pmbeijinghigh + chuanyibeijinghigh;
        }
        
        
        
        
    }else {
        return drawLine.frame.size.height + 10 + drawLine.frame.origin.y;
    }
    
}

- (void) openOrCloseLeftList
{
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if (tempAppDelegate.LeftSlideVC.closed)
    {
        [tempAppDelegate.LeftSlideVC openLeftView];
    }
    else
    {
        [tempAppDelegate.LeftSlideVC closeLeftView];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [tempAppDelegate.LeftSlideVC setPanEnabled:NO];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
    NSLog(@"viewWillAppear");
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [tempAppDelegate.LeftSlideVC setPanEnabled:YES];
}

-(void)plushLocal{
    
    iWAddLocalTableViewController *sd = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"plushLocal"];
    
    [self.navigationController pushViewController:sd animated:YES];
    
}

/**
 获取天气数据
 */
- (void)getWeather
{
    NSString *search1 = [[NSString alloc] init];
    search1 = @"北京";
    
    NSString *api = @"http://api.map.baidu.com/telematics/v3/weather?location=";
    NSString *key = @"&output=json&ak=tjWqsCAkIBTnIGXEDHqlNNbl&mcode=com.HeiongjiangUniversity.LiuJian.iWeather";
    NSString *str = [NSString stringWithFormat:@"%@%@%@",api,search1,key];
    
    NSString *cityAddress = [str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:cityAddress  parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",[NSThread currentThread]);
        
        
        [iWWratherData mj_setupObjectClassInArray:^NSDictionary *{
            return @{
                     @"results" : @"iWWeatherDataResults"
                     };
        }];
        
        [iWWeatherDataResults mj_setupObjectClassInArray:^NSDictionary *{
            return @{
                     @"index" : @"iWWeatherDataResultsIndex",
                     @"weather_data" : @"iWWeatherDataResultWeather_data",
                     };
        }];
        
        iWWratherData *resultData = [iWWratherData mj_objectWithKeyValues:responseObject];
        
        // NSLog(@"totalNumber=%@", resultData.status);
        
        NSInteger resultData_Result_Data_Count = 1;
        NSInteger resultData_Result_Index_Count = 1;
        
        for (iWWeatherDataResults *resultData_Result in resultData.results) {
            
            self.currentLocationLabel.text = resultData_Result.currentCity;
            self.pm25View.pm25Label.text = resultData_Result.pm25;
            
            for (iWWeatherDataResultsIndex *resultData_Result_Index in resultData_Result.index) {
                if (resultData_Result_Index_Count == 1) {
                    resultData_Result_Index_Count++;
                }else if (resultData_Result_Index_Count == 2){
                    resultData_Result_Index_Count++;
                }else if (resultData_Result_Index_Count == 3){
                    resultData_Result_Index_Count++;
                }else if (resultData_Result_Index_Count == 4){
                    resultData_Result_Index_Count++;
                }else if (resultData_Result_Index_Count == 5){
                    resultData_Result_Index_Count++;
                }else if (resultData_Result_Index_Count == 6){
                    self.ultravioletraysView.UltravioletraysLabel.text = resultData_Result_Index.zs;
                }
            }
            
            for (iWWeatherDataResultWeather_data *resultData_Result_Data in resultData_Result.weather_data) {
                if (resultData_Result_Data_Count == 1) {
                    //设置主气温数据
                    self.mainTemperatureLabel.text = [self Substring:resultData_Result_Data.date from:@"：" to:@"℃" add:1];
                    //设置最高气温数据
                    self.highestTemperatureLabel.text = [self Substring:resultData_Result_Data.temperature from:@"" to:@" ~" add:0];
                    //将最高气温添加到最高气温可变数组
                    [self.highTemperatureArray addObject:[self Substring:resultData_Result_Data.temperature from:@"" to:@" ~" add:0]];
                    //设置最低气温
                    self.lowestTemperatureLabel.text = [self Substring:resultData_Result_Data.temperature from:@"~ " to:@"℃" add:2];
                    //将最低气温添加到最低气温可变数组
                    [self.lowTemperatureArray addObject:[self Substring:resultData_Result_Data.temperature from:@"~ " to:@"℃" add:2]];
                    //设置天气文字
                    self.weatherWord.text = resultData_Result_Data.weather;
                    resultData_Result_Data_Count++;
                }else if (resultData_Result_Data_Count == 2){
                    //将最高气温添加到最高气温可变数组
                    [self.highTemperatureArray addObject:[self Substring:resultData_Result_Data.temperature from:@"" to:@" ~" add:0]];
                    //将最低气温添加到最低气温可变数组
                    [self.lowTemperatureArray addObject:[self Substring:resultData_Result_Data.temperature from:@"~ " to:@"℃" add:2]];
                    resultData_Result_Data_Count++;
                }else if (resultData_Result_Data_Count == 3){
                    //将最高气温添加到最高气温可变数组
                    [self.highTemperatureArray addObject:[self Substring:resultData_Result_Data.temperature from:@"" to:@" ~" add:0]];
                    //将最低气温添加到最低气温可变数组
                    [self.lowTemperatureArray addObject:[self Substring:resultData_Result_Data.temperature from:@"~ " to:@"℃" add:2]];
                    resultData_Result_Data_Count++;
                }else if (resultData_Result_Data_Count == 4){
                    //将最高气温添加到最高气温可变数组
                    [self.highTemperatureArray addObject:[self Substring:resultData_Result_Data.temperature from:@"" to:@" ~" add:0]];
                    //将最低气温添加到最低气温可变数组
                    [self.lowTemperatureArray addObject:[self Substring:resultData_Result_Data.temperature from:@"~ " to:@"℃" add:2]];
                    resultData_Result_Data_Count++;
                }
            }
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
}

//截取字符串函数
- (NSString *)Substring:(NSString *)str from:(NSString *)str1 to:(NSString *)str2 add:(NSInteger)offset
{
    if ([str1  isEqual: @""]) {
        NSUInteger len = [str rangeOfString:str2].location;
        NSString *msg = [str substringWithRange:NSMakeRange(0, len)];
        return msg;
    }else{
        NSUInteger loc = [str rangeOfString:str1].location + offset;
        NSUInteger len = [str rangeOfString:str2].location - loc;
        NSString *msg = [str substringWithRange:NSMakeRange(loc, len)];
        return msg;
    }
}


-(void)jieshou:(NSNotification*)nn{
    self.search = [nn object];
}

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
