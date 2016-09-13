//
//  ViewController.m
//  CAShapeLayer Demo
//
//  Created by 张闯 on 16/9/12.
//  Copyright © 2016年 ChuangZhang. All rights reserved.
//

#import "ViewController.h"
#import "ZCTableHeaderView.h"

#define HEADHEIGHT 200
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) ZCTableHeaderView *headView;


@end

@implementation ViewController

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
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
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
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
