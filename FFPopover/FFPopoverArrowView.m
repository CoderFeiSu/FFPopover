//
//  FFPopoverArrowView.m
//  test
//
//  Created by 飞飞 on 16/9/10.
//  Copyright © 2016年 飞飞. All rights reserved.
//

#import "FFPopoverArrowView.h"

@interface FFPopoverArrowView ()

@property (nonatomic, weak) CAShapeLayer *arrowLayer;

@end

@implementation FFPopoverArrowView


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        CAShapeLayer *arrowLayer = [CAShapeLayer layer];
        arrowLayer.backgroundColor = [UIColor clearColor].CGColor;
        arrowLayer.lineWidth = 1;
        arrowLayer.fillColor = [UIColor whiteColor].CGColor;
        [self.layer addSublayer:arrowLayer];
        self.arrowLayer = arrowLayer;
    }
    return self;
}


- (void)setFillColor:(UIColor *)fillColor {
    _fillColor = fillColor;
    self.arrowLayer.fillColor = fillColor.CGColor;
}


- (void)setType:(FFPopoverArrowViewType)type {
       _type = type;
    [self setNeedsLayout];
}



- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.arrowLayer.frame = self.bounds;
    CGFloat arrowLayerW = self.arrowLayer.frame.size.width;
    CGFloat arrowLayerH = self.arrowLayer.frame.size.height;
    
    UIBezierPath *path =  [UIBezierPath bezierPath];
    if (self.type == FFPopoverArrowViewTypeDel) { // 倒三角
        [path moveToPoint:CGPointMake(0, 0)];
        [path addLineToPoint:CGPointMake(arrowLayerW, 0)];
        [path addLineToPoint:CGPointMake(arrowLayerW * 0.5, arrowLayerH)];
        [path closePath];
      } else { // 正三角
          [path moveToPoint:CGPointMake(arrowLayerW * 0.5, 0)];
          [path addLineToPoint:CGPointMake(0, arrowLayerH)];
          [path addLineToPoint:CGPointMake(arrowLayerW, arrowLayerH)];
     }
    // 闭合路径
    [path closePath];
    
    self.arrowLayer.path = path.CGPath;
}


@end
