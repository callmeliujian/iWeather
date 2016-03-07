//
//  MainPageViewController.m
//  iWeather
//
//  Created by 👫 on 16/1/13.
//  Copyright © 2016年 刘健. All rights reserved.
//

#import "MainPageViewController.h"
#import "AppDelegate.h"
#import "plushLocalViewController.h"
#import "DrawLine.h"

#define vBackBarButtonItemName  @"backArrow.png"    //导航条返回默认图片名

#define temperatureFontName @"HiraKakuProN-W3"
#define temperatureFontSize 65
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





@interface MainPageViewController ()

{
    int i;
    
    id value1;
    
    NSString *qwer;
    
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
    
    NSMutableArray *high;
    NSMutableArray *low;
    
    UIImageView *drawLine;
    
    UIImageView *fengsuandqiya;
    UIImageView *beijing;
    UIImageView *pmbeijing;
    UIImageView *chuanyibeijing;
    
    NSIndexPath *indexpath;
    
  }

-(UILabel*)setLabes:(UILabel*)label :(NSString*)str :(NSString*)fontName :(CGFloat)fontsize:(UIColor*)fontcolor :(CGFloat)x :(CGFloat)y;

@end

@implementation MainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    indexpath = [[NSIndexPath alloc] initWithIndex:1];
    
    search = [[NSString alloc] init];
    search = @"哈尔滨";
    
    weather = [[NSMutableDictionary alloc] init];
    
    tmpDic = [[NSMutableDictionary alloc] init];
    

    
    temperature = [[UILabel alloc] initWithFrame:CGRectMake(20, 530, 70, 100)];
    temperature.textColor = [UIColor whiteColor];
    [temperature setFont:[UIFont fontWithName:temperatureFontName size:temperatureFontSize]];
    [temperature setNumberOfLines:0];
    [temperature setBackgroundColor:[UIColor clearColor]];
    
    zuigaoqiwen = [[UILabel alloc] initWithFrame:CGRectMake(45, 503, 20, 20)];
    zuigaoqiwen.textColor = [UIColor whiteColor];
    [zuigaoqiwen setFont:[UIFont fontWithName:hightemperatureFontName size:hightemperatureFontSize]];
    [zuigaoqiwen setNumberOfLines:0];
    [zuigaoqiwen setBackgroundColor:[UIColor clearColor]];
    
    zuidiqiwen = [[UILabel alloc] initWithFrame:CGRectMake(103, 503, 20, 20)];
    zuidiqiwen.textColor = [UIColor whiteColor];
    [zuidiqiwen setFont:[UIFont fontWithName:lowhtemperatureFontName size:lowtemperatureFontSize]];
    [zuidiqiwen setNumberOfLines:0];
    [zuidiqiwen setBackgroundColor:[UIColor clearColor]];
    
    sunORcloud = [[UILabel alloc] initWithFrame:CGRectMake(62, 470, 30, 20)];
    sunORcloud.textColor = [UIColor whiteColor];
    [sunORcloud setFont:[UIFont fontWithName:sunORcloudFontName size:sunORcloudFontSize]];
    [sunORcloud setNumberOfLines:0];
    [sunORcloud setBackgroundColor:[UIColor clearColor]];
    
    wind = [[UILabel alloc] initWithFrame:CGRectMake(50, 625 , 10, 20)];
    wind.textColor = [UIColor whiteColor];
    [wind setFont:[UIFont fontWithName:windFontName size:windFontSize]];
    [wind setNumberOfLines:0];
    [wind setBackgroundColor:[UIColor clearColor]];
    
    ziwaixianqiangruo = [[UILabel alloc] initWithFrame:CGRectMake(300, 15, 15, 10)];
    ziwaixianqiangruo.textColor = [UIColor whiteColor];
    [ziwaixianqiangruo setFont:[UIFont fontWithName:ziwaixianFontName size:ziwaixoanFontSize]];
    [ziwaixianqiangruo setNumberOfLines:0];
    [ziwaixianqiangruo setBackgroundColor:[UIColor clearColor]];
    
    high = [[NSMutableArray alloc] initWithCapacity:4];
    low = [[NSMutableArray alloc] initWithCapacity:4];
    
    
    self.title = @"主界面";
    self.view.backgroundColor = [UIColor whiteColor];

    
    
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageview.image = [UIImage imageNamed:@"clear_d_portrait"];
    
    mytable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height) style:UITableViewStylePlain];
    
    mytable.dataSource = self;
    mytable.delegate = self;
    mytable.allowsSelection = NO;
    
    mytable.backgroundColor = [UIColor clearColor];
    
   //[self getWeather];
    
    NSLog(@"*****************************");
    
    

    [self.view addSubview:imageview];
    [self.view addSubview:mytable];
    
    
}

-(void)viewDidAppear:(BOOL)animated{
    animated = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jieshou:) name:@"fanhui" object:nil];
    [self getWeather];
    [self tableView:mytable heightForRowAtIndexPath:nil];
}



//分组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

//每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    //return [shuju count];
    
    return 3;
    
}

//每行样式
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    qwer = [[NSString alloc] init];
    
    formatter1 = [[NSDateFormatter alloc] init];
    [formatter1 setDateFormat:@"MMdd"];
    NSDate * date1 = [NSDate date];
    NSString *formatterDate1 = [formatter1 stringFromDate:date1];
    NSLog(@"%@",formatterDate1);
    
    weatherdate = [[NSMutableString alloc] init];
    
    
    
    
    static NSString* ids = @"mycell";
    
   UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ids];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ids];
    }
    
    //防止重叠
    NSArray* vv = [cell.contentView subviews];
    for (UIView*cc in vv) {
        [cc removeFromSuperview];
    }
    //设置cell的背景色为透明
    cell.backgroundColor = [UIColor clearColor];
    


    if (indexPath.row==0) {
        
        
        
        [cell.contentView addSubview:temperature];
        [cell.contentView addSubview:zuigaoqiwen];
        
        [cell.contentView addSubview:zuidiqiwen];
        
        [cell.contentView addSubview:sunORcloud];
        [cell.contentView addSubview:wind];
        
        
        //"weather_data"
        for (int j = 0; j < [[[[responseObject1 objectForKey:@"results"] objectAtIndex:0] objectForKey:@"weather_data"] count]; j++) {
             //NSLog(@"每天--%@",[[[[responseObject1 objectForKey:@"results"] objectAtIndex:0] objectForKey:@"weather_data"] objectAtIndex:j]);
            NSLog(@"-----------------------------------------------------------------------------");
            for (id key in [[[[responseObject1 objectForKey:@"results"] objectAtIndex:0] objectForKey:@"weather_data"] objectAtIndex:j]) {
                id value = [[[[[responseObject1 objectForKey:@"results"] objectAtIndex:0] objectForKey:@"weather_data"] objectAtIndex:j] objectForKey:key];
                    //NSLog(@"每天情况%@--%@",value,key);
                [tmpDic setObject:value forKey:key];
                if (j == 0 && [key isEqualToString:@"date"]) {
                    
                    for (int k = 0; k < [value length]; k++) {
                        if (([value characterAtIndex:k] >= '0' && [value characterAtIndex:k] <= '9' )|| [value characterAtIndex:k] == '-') {
                            [weatherdate appendFormat:@"%c",[value characterAtIndex:k]];
                            
                        }
                    }
                    
                    //                    NSLog(@"--weatherdate= %@",weatherdate);
                    
                    UIFont *font = [UIFont fontWithName:temperatureFontName size:temperatureFontSize];
                    CGSize size = [[weatherdate substringFromIndex:4] sizeWithFont:font constrainedToSize:CGSizeMake(175, 2000) lineBreakMode:UILineBreakModeWordWrap];
                    CGRect rect = temperature.frame;
                    rect.size = size;
                    [temperature setFrame:rect];
                    [temperature setText:[weatherdate substringFromIndex:4]];
                    temperature.text = [weatherdate substringFromIndex:4];
                    
                    color1 = [[UIImageView alloc] initWithFrame:CGRectMake(temperature.frame.origin.x + temperature.frame.size.width, 530, 15, 15)];
                    color1.image = [UIImage imageNamed:@"circle"];
                    [cell.contentView addSubview:color1];
                    
                    
                    
                }else if (j == 0 && [key isEqualToString:@"temperature"]){
                    //存储“～”位置
                    int tmp = 0;
                    //    NSLog(@"temperature--|%@",value);
                    for (int k = 0; k < [value length]; k++) {
                        if (([value characterAtIndex:k] == '~')) {
                            tmp = k;
                            //     NSLog(@"k=%d",k);
                        }
                    }
                    //当天最高气温
                    NSString *highTemperature = [value substringToIndex:tmp];
                    //  NSLog(@"hig=%@",highTemperature);
                    
                    leftimage = [[UIImageView alloc] initWithFrame:CGRectMake(27, 503, 6, 12)];
                    leftimage.image = [UIImage imageNamed:@"high"];
                    [cell.contentView addSubview:leftimage];
                    
                    UIFont *zuigaoqiwenfont = [UIFont fontWithName:hightemperatureFontName size:hightemperatureFontSize];
                    CGSize zuigaoqiwensize = [highTemperature sizeWithFont:zuigaoqiwenfont constrainedToSize:CGSizeMake(175, 2000) lineBreakMode:UILineBreakModeWordWrap];
                    CGRect zuigaoqiwenrect = zuigaoqiwen.frame;
                    zuigaoqiwenrect.size = zuigaoqiwensize;
                    [zuigaoqiwen setFrame:zuigaoqiwenrect];
                    [zuigaoqiwen setText:highTemperature];
                    zuigaoqiwen.text = highTemperature;
                    // [cell1.contentView addSubview:zuigaoqiwen];
                    
                    color2 = [[UIImageView alloc] initWithFrame:CGRectMake(zuigaoqiwen.frame.origin.x + zuigaoqiwen.size.width, temperature.frame.origin.y - 27, 4, 4)];
                    color2.image = [UIImage imageNamed:@"circle"];
                    [cell.contentView addSubview:color2];
                    
                    //当天最低气温
                    //tmp存最后一个数字的位置
                    int tmp1 = 0;
                    for (int k = tmp; k < [value length]; k++) {
                        if ( ([value characterAtIndex:k] >= '0' && [value characterAtIndex:k] <= '9') || [value characterAtIndex:k] == '-') {
                            tmp1 = k;
                        }
                    }
                    NSRange range = NSMakeRange(tmp + 2, tmp1 - tmp-1);
                    NSString *lowTemperature = [value substringWithRange:range];
                    //NSLog(@"low=%@",lowTemperature);
                    
                    rightimage = [[UIImageView alloc] initWithFrame:CGRectMake(zuigaoqiwen.frame.origin.x + zuigaoqiwen.size.width + 20, temperature.frame.origin.y - 27, 6, 12)];
                    rightimage.image = [UIImage imageNamed:@"low"];
                    [cell.contentView addSubview:rightimage];
                    
                    UIFont *zuidiqiwenfont = [UIFont fontWithName:lowhtemperatureFontName size:lowtemperatureFontSize];
                    CGSize zuidiqiwensize = [lowTemperature sizeWithFont:zuidiqiwenfont constrainedToSize:CGSizeMake(175, 2000) lineBreakMode:UILineBreakModeWordWrap];
                    CGRect zuidiqiwenrect = zuidiqiwen.frame;
                    zuidiqiwenrect.size = zuidiqiwensize;
                    [zuidiqiwen setFrame:zuidiqiwenrect];
                    [zuidiqiwen setText:lowTemperature];
                    zuidiqiwen.text = lowTemperature;
                    //[cell1.contentView addSubview:zuidiqiwen];
                    
                    color3 = [[UIImageView alloc] initWithFrame:CGRectMake(zuidiqiwen.frame.origin.x + zuidiqiwen.frame.size.width + 2, temperature.frame.origin.y - 27, 4, 4)];
                    color3.image = [UIImage imageNamed:@"circle"];
                    [cell.contentView addSubview:color3];
                    
                    
                }else if (j == 0 && [key isEqualToString:@"weather"]){
                    //晴天或阴天提示
                    //NSLog(@"-wer-%@",value);
                    
                    
                    UIFont *sunORcloudfont = [UIFont fontWithName:sunORcloudFontName size:sunORcloudFontSize];
                    CGSize sunORcloudsize = [value sizeWithFont:sunORcloudfont constrainedToSize:CGSizeMake(175, 2000) lineBreakMode:UILineBreakModeWordWrap];
                    CGRect sunOrcloudrect = sunORcloud.frame;
                    sunOrcloudrect.size = sunORcloudsize;
                    [sunORcloud setFrame:sunOrcloudrect];
                    [sunORcloud setText:value];
                    sunORcloud.text = value;
                    
                    if ([value isEqualToString:@"晴"]) {
                         sunORcloudimage = [[UIImageView alloc] initWithFrame:CGRectMake(25, 470, 30, 18)];
                         sunORcloudimage.image = [UIImage imageNamed:@"sun"];
                         [cell.contentView addSubview:sunORcloudimage];
                    }else if ([value isEqualToString:@"多云转晴"]){
                        sunORcloudimage = [[UIImageView alloc] initWithFrame:CGRectMake(25, 470, 30, 18)];
                        sunORcloudimage.image = [UIImage imageNamed:@"cloud"];
                        [cell.contentView addSubview:sunORcloudimage];
                    }else if ([value isEqualToString:@"阵雪"]){
                        sunORcloudimage = [[UIImageView alloc] initWithFrame:CGRectMake(25, 470, 30, 18)];
                        sunORcloudimage.image = [UIImage imageNamed:@"xue"];
                        [cell.contentView addSubview:sunORcloudimage];
                    }else if ([value isEqualToString:@"晴转多云"]){
                        sunORcloudimage = [[UIImageView alloc] initWithFrame:CGRectMake(25, 470, 30, 18)];
                        sunORcloudimage.image = [UIImage imageNamed:@"cloud"];
                        [cell.contentView addSubview:sunORcloudimage];
                    }
                    
                }else if (j == 0 && [key isEqualToString:@"wind"]){
                        NSLog(@"wind--%@",value);
                    
                        UIFont *windfont = [UIFont fontWithName:windFontName size:windFontSize];
                        CGSize windsize = [value sizeWithFont:windfont constrainedToSize:CGSizeMake(175, 2000) lineBreakMode:UILineBreakModeWordWrap];
                        CGRect windrect = wind.frame;
                        windrect.size = windsize;
                        [wind setFrame:windrect];
                        [wind setText:value];
                        wind.text = value;
                    
                    UIImageView *windImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 625, 17, 17)];
                    windImage.image = [UIImage imageNamed:@"windicon"];
                    [cell.contentView addSubview:windImage];
                }
            }
            
        }
        
        //添加地区
        [cell.contentView addSubview:[self setLabe:search :@"Arial" :17 :[UIColor whiteColor]:156 :0]];
        
        //添加时间
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"h:mm"];
        NSDate *date = [NSDate date];
        NSString *formatterDate = [formatter stringFromDate:date];
        NSLog(@"%@",formatterDate);
        [cell.contentView addSubview:[self setLabe:formatterDate :@"Arial" :14 :[UIColor whiteColor] :166 :19]];
        
        UIButton *menuBtn = [[UIButton alloc] init];
        menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        menuBtn.frame = CGRectMake(12, 5, 17, 15);
        [menuBtn setBackgroundImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
        [menuBtn addTarget:self action:@selector(openOrCloseLeftList) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:menuBtn];
        
        UIButton* editlocplus = [[UIButton alloc] init];
        editlocplus = [UIButton buttonWithType:UIButtonTypeCustom];
        editlocplus.frame = CGRectMake(340, 5, 17, 15);
        [editlocplus setBackgroundImage:[UIImage imageNamed:@"editlocplus"] forState:UIControlStateNormal];
        [editlocplus addTarget:self action:@selector(plushLocal) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:editlocplus];
        
        UIImageView *progress_bar = [[UIImageView alloc] initWithFrame:CGRectMake(0, 620, [[UIScreen mainScreen] bounds].size.width, 1)];
        progress_bar.image = [UIImage imageNamed:@"slider-track-maximum"];
        [cell.contentView addSubview:progress_bar];

        
    }else if (indexPath.row == 1){
        
        fengsuandqiya = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 360, 170)];
        fengsuandqiya.image = [UIImage imageNamed:@"fengsuandqiya"];
        
        
        
        UIImageView *bigpole = [[UIImageView alloc] initWithFrame:CGRectMake(40, 80, 10, 70)];
        bigpole.image = [UIImage imageNamed:@"bigpole"];
        blade_big = [[UIImageView alloc] initWithFrame:CGRectMake(20, 55, 50, 50)];
        blade_big.image = [UIImage imageNamed:@"blade_big"];
        
        UIImageView *smallpole = [[UIImageView alloc] initWithFrame:CGRectMake(80, 100, 8, 50)];
        smallpole.image = [UIImage imageNamed:@"smallpole"];
        blade_s = [[UIImageView alloc] initWithFrame:CGRectMake(69, 88, 30, 30)];
        blade_s.image = [UIImage imageNamed:@"blade_s"];
     

        [fengsuandqiya addSubview:bigpole];
        [fengsuandqiya addSubview:blade_big];
        [fengsuandqiya addSubview:smallpole];
        [fengsuandqiya addSubview:blade_s];
        
        fengsuandqiya.hidden = [self switchHuode:@"fengsuqiya.txt"];
        
        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(zhuan:) userInfo:nil repeats:YES];
        
        beijing = [[UIImageView alloc] initWithFrame:CGRectMake(5, 180, 360, 40)];
        beijing.image = [UIImage imageNamed:@"beijing"];
        
        UILabel *ziwaixian = [[UILabel alloc] initWithFrame:CGRectMake(1, 5, 200, 30)];
        ziwaixian.textColor = [UIColor whiteColor];
        ziwaixian.text = @"紫外线强度:";
        [ziwaixian setBackgroundColor:[UIColor clearColor]];
        [beijing addSubview:ziwaixian];
        
        for (int j = 0; j < [[[[responseObject1 objectForKey:@"results"] objectAtIndex:0] objectForKey:@"index"] count]; j++) {
            for (id key in [[[[responseObject1 objectForKey:@"results"] objectAtIndex:0] objectForKey:@"index"] objectAtIndex:j]) {
                id value = [[[[[responseObject1 objectForKey:@"results"] objectAtIndex:0] objectForKey:@"index"] objectAtIndex:j] objectForKey:key];
                
                NSLog(@"index--%@--%@--%d",value,key,j);
                
                if ([key isEqualToString:@"zs"] && j == 5) {
                   
                    UIFont *ziwaixinafont = [UIFont fontWithName:ziwaixianFontName size:ziwaixoanFontSize];
                    CGSize ziwaixiansize = [value sizeWithFont:ziwaixinafont constrainedToSize:CGSizeMake(175, 2000) lineBreakMode:UILineBreakModeWordWrap];
                    CGRect ziwaixianrect = ziwaixianqiangruo.frame;
                    ziwaixianqiangruo.size = ziwaixiansize;
                    [ziwaixianqiangruo setFrame:ziwaixianrect];
                    [ziwaixianqiangruo setText:value];
                    ziwaixianqiangruo.text = @"弱";
                    [beijing addSubview:ziwaixianqiangruo];
                    
                }

            }
            
        }

        
//        [cell.contentView addSubview:beijing];
        beijing.hidden = [self switchHuode:@"ziwaixian.txt"];
        
        pmbeijing = [[UIImageView alloc] initWithFrame:CGRectMake(5, 225, 360, 40)];
        pmbeijing.image = [UIImage imageNamed:@"beijing"];
        
        UILabel *pm = [[UILabel alloc] initWithFrame:CGRectMake(1, 5, 200, 30)];
        pm.textColor = [UIColor whiteColor];
        pm.text = @"pm2.5指数:";
        [pm setBackgroundColor:[UIColor clearColor]];
        [pmbeijing addSubview:pm];
        
//        UIFont *pmfont = [UIFont fontWithName:pm25FontName size:pm25FontSize];
//        CGSize pmsize = [[[[responseObject1 objectForKey:@"results"] objectAtIndex:0] objectForKey:@"pm25"] sizeWithFont:pmfont constrainedToSize:CGSizeMake(175, 2000) lineBreakMode:UILineBreakModeWordWrap];
//        CGRect pmrect = pm25.frame;
//        pm25.size = pmsize;
//        [pm25 setFrame:pmrect];
//        [pm25 setText:[[[responseObject1 objectForKey:@"results"] objectAtIndex:0] objectForKey:@"pm25"]];
        pm25 = [[UILabel alloc] initWithFrame:CGRectMake(300, 5, 30, 30)];
        pm25.textColor = [UIColor whiteColor];
        [pm25 setFont:[UIFont fontWithName:pm25FontName size:pm25FontSize]];
        [pm25 setNumberOfLines:0];
        [pm25 setBackgroundColor:[UIColor clearColor]];

        pm25.text = [[[responseObject1 objectForKey:@"results"] objectAtIndex:0] objectForKey:@"pm25"];
        [pmbeijing addSubview:pm25];

        
//        [cell.contentView addSubview:pmbeijing];
        pmbeijing.hidden = [self switchHuode:@"pm25.txt"];
        
        chuanyibeijing = [[UIImageView alloc] initWithFrame:CGRectMake(5, 270, 360, 80)];
        chuanyibeijing.image = [UIImage imageNamed:@"beijing"];
        
        UIImageView *clothes = [[UIImageView alloc] initWithFrame:CGRectMake(1, 10, 50, 50)];
        clothes.image = [UIImage imageNamed:@"clothes"];
        
        for (int j = 0; j < [[[[responseObject1 objectForKey:@"results"] objectAtIndex:0] objectForKey:@"index"] count]; j++) {
            for (id key in [[[[responseObject1 objectForKey:@"results"] objectAtIndex:0] objectForKey:@"index"] objectAtIndex:j]) {
                id value = [[[[[responseObject1 objectForKey:@"results"] objectAtIndex:0] objectForKey:@"index"] objectAtIndex:j] objectForKey:key];
                
                if ([key isEqualToString:@"des"] && j == 0) {
                    
                    chuanyilabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 5, 290, 50)];
                    chuanyilabel.textColor = [UIColor whiteColor];
                    chuanyilabel.font = [UIFont fontWithName:clothesFontName size:clothesFontSize];
                    [chuanyilabel setNumberOfLines:3];
                    chuanyilabel.text = value;
                    [chuanyibeijing addSubview:chuanyilabel];
                    
                }
                
            }
            
        }
        
        [chuanyibeijing addSubview:clothes];
//        [cell.contentView addSubview:chuanyibeijing];
        chuanyibeijing.hidden = [self switchHuode:@"chuanyi.txt"];
        NSLog(@"chuanyibeijing----%f",chuanyibeijing.frame.size.height);
        
        CGFloat tmp1 = 5;
        
        if (![self switchHuode:@"fengsuqiya.txt"]) {
            fengsuandqiya.frame = CGRectMake(5, tmp1, 360, 170);
            tmp1 = tmp1 + fengsuandqiya.frame.size.height + 5;
            [cell.contentView addSubview:fengsuandqiya];
        }
        
        if (![self switchHuode:@"ziwaixian.txt"]) {
            beijing.frame = CGRectMake(5, tmp1, 360, 40);
            tmp1 = tmp1 +beijing.frame.size.height + 5;
            [cell.contentView addSubview:beijing];
        }
        
        if (![self switchHuode:@"pm25.txt"]) {
            pmbeijing.frame = CGRectMake(5, tmp1, 360, 40);
            tmp1 = tmp1 + pmbeijing.frame.size.height + 5;
            [cell.contentView addSubview:pmbeijing];
        }
        
        if (![self switchHuode:@"chuanyi.txt"]) {
            chuanyibeijing.frame = CGRectMake(5, tmp1, 360, 80);
            [cell.contentView addSubview:chuanyibeijing];
        }
        
        
        
    }else if (indexPath.row == 2){
        
        
        
        
        for (int j = 0; j < [[[[responseObject1 objectForKey:@"results"] objectAtIndex:0] objectForKey:@"weather_data"] count]; j++) {
            NSLog(@"*******************");
            for (id key in [[[[responseObject1 objectForKey:@"results"] objectAtIndex:0] objectForKey:@"weather_data"] objectAtIndex:j]) {
                id value = [[[[[responseObject1 objectForKey:@"results"] objectAtIndex:0] objectForKey:@"weather_data"] objectAtIndex:j] objectForKey:key];
                if ([key isEqualToString:@"temperature"]) {
                    NSLog(@"每天情况%@--%@",value,key);
                    
                    int tmp = 0;
                    //    NSLog(@"temperature--|%@",value);
                    for (int k = 0; k < [value length]; k++) {
                        if (([value characterAtIndex:k] == '~')) {
                            tmp = k;
                            //NSLog(@"k=%d",k);
                        }
                    }
                 //   NSLog(@"high---%@",[value substringToIndex:tmp]);
                    //4天内最高气温
                    [high addObject:[value substringToIndex:tmp]];
                  //4天内最低气温
                    int tmp1 = 0;
                    for (int k = tmp; k < [value length]; k++) {
                        if ( ([value characterAtIndex:k] >= '0' && [value characterAtIndex:k] <= '9') || [value characterAtIndex:k] == '-') {
                            tmp1 = k;
                        }
                    }
                    NSRange range = NSMakeRange(tmp + 2, tmp1 - tmp-1);
                    [low addObject:[value substringWithRange:range]];
                   // NSString *lowTemperature = [value substringWithRange:range];
                }
            }
        }
        
        
        if ((high == nil && low == nil)) {
            
            drawLine = [[UIImageView alloc] initWithFrame:CGRectMake(5, 20, 360, 180)];
            drawLine.image = [UIImage imageNamed:@"12345"];
            
//            DrawLine *line = [[DrawLine alloc] init];
            [cell.contentView addSubview:drawLine];
            
         } else {
             
             drawLine = [[UIImageView alloc] initWithFrame:CGRectMake(5, 20, 360, 180)];
             drawLine.image = [UIImage imageNamed:@"1234"];
             
             DrawLine *line = [[DrawLine alloc] init];
             
             
            [line setHigh:high];
            [line setLow:low];
             line.backgroundColor = [UIColor clearColor];
             line.frame = drawLine.frame;
             [drawLine addSubview:line];
             [cell.contentView addSubview:drawLine];
             
        }
        
       
        
        
    }
    

    
    return cell;
    
}

-(void)backtemperature{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"high" object:high];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"low" object:low];
}


-(void)zhuan:(NSTimer*)nn{
    
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
        if (fengsuandqiya.hidden) {
            fengsuandqiyahigh = 0;
            NSLog(@"隐藏");
        }else{
            fengsuandqiyahigh = fengsuandqiya.frame.size.height;
             NSLog(@"显示");
        }
        
        if (beijing.hidden) {
            beijinghigh = 0;
        }else{
            beijinghigh = beijing.frame.size.height;
        }

        if (pmbeijing.hidden) {
            pmbeijinghigh = 0;
        }else{
            pmbeijinghigh = beijing.frame.size.height;
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
    NSLog(@"viewWillDisappear");
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

-(UILabel*)setLabe:(NSString*)str :(NSString*)fontName :(CGFloat)fontsize:(UIColor*)fontcolor :(CGFloat)x :(CGFloat)y{
    
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont fontWithName:fontName size:fontsize];
    NSString *tmp = str;
    label.text = tmp;
    label.textColor = fontcolor;
    CGSize maximumLabelSize = CGSizeMake(100, 999);
    CGSize expectSize = [label sizeThatFits:maximumLabelSize];
    label.frame = CGRectMake(x, y, expectSize.width, expectSize.height);
    
    return label;
    
}

-(UILabel*)setLabes:(UILabel*)label :(NSString*)str :(NSString*)fontName :(CGFloat)fontsize:(UIColor*)fontcolor :(CGFloat)x :(CGFloat)y{
    
    label.font = [UIFont fontWithName:fontName size:fontsize];
    NSString *tmp = str;
    label.text = tmp;
    label.textColor = fontcolor;
    CGSize maximumLabelSize = CGSizeMake(100, 999);
    CGSize expectSize = [label sizeThatFits:maximumLabelSize];
    label.frame = CGRectMake(x, y, expectSize.width, expectSize.height);
    
    return label;
    
}

-(void)plushLocal{
    
    plushLocalViewController* sd = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"plushLocal"];
    
    [self.navigationController pushViewController:sd animated:YES];
    
}

-(void)getWeather{
    
    NSString *api = @"http://api.map.baidu.com/telematics/v3/weather?location=";
    NSString *key = @"&output=json&ak=tjWqsCAkIBTnIGXEDHqlNNbl&mcode=com.HeiongjiangUniversity.LiuJian.iWeather";
    NSString *str = [NSString stringWithFormat:@"%@%@%@",api,search,key];
    
    NSString *str1 = [str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    ma = [AFHTTPSessionManager manager];
    
    [ma GET:str1  parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //date
        NSLog(@"date--%@--",[responseObject objectForKey:@"date"]);
        [tmpDic setObject:[responseObject objectForKey:@"date"] forKey:@"date"];
        
        //currentCity
        NSLog(@"currentCity--%@--",[[[responseObject objectForKey:@"results"] objectAtIndex:0] objectForKey:@"currentCity"]);
        [tmpDic setObject:[[[responseObject objectForKey:@"results"] objectAtIndex:0] objectForKey:@"currentCity"] forKey:@"currentCity"];
        
        //pm25
        NSLog(@"pm25--%@--",[[[responseObject objectForKey:@"results"] objectAtIndex:0] objectForKey:@"pm25"]);
        [tmpDic setObject:[[[responseObject objectForKey:@"results"] objectAtIndex:0] objectForKey:@"pm25"] forKey:@"pm25"];
        
        responseObject1=responseObject;
        
        [mytable reloadData];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];

   
}

-(void)jieshou:(NSNotification*)nn{
    search = [nn object];
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
