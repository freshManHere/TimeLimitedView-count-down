//
//  Created by csh on 15/6/25.
//  Copyright (c) 2015年 csh. All rights reserved.
//

#import "UIView+ViewExtension.h"

@implementation UIView (ViewExtension)

/**
 *  获取view所在的navigationController
 *
 *  @return view所在的navigationController
 */
- (UINavigationController *)navigationController
{
    UINavigationController *result=nil;
    for(UIView* view=self;view;view=[view superview])
    {
        UIResponder *responder=[view nextResponder];
        if([responder isKindOfClass:[UIViewController class]])
        {
            UIViewController *controller=(UIViewController*)responder;
            if(controller.navigationController!=nil)
            {
                result=controller.navigationController;
                break;
            }
            if([controller isKindOfClass:[UINavigationController class]])
            {
                result=(UINavigationController*)controller;
                break;
            }
        }
    }
    return result;
}

/**
 *  获取view所在的viewController
 *
 *  @return view所在的viewController
 */
- (UIViewController *)viewController
{
    for(UIView* view=self;view;view=[view superview])
    {
        UIResponder *responder=[view nextResponder];
        if([responder isKindOfClass:[UIViewController class]])
        {
            UIViewController* controller=(UIViewController*)responder;
            return controller;
        }
    }
    return nil;
}



/**
 *  对指定view进行截图
 *
 *  @return 截图后的image
 */
- (UIImage *)screenshot
{
    return [self screenshotWithRect:self.bounds];
}


/**
 *  对指定view的制定区域截图
 *
 *  @param rect 制定区域
 *
 *  @return 截图后的image
 */
- (UIImage *)screenshotWithRect:(CGRect)rect
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    UIRectClip(rect);
    [self.layer renderInContext:context];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return  theImage;
}

- (CGFloat)positionLeft
{
    return self.frame.origin.x;
}

- (CGFloat)positionRight
{
    return self.frame.origin.x+self.frame.size.width;
}

- (CGFloat)positionTop
{
    return self.frame.origin.y;
}

- (CGFloat)positionBottom
{
    return self.frame.origin.y+self.frame.size.height;
}



/**
 *  frame右侧
 *
 *  @return 右侧坐标
 */
- (CGFloat)right
{
    return self.frame.origin.x+self.frame.size.width;
}

/**
 *  frame底部
 *
 *  @return 底部坐标
 */
- (CGFloat)bottom
{
    return self.frame.origin.y+self.frame.size.height;
}
//.x .y .size  .height
- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setSize:(CGSize)size
{

    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

@end
