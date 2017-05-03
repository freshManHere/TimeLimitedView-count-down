//
//  ViewController.m
//  TimeLimitViewDemo
//
//  Created by 陈世豪 on 2017/5/3.
//  Copyright © 2017年 陈世豪. All rights reserved.
//

#import "ViewController.h"
#import "RTimeLimitedView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RTimeLimitedView *time = [[RTimeLimitedView alloc]init];
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    format.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *date = [format dateFromString:@"2017-05-03 14:11:00"];
    NSTimeInterval timeeee = date.timeIntervalSince1970;
    time.endTime = timeeee;
    time.themeColor = [UIColor greenColor];
    time.textColor = [UIColor blackColor];
    time.dotColor = [UIColor greenColor];
    [self.view addSubview:time];
    time.frame = CGRectMake(50,
                            200,
                            100,
                            40);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
