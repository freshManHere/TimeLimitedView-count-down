//
//  Created by csh on 15/6/25.
//  Copyright (c) 2015年 csh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIView (ViewExtension)
@property (nonatomic, assign) CGFloat x;

@property (nonatomic, assign) CGFloat y;

@property (nonatomic, assign) CGFloat centerX;

@property (nonatomic, assign) CGFloat centerY;

@property (nonatomic, assign) CGFloat width;

@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGSize size;


/**
 *  获取view所在的navigationController
 *
 *  @return view所在的navigationController
 */
- (UINavigationController *)navigationController;

/**
 *  获取view所在的viewController
 *
 *  @return view所在的viewController
 */
- (UIViewController *)viewController;

/**
 *  对指定view进行截图
 *
 *  @return 截图后的image
 */
- (UIImage *)screenshot;


/**
 *  对指定view的制定区域截图
 *
 *  @param rect 制定区域
 *
 *  @return 截图后的image
 */
- (UIImage *)screenshotWithRect:(CGRect)rect;

- (CGFloat)positionLeft;

- (CGFloat)positionRight;

- (CGFloat)positionTop;

- (CGFloat)positionBottom;

/**
 *  frame右侧
 *
 *  @return 右侧坐标
 */
- (CGFloat)right;

/**
 *  frame底部
 *
 *  @return 底部坐标
 */
- (CGFloat)bottom;


@end
