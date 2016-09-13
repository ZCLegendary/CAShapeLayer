//
//  ViewController.m
//  CAShapeLayer Demo
//
//  Created by 张闯 on 16/9/12.
//  Copyright © 2016年 ChuangZhang. All rights reserved.
//

#import "ViewController.h"
<<<<<<< HEAD
#import "ZCTableHeaderView.h"

#define HEADHEIGHT 200
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) ZCTableHeaderView *headView;
=======

@interface ViewController ()

//定时器
@property (nonatomic, strong) CADisplayLink *timer;

//CAShapeLayer
@property (nonatomic, strong) CAShapeLayer *sinShapeLayer;

@property (nonatomic, strong) CAShapeLayer *cosShapeLayer;

//根view
@property (nonatomic, strong) UIView *backView;

//f(x) = waveHeight * sin(waveCurvature * x + waveSpeed)
//浪高
@property (nonatomic, assign) CGFloat waveHeight;

//浪弧度
@property (nonatomic, assign) CGFloat waveCurvature;

//浪速度
@property (nonatomic, assign) CGFloat waveSpeed;

//波浪推送变量
@property (nonatomic, assign) CGFloat offset;

//头像
@property (nonatomic, strong) UIImageView *iconImageView;

>>>>>>> 90fa62db47951261d55daf7a84d8b3890570978e


@end

@implementation ViewController

<<<<<<< HEAD
- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, HEADHEIGHT, kScreenWidth, kScreenHeight-HEADHEIGHT) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        _tableView.tableFooterView = [UIView new];
        
    }
    
    return _tableView;
}

- (ZCTableHeaderView *)headView {
    
    if (!_headView) {
        
        _headView = [[ZCTableHeaderView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, HEADHEIGHT)];
        _headView.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.6];
        UIImage *image = [UIImage imageNamed:@"p.png"];
        [_headView setIconImage:image];
        [_headView startAnimation];
    }
    
    return _headView;
=======
- (void)dealloc {
    
    [self.timer invalidate];
    [self.sinShapeLayer removeFromSuperlayer];
    [self.cosShapeLayer removeFromSuperlayer];
    
}

- (CAShapeLayer *)sinShapeLayer {
    
    if (!_sinShapeLayer) {
        _sinShapeLayer = [CAShapeLayer layer];
        CGRect frame = self.backView.frame;
        frame.origin.y = self.backView.frame.size.height - self.waveHeight;
        frame.size.height = self.waveHeight;
        _sinShapeLayer.frame = frame;
        _sinShapeLayer.fillColor = [[UIColor whiteColor] colorWithAlphaComponent:0.4].CGColor;
        
    }
    
    return _sinShapeLayer;
}

- (CAShapeLayer *)cosShapeLayer {
    
    if (!_cosShapeLayer) {
        _cosShapeLayer = [CAShapeLayer layer];
        CGRect frame = self.backView.frame;
        frame.origin.y = self.backView.frame.size.height - self.waveHeight;
        frame.size.height = self.waveHeight;
        _cosShapeLayer.frame = frame;
        _cosShapeLayer.fillColor = [[UIColor whiteColor] colorWithAlphaComponent:0.4].CGColor;
        
    }
    
    return _cosShapeLayer;
}

- (UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"p.png"]];
    }
    
    return _iconImageView;
>>>>>>> 90fa62db47951261d55daf7a84d8b3890570978e
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
<<<<<<< HEAD
    self.navigationItem.title = @"我的";

    [self.view addSubview:self.tableView];
    [self.view addSubview:self.headView];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = @"xixi";
    return cell;
=======
    
    self.backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 300)];
    self.backView.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.8];
    [self.view addSubview:self.backView];
    
    //设置波浪属性
    self.waveSpeed = 0.5;
    self.waveCurvature = 1.5;
    self.waveHeight = 7;
    
    
    //添加 layer
    [self.backView.layer addSublayer:self.sinShapeLayer];
    [self.backView.layer addSublayer:self.cosShapeLayer];
    [self.backView addSubview:self.iconImageView];
    
    //CADisplayLink 用法:加入到NSRunLoop中
    self.timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(beginWave)];
    [self.timer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    
}

- (void)beginWave
{
    //一个推一个
    self.offset += self.waveSpeed;
    
    CGFloat width = CGRectGetWidth(self.backView.frame);
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
    
    centerY = -self.waveHeight * sin(0.01 * self.waveCurvature * self.backView.center.x + self.offset * 0.05);
    self.iconImageView.frame = CGRectMake(self.backView.frame.size.width/2 - self.iconImageView.frame.size.width/2+15, centerY+self.backView.frame.size.height-self.iconImageView.frame.size.height-10, 70, 70);
    
    //    self.iconImageView.center.x = self.backView.center.x;
    
    
    self.sinShapeLayer.fillColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3].CGColor;
    //关闭子路径,否则,呵呵呵~~~
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
    
>>>>>>> 90fa62db47951261d55daf7a84d8b3890570978e
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
