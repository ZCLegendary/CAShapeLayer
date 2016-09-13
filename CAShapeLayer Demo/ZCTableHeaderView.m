//
//  ZCTableHeaderView.m
//  关于 layer
//
//  Created by myMac on 16/9/13.
//  Copyright © 2016年 myMac. All rights reserved.
//

#import "ZCTableHeaderView.h"



@interface ZCTableHeaderView () 

//定时器(方法执行下一帧该绘制的路径)
@property (nonatomic, strong) CADisplayLink *timer;

//CAShapeLayer
@property (nonatomic, strong) CAShapeLayer *sinShapeLayer;

@property (nonatomic, strong) CAShapeLayer *cosShapeLayer;



@end

@implementation ZCTableHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        //设置波浪属性
        self.waveSpeed = 0.5;
        self.waveCurvature = 1.5;
        self.waveHeight = 7;
        
        //添加头像~
        [self addSubview:self.iconImageView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickToshowIcon)];
        self.iconImageView.userInteractionEnabled = YES;
        [self.iconImageView addGestureRecognizer:tap];
        
        //去除底边颜色
        [self.layer addSublayer:self.bottomLayer];
        
    }
    
    return self;
}


- (CALayer *)bottomLayer {
    
    if (!_bottomLayer) {
        _bottomLayer = [CALayer layer];
        _bottomLayer.borderWidth = 1;
        _bottomLayer.frame = CGRectMake(0, self.frame.size.height-1, self.frame.size.width, 1);
        _bottomLayer.borderColor = [UIColor whiteColor].CGColor;
    }
    
    return _bottomLayer;
}


- (CAShapeLayer *)sinShapeLayer {
    
    if (!_sinShapeLayer) {
        _sinShapeLayer = [CAShapeLayer layer];
        CGRect frame = self.frame;
        frame.origin.y = self.frame.size.height - self.waveHeight;
        frame.size.height = self.waveHeight;
        _sinShapeLayer.frame = frame;
        _sinShapeLayer.fillColor = [[UIColor whiteColor] colorWithAlphaComponent:0.4].CGColor;
        
    }
    
    return _sinShapeLayer;
}

- (CAShapeLayer *)cosShapeLayer {
    
    if (!_cosShapeLayer) {
        _cosShapeLayer = [CAShapeLayer layer];
        CGRect frame = self.frame;
        frame.origin.y = self.frame.size.height - self.waveHeight;
        frame.size.height = self.waveHeight;
        _cosShapeLayer.frame = frame;
        _cosShapeLayer.fillColor = [[UIColor whiteColor] colorWithAlphaComponent:0.4].CGColor;
        
    }
    
    return _cosShapeLayer;
}

- (UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.layer.masksToBounds = YES;
        _iconImageView.layer.cornerRadius = 10;
        _iconImageView.layer.borderWidth = 2;
        _iconImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    }
    
    return _iconImageView;
}


- (void)initShapeLayer {
    
    //添加 layer
    [self.layer addSublayer:self.sinShapeLayer];
    [self.layer addSublayer:self.cosShapeLayer];

    
}



- (void)beginWave
{
    
    //一个推一个
    self.offset += self.waveSpeed;
    
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat height = self.waveHeight;
    
    //波浪路径
    CGMutablePathRef sinpath = CGPathCreateMutable();
    CGMutablePathRef cospath = CGPathCreateMutable();
    //在路径上移动到这一点
    CGPathMoveToPoint(sinpath, NULL, 0, height);
    CGPathMoveToPoint(cospath, NULL, 0, height);
    //这里算出在 backView 范围内,波浪每个 x 坐标对应的 y 坐标
    //声明 y 坐标变量
    CGFloat y = 0;
    for (CGFloat x = 0; x <= width; x++) {
        
        //根据正弦函数得到 y 坐标
        y = self.waveHeight * sin(0.01 * self.waveCurvature * x + self.offset * 0.05);
        //在路径中的每个点连线
        CGPathAddLineToPoint(sinpath, NULL, x, y);
        CGPathAddLineToPoint(cospath, NULL, x, -y);
    }
    
    //头像坐标
    CGFloat centerY;
    
    centerY = -self.waveHeight * sin(0.01 * self.waveCurvature * self.center.x + self.offset * 0.05);
    self.iconImageView.frame = CGRectMake(self.frame.size.width/2 - self.iconImageView.frame.size.width/2, centerY+self.frame.size.height-self.iconImageView.frame.size.height-7, 70, 70);
    
    
    self.sinShapeLayer.fillColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3].CGColor;
    //关闭子路径
    CGPathAddLineToPoint(sinpath, NULL, width, height);
    CGPathAddLineToPoint(sinpath, NULL, 0, height);
    CGPathCloseSubpath(sinpath);
    self.sinShapeLayer.path = sinpath;
    CGPathRelease(sinpath);
    
    self.cosShapeLayer.fillColor = [[UIColor whiteColor] colorWithAlphaComponent:1].CGColor;
    CGPathAddLineToPoint(cospath, NULL, width, height);
    CGPathAddLineToPoint(cospath, NULL, 0, height);
    CGPathCloseSubpath(cospath);
    self.cosShapeLayer.path = cospath;
    CGPathRelease(cospath);
    
}

- (void)setIconImage:(UIImage *)iconImage {
    
    [_iconImageView setImage:iconImage];
    
}

- (void)setCurrentAnimate:(BOOL)currentAnimate {
    
    _currentAnimate = currentAnimate;
}



- (void)startAnimation {
    
     [self initShapeLayer];
    //CADisplayLink 用法:加入到NSRunLoop中
    self.timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(beginWave)];
    [self.timer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    self.currentAnimate = YES;

    
}

- (void)stopAnimation {
    
    
    [self.timer invalidate];
    self.timer = nil;
    [self.sinShapeLayer removeFromSuperlayer];
    [self.cosShapeLayer removeFromSuperlayer];
    
    self.iconImageView.frame = CGRectMake(self.frame.size.width/2 - self.iconImageView.frame.size.width/2, self.frame.size.height-self.iconImageView.frame.size.height, 70, 70);
    
    self.currentAnimate = NO;
    
}

- (void)clickToshowIcon {
    
    [self.delegate notifyShowIcon];
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
