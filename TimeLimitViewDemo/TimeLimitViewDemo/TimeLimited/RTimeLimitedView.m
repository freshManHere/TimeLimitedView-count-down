//
//  HVTimeLimitedDownView.m
//  xiaoquan
//
//  Created by csh on 16/9/6.
//  Copyright © 2016年 Alex. All rights reserved.
//

#import "RTimeLimitedView.h"
#import "UIView+ViewExtension.h"


@interface RTimeLimitedView ()

@property (nonatomic,strong) UILabel *hourLabel;

@property (nonatomic,strong) UILabel *leftColon;

@property (nonatomic,strong) UILabel *minuteLabel;

@property (nonatomic,strong) UILabel *rightColon;

@property (nonatomic,strong) UILabel *secondLabel;

@end


@implementation RTimeLimitedView

- (void)setEndTime:(NSTimeInterval)endTime
{
    _endTime = endTime;
    
    [self.timer invalidate];
    
    _timer = [NSTimer timerWithTimeInterval:1
                                     target:self
                                   selector:@selector(timeLoop:)
                                   userInfo:nil
                                    repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    [self.timer fire];
}
-(void)setTextColor:(UIColor *)textColor
{
    _textColor = textColor;
    self.hourLabel.textColor = textColor;
    self.minuteLabel.textColor = textColor;
    self.secondLabel.textColor = textColor;
}
-(void)setThemeColor:(UIColor *)themeColor
{
    _themeColor = themeColor;
    self.hourLabel.backgroundColor = themeColor;
    self.minuteLabel.backgroundColor = themeColor;
    self.secondLabel.backgroundColor = themeColor;
}
-(void)setDotColor:(UIColor *)dotColor
{
    _dotColor = dotColor;
    self.leftColon.textColor = dotColor;
    self.rightColon.textColor = dotColor;
}
#pragma mark - Layout
-(void)layoutSubviews
{
    [super layoutSubviews];
    [self reloadCountdown:YES];
}

- (void)reloadCountdown:(BOOL)isInit
{
    
    if (isInit)
    {
        CGFloat otherWidth = self.frame.size.height;
        
        self.hourLabel.frame = CGRectMake(0,
                                          0,
                                          otherWidth,
                                          otherWidth);
        


        
        self.leftColon.frame = CGRectMake(self.hourLabel.positionRight,
                                          self.hourLabel.positionTop,
                                          10,
                                          otherWidth);
        
        self.minuteLabel.frame = CGRectMake(self.leftColon.positionRight,
                                            self.leftColon.positionTop,
                                            otherWidth,
                                            otherWidth);
        
        self.rightColon.frame = CGRectMake(self.minuteLabel.positionRight,
                                           self.minuteLabel.positionTop,
                                           10,
                                           otherWidth);
        
        self.secondLabel.frame = CGRectMake(self.rightColon.positionRight,
                                            self.rightColon.positionTop,
                                            otherWidth,
                                            otherWidth);
    }
}

#pragma mark - Event
- (void)timeLoop:(NSTimer *)timer
{
    long long timeInterval = [[NSDate dateWithTimeIntervalSince1970:self.endTime] timeIntervalSinceNow];
    if (timeInterval <= 0)
    {
        [timer invalidate];
        //时间到
        self.hourLabel.text = [self timeNumberToString:0];
        self.minuteLabel.text = [self timeNumberToString:0];
        self.secondLabel.text = [self timeNumberToString:0];
        [[NSNotificationCenter defaultCenter] postNotificationName:kConstNotificationEventTimeOver object:nil];
    }
    else
    {
        long long hour = timeInterval/(60*60);
        long long minute = (timeInterval%(60*60))/60;
        long long second = timeInterval%60;
        
        self.hourLabel.text = [self timeNumberToString:hour];
        self.minuteLabel.text = [self timeNumberToString:minute];
        self.secondLabel.text = [self timeNumberToString:second];
    }
}

- (NSString *)timeNumberToString:(long long)timeNumber
{
    if (timeNumber < 10)
    {
        return [NSString stringWithFormat:@"0%lld",timeNumber];
    }
    else
    {
        return [NSString stringWithFormat:@"%lld",timeNumber];
    }
}


- (UILabel *)hourLabel
{
    if (_hourLabel == nil)
    {
        _hourLabel = [[UILabel alloc] init];
        [_hourLabel setFont:[UIFont systemFontOfSize:12]];
        [_hourLabel setTextAlignment:NSTextAlignmentCenter];
        [_hourLabel setTextColor:[UIColor whiteColor]];
        [_hourLabel.layer setCornerRadius:2];
        [_hourLabel setText:@"23"];
        _hourLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
        _hourLabel.adjustsFontSizeToFitWidth = YES;
        [_hourLabel setBackgroundColor:[UIColor orangeColor]];
        _hourLabel.clipsToBounds = YES;
        [self addSubview:_hourLabel];
    }
    return _hourLabel;
}

- (UILabel *)leftColon
{
    if (_leftColon == nil)
    {
        _leftColon = [[UILabel alloc] init];
        [_leftColon setText:@":"];
        [_leftColon setFont:[UIFont boldSystemFontOfSize:12]];
        [_leftColon setTextAlignment:NSTextAlignmentCenter];
        [_leftColon setTextColor:[UIColor orangeColor]];
        [self addSubview:_leftColon];
    }
    return _leftColon;
}

- (UILabel *)minuteLabel
{
    if (_minuteLabel == nil)
    {
        _minuteLabel = [[UILabel alloc] init];
        [_minuteLabel setFont:[UIFont boldSystemFontOfSize:12]];
        [_minuteLabel setTextAlignment:NSTextAlignmentCenter];
        [_minuteLabel setTextColor:[UIColor whiteColor]];
        [_minuteLabel.layer setCornerRadius:2];
        [_minuteLabel setText:@"59"];
        [_minuteLabel setBackgroundColor:[UIColor orangeColor]];
        _minuteLabel.clipsToBounds = YES;
        [self addSubview:_minuteLabel];
    }
    return _minuteLabel;
}

- (UILabel *)rightColon
{
    if (_rightColon == nil)
    {
        _rightColon = [[UILabel alloc] init];
        [_rightColon setText:@":"];
        [_rightColon setFont:[UIFont boldSystemFontOfSize:12]];
        [_rightColon setTextAlignment:NSTextAlignmentCenter];
        [_rightColon setTextColor:[UIColor orangeColor]];
        [self addSubview:_rightColon];
    }
    return _rightColon;
}

- (UILabel *)secondLabel
{
    if (_secondLabel == nil)
    {
        _secondLabel = [[UILabel alloc] init];
        [_secondLabel setFont:[UIFont boldSystemFontOfSize:12]];
        [_secondLabel setTextAlignment:NSTextAlignmentCenter];
        [_secondLabel setTextColor:[UIColor whiteColor]];
        [_secondLabel.layer setCornerRadius:2];
        [_secondLabel setText:@"59"];
        [_secondLabel setBackgroundColor:[UIColor orangeColor]];
        _secondLabel.clipsToBounds = YES;
        [self addSubview:_secondLabel];
    }
    return _secondLabel;
}

@end
