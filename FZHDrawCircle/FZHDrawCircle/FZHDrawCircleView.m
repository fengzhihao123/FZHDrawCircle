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
@implementation FZHDrawCircleView


- (instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews{
    
    //类别
    self.cateLabel = [[UILabel alloc]init];
    self.cateLabel.textAlignment = NSTextAlignmentCenter;
    CGFloat cateX;
    if (SCREEN_WIDTH == 414) {
        cateX = 5.0;
    }else{
        cateX = 1.0;
    }
    self.cateLabel.frame = CGRectMake(cateX, (45.0/736.0) * SCREEN_HEIGHT, SCREEN_WIDTH * (110.0/414.0), (50.0/736.0) * SCREEN_HEIGHT);
    [self addSubview:self.cateLabel];
    
    //数目
    self.moneyNumLabel = [[UILabel alloc]init];
    self.moneyNumLabel.textAlignment = NSTextAlignmentCenter;
    self.moneyNumLabel.frame = CGRectMake(5, SCREEN_HEIGHT * (120.0/736.0), SCREEN_WIDTH * (100.0/414.0), (50.0/736.0) * SCREEN_HEIGHT);
    [self addSubview:self.moneyNumLabel];
    
}

- (void)drawRect:(CGRect)rect {
    //1.colour
    UIBezierPath * colorPath = [UIBezierPath bezierPathWithArcCenter:self.colourArcCenter radius:self.colourRadius startAngle:self.colourStartAngle endAngle:self.colourEndAngle clockwise:YES];
    [self.colourFillColor set];
    colorPath.lineWidth = 5.0;
    [colorPath stroke];
    
    //2.normal
    self.normalArcCenter = self.colourArcCenter;
    self.normalRadius = self.colourRadius;
    self.normalStartAngle = self.colourEndAngle;
    self.normalEndAngle = self.colourStartAngle;
    
    UIBezierPath * normalPath = [UIBezierPath bezierPathWithArcCenter:self.normalArcCenter radius:self.normalRadius startAngle:self.normalStartAngle endAngle:self.normalEndAngle clockwise:YES];
    [self.normalFillColor set];
    normalPath.lineWidth = 5.0;
    [normalPath stroke];
}

@end
