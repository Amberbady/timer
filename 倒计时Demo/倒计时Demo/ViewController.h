//
//  ViewController.h
//  倒计时Demo
//
//  Created by xunyunedu on 2017/2/26.
//  Copyright © 2017年 xunyunedu. All rights reserved.
//

#import <UIKit/UIKit.h>
#define TIMELABELWIDTH 40
#define HEIGHT 40
#define COLONLABELWIDTH 10
#define Y 0
@interface ViewController : UIViewController
{
    NSTimer *timer ; //定时器
}
// 我们用七个Label来显示 (冒号也算在内)---  天数 : 小时 : 分 : 秒
@property (nonatomic,retain)UILabel *dayLabel ; // 显示天数的Label
@property (nonatomic,retain)UILabel *colonAfterDayLabel ; // 跟在小时后便的冒号
@property (nonatomic,retain)UILabel *hourLabel ; // 显示小时的Label
@property (nonatomic,retain)UILabel *colonAfterHourLabel ; // 跟在小时后便的冒号
@property (nonatomic,retain)UILabel *minuteLabel ; // 显示分钟的Label
@property (nonatomic,retain)UILabel *colonAfterMinuteLabel ; // 跟在分钟后便的label
@property (nonatomic,retain)UILabel *secondLabel ; // 显示秒数的Label

@end

