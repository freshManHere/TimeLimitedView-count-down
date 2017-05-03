//
//  RTimeLimitedView.h
//
//  Created by csh on 16/9/6.
//  Copyright © 2016年 csh. All rights reserved.
//  

#import <UIKit/UIKit.h>


/**
 倒计时结束时会发的通知key
 */
#define kConstNotificationEventTimeOver @"kConstNotificationEventTimeOver"

@interface RTimeLimitedView : UIView


/**
 终点时间
 */
@property (nonatomic,assign) NSTimeInterval endTime;


/**
 （只读）定时器
 */
@property (nonatomic,strong,readonly) NSTimer *timer;


/**
 主题色 背景颜色 默认为orange
 */
@property (nonatomic,strong)UIColor *themeColor;

/**
 字体颜色 默认orange
 */
@property (nonatomic,strong)UIColor *textColor;

/**
 点的颜色 默认为orange
 */
@property (nonatomic,strong)UIColor *dotColor;

@end
