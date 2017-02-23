//
//  FFPopoverArrowView.m
//  test
//
//  Created by 飞飞 on 16/9/10.
//  Copyright © 2016年 飞飞. All rights reserved.
//

#import "FFPopoverArrowView.h"

@implementation FFPopoverArrowView


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


- (void)setFillColor:(UIColor *)fillColor {
    _fillColor = fillColor;
    [self setNeedsDisplay];
}


- (void)setType:(FFPopoverArrowViewType)type {
    _type = type;
   [self setNeedsDisplay];
}



- (void)drawRect:(CGRect)rect {

    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    if (self.type == FFPopoverArrowViewTypeDel) { // 倒三角
        
        CGContextMoveToPoint(ctx, 0, 0);
        CGContextAddLineToPoint(ctx, rect.size.width, 0);
        CGContextAddLineToPoint(ctx, rect.size.width * 0.5, rect.size.height);
        
    } else {
    
        CGContextMoveToPoint(ctx, rect.size.width * 0.5, 0);
        CGContextAddLineToPoint(ctx, 0, rect.size.height);
        CGContextAddLineToPoint(ctx, rect.size.width, rect.size.height);
   }
    
    CGContextClosePath(ctx);
    if (!self.fillColor) {
        CGContextSetFillColorWithColor(ctx, [UIColor whiteColor].CGColor);
    } else {
        CGContextSetFillColorWithColor(ctx, self.fillColor.CGColor);
    }
    CGContextSetLineWidth(ctx, 1);
    CGContextFillPath(ctx);
}


@end
