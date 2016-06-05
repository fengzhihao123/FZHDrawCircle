//
//  FZHDrawCircleView.m
//  FZHDrawCircle
//
//  Created by 冯志浩 on 16/5/28.
//  Copyright © 2016年 FZH. All rights reserved.
//

#import "FZHDrawCircleView.h"
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)
static CGFloat lineWidth = 5.0;
@implementation FZHDrawCircleView


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self initAttributes];
        [self initSubViews];
    }
    return self;
}

- (void)initAttributes{
    self.colourArcCenter = CGPointMake(self.frame.size.width/2, self.frame.size.height/2 - 30);

    self.colourRadius = 50.0f;
}

- (void)initSubViews{
    //类别
    self.cateLabel = [[UILabel alloc]init];
    self.cateLabel.textAlignment = NSTextAlignmentCenter;
    
    //数目
    self.moneyNumLabel = [[UILabel alloc]init];
    self.moneyNumLabel.textAlignment = NSTextAlignmentCenter;
  
    [self initLabelFrame];
    [self addSubview:self.cateLabel];
    [self addSubview:self.moneyNumLabel];
}

- (void)initLabelFrame{
    //1.cateLabel
    CGFloat cateLabelW = self.colourRadius * 2;
    CGFloat cateLabelH = self.colourRadius;
    CGFloat cateLabelX = (self.frame.size.width - cateLabelW)/2;
    CGFloat cateLabelY = (self.frame.size.height - cateLabelH)/2 - 30;
    
    self.cateLabel.frame = CGRectMake(cateLabelX, cateLabelY, cateLabelW, cateLabelH);
    
    //2.moenyLabel
    CGFloat moneyNumLabelX = cateLabelX;
    CGFloat moneyNumLabelY = self.colourArcCenter.y + self.colourRadius + 10;
    CGFloat moneyNumLabelW = cateLabelW;
    CGFloat moneyNumLabelH = cateLabelH;
    self.moneyNumLabel.frame = CGRectMake(moneyNumLabelX,moneyNumLabelY,moneyNumLabelW,moneyNumLabelH);
}

- (void)drawRect:(CGRect)rect {
    
    //1.colour
    self.colorPath = [UIBezierPath bezierPathWithArcCenter:self.colourArcCenter radius:self.colourRadius startAngle:self.colourStartAngle endAngle:self.colourEndAngle clockwise:YES];
    [self.colourFillColor set];
    self.colorPath.lineWidth = lineWidth;
    //1.1彩色状态的动画
    [self setupColourAnimation];
  
    //2.normal
    self.normalArcCenter = self.colourArcCenter;
    self.normalRadius = self.colourRadius;
    self.normalStartAngle = self.colourEndAngle;
    self.normalEndAngle = self.colourStartAngle;
    
    self.normalPath = [UIBezierPath bezierPathWithArcCenter:self.normalArcCenter radius:self.normalRadius startAngle:self.normalStartAngle endAngle:self.normalEndAngle clockwise:YES];
    [self.normalFillColor set];
    self.normalPath.lineWidth = lineWidth;
    //2.1普通状态的动画
    [self setupNormalAnimation];
    
}

- (void)setupColourAnimation{
    CAShapeLayer *colorShapeLayer = [CAShapeLayer layer];
    colorShapeLayer.lineWidth = lineWidth;
    CABasicAnimation *colorBaseAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    colorBaseAnimation.fromValue = @0;
    colorBaseAnimation.toValue = @1;
    colorBaseAnimation.duration = 2;
    colorShapeLayer.path = self.colorPath.CGPath;
    colorShapeLayer.fillColor = [UIColor clearColor].CGColor;
    colorShapeLayer.strokeColor = self.colourFillColor.CGColor;
    [self.layer addSublayer:colorShapeLayer];
    [colorShapeLayer addAnimation:colorBaseAnimation forKey:@"strokeEnd"];
}

- (void)setupNormalAnimation{
    CAShapeLayer *normalShapeLayer = [CAShapeLayer layer];
    normalShapeLayer.lineWidth = lineWidth;
    CABasicAnimation * normalBaseAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    normalBaseAnimation.fromValue = @0;
    normalBaseAnimation.toValue = @1;
    normalBaseAnimation.duration = 2;
    
    normalShapeLayer.path = self.normalPath.CGPath;
    normalShapeLayer.fillColor = [UIColor clearColor].CGColor;
    normalShapeLayer.strokeColor = self.normalFillColor.CGColor;
    [self.layer addSublayer:normalShapeLayer];
    [normalShapeLayer addAnimation:normalBaseAnimation forKey:@"strokeEnd"];
}
@end
