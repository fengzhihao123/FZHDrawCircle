//
//  ViewController.m
//  FZHDrawCircle
//
//  Created by 冯志浩 on 16/5/28.
//  Copyright © 2016年 FZH. All rights reserved.
//

#import "ViewController.h"
#import "FZHDrawCircleView.h"
#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI) * 360

@interface ViewController ()
@property (nonatomic, assign) CGFloat currentNum;
@property (nonatomic, assign) CGFloat totalNum;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupCircleView];
}
/**
 *  初始化圆形视图
 */
- (void)setupCircleView{
    
    //1.初始化
    self.currentNum = 200.0;//彩色的数量
    self.totalNum = 300.0;//总比例
    FZHDrawCircleView * circleView = [[FZHDrawCircleView alloc]initWithFrame:CGRectMake(50, 100, 100, 100)];
    
    //2.彩色属性
    circleView.colourFillColor = [UIColor colorWithRed:0.684 green:1.000 blue:0.678 alpha:1.000];//颜色
    circleView.colourStartAngle = 0;//起始点
    circleView.colourEndAngle = DEGREES_TO_RADIANS(self.currentNum/self.totalNum);

    //3.普通属性
    circleView.normalFillColor = [UIColor lightGrayColor];
    
    //4.文字
    circleView.cateLabel.text = @"购物";
    circleView.moneyNumLabel.text = @"￥200";
    [self.view addSubview:circleView];
    
    FZHDrawCircleView * circleViewTwo = [[FZHDrawCircleView alloc]initWithFrame:CGRectMake(200, 100, 100, 100)];
    
    //2.彩色属性
    circleViewTwo.colourFillColor = [UIColor colorWithRed:0.687 green:0.527 blue:0.126 alpha:1.000];//颜色
    circleViewTwo.colourStartAngle = 0;//起始点
    circleViewTwo.colourEndAngle = DEGREES_TO_RADIANS(100.0/self.totalNum);
    
    //3.普通属性
    circleViewTwo.normalFillColor = [UIColor lightGrayColor];
    //4.文字
    circleViewTwo.cateLabel.text = @"吃饭";
    circleViewTwo.moneyNumLabel.text = @"￥100";
    [self.view addSubview:circleViewTwo];
    
}
@end
