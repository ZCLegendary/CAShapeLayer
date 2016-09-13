//
//  ZCTableHeaderView.h
//  关于 layer
//
//  Created by myMac on 16/9/13.
//  Copyright © 2016年 myMac. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ShowIconImageViewDelegate <NSObject>

@required

- (void)notifyShowIcon;

@end


@interface ZCTableHeaderView : UIView 


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

//动画是否在进行
@property (nonatomic, assign) BOOL currentAnimate;


@property (nonatomic, assign) id<ShowIconImageViewDelegate>delegate;

@property (nonatomic, assign) CGFloat offset;






/**
 *
 *  赋值方法
 *
 */
- (void)setIconImage:(UIImage *)iconImage;


- (void)setCurrentAnimate:(BOOL)currentAnimate;

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
