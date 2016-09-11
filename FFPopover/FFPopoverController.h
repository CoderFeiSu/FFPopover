//
//  FFPopoverController.h
//  Health
//
//  Created by suf on 16/5/12.
//  Copyright © 2016年 飞飞. All rights reserved.
//


#import "FFPopoverAction.h"
#import "FFPopoverCell.h"
#import "FFPopoverArrowView.h"


NS_ASSUME_NONNULL_BEGIN

NS_CLASS_AVAILABLE_IOS(7_0) @interface FFPopoverController : UIViewController

/** fromView 可以指向的UIView */
- (instancetype)initWithFromView:(UIView *)fromView  NS_AVAILABLE_IOS(7_0) ;
- (void)addAction:(FFPopoverAction *)action;
/** 分割线的颜色，默认颜色为groupTableViewBackgroundColor */
@property (nullable, nonatomic, strong) UIColor *separatorLineColor;
/** 蒙版的透明度，默认alpha是0.0，全透明 */
@property (nonatomic, assign)  CGFloat alpha;
/** 背景颜色，默认是whiteColor */
@property (nonatomic, strong)  UIColor *contentColor;
/** 内容尺寸，默认宽度是100 */
@property (nonatomic, assign)  CGSize contentSize;

@end


NS_ASSUME_NONNULL_END