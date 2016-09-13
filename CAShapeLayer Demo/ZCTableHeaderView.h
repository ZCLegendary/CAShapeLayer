//
//  ZCTableHeaderView.h
//  关于 layer
//
//  Created by myMac on 16/9/13.
//  Copyright © 2016年 myMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCTableHeaderView : UIView


//定时器(方法执行下一帧该绘制的路径)
@property (nonatomic, strong) CADisplayLink *timer;

//CAShapeLayer
@property (nonatomic, strong) CAShapeLayer *sinShapeLayer;

@property (nonatomic, strong) CAShapeLayer *cosShapeLayer;


//f(x) = waveHeight * sin(waveCurvature * x + waveSpeed)
//浪高
@property (nonatomic, assign) CGFloat waveHeight;

//浪弧度
@property (nonatomic, assign) CGFloat waveCurvature;

//浪速度
@property (nonatomic, assign) CGFloat waveSpeed;

//头像
@property (nonatomic, strong) UIImageView *iconImageView;

//头像图片
@property (nonatomic, strong) UIImage *iconImage;

//底边 layer
@property (nonatomic, strong) CALayer *bottomLayer;


@property (nonatomic, assign) CGFloat offset;





/**
 *
 *  赋值方法
 *
 */
- (void)setIconImage:(UIImage *)iconImage;


/**
 *
 *  开始动画
 *
 */
- (void)startAnimation;

/**
 *
 *  停止动画
 *
 */
- (void)stopAnimation;

@end
