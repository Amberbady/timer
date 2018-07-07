//
//  ViewController.m
//  倒计时Demo
//
//  Created by xunyunedu on 2017/2/26.
//  Copyright © 2017年 xunyunedu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (assign ,nonatomic)NSInteger timeInterval;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.timeInterval = 61;
    [self timeIntervalWithFormatterString:@"yyyy年-MM月-dd日 HH时-mm分-ss秒" andFutureDataString:@"2016年-1月-1日 00时-00分--00秒"] ;
}


// 当我们给时间间隔赋值时,生成定时器
- (void)setTimeInterval:(NSInteger)timeInterval
{
    _timeInterval = timeInterval ;
    if (_timeInterval!=0)
    {
        timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES] ;
    }
}

// 获取时间间隔
- (NSTimeInterval)timeIntervalWithFormatterString : (NSString *)formatterString andFutureDataString : (NSString *)futureDataString
{
    // 获取当前时间
    NSDate *date = [NSDate date] ;
    // 创建时间格式对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init] ;
    // 设置时间格式
    [dateFormatter setDateFormat:formatterString] ;
    // 将你需要的时间格式字符串转化为日期对象
    NSDate *futureDate = [dateFormatter dateFromString:futureDataString] ;
    // 获取当前时间距你所需要时间的时间间隔
    NSTimeInterval timerInterval = [futureDate timeIntervalSinceDate:date] ;
    return timerInterval ;
}

// 每间隔一秒定时器触发执行该方法
- (void)timerAction
{
    // 定时器每次触发 时间间隔减一 也就是说时间间隔依次递减
    _timeInterval -- ;
    [self getTimeFromTimeInterval:_timeInterval] ;
    // 当时间间隔为0时干掉定时器
    if (_timeInterval == 0)
    {
        [timer invalidate] ;
        timer = nil ;
    }
}

// 通过时间间隔计算具体时间(天,小时,分,秒)
- (void)getTimeFromTimeInterval : (NSInteger)timeInterval
{
    // 通过时间间隔获取天数 小时数 分钟数 秒数
    NSInteger ms = timeInterval;
    NSInteger ss = 1;
    NSInteger mi = ss * 60;
    NSInteger hh = mi * 60;
    NSInteger dd = hh * 24;
    
    // 剩余的
    NSInteger day = ms / dd;// 天
    NSInteger hour = (ms - day * dd) / hh;// 时
    NSInteger minute = (ms - day * dd - hour * hh) / mi;// 分
    NSInteger second = (ms - day * dd - hour * hh - minute * mi) / ss;// 秒
    
    self.dayLabel.text = [NSString stringWithFormat:@"%zd天",day];
    self.hourLabel.text = [NSString stringWithFormat:@"%zd时",hour];
    self.minuteLabel.text = [NSString stringWithFormat:@"%zd分",minute];
    NSLog(@"%@", [NSString stringWithFormat:@"%zd分",minute]);
    self.secondLabel.text = [NSString stringWithFormat:@"%zd秒",second];
       NSLog(@"%@", [NSString stringWithFormat:@"%zd秒",second]);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
