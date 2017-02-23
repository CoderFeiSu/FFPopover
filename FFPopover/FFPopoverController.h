//
//  FFPopoverController.h
//  Health
//
//  Created by suf on 16/5/12.
//  Copyright © 2016年 飞飞. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "FFPopoverAction.h"


NS_ASSUME_NONNULL_BEGIN

NS_CLASS_AVAILABLE_IOS(7_0) @interface FFPopoverController : UIViewController

/** fromView 可以指向的UIView */
- (instancetype)initWithFromView:(UIView *)fromView  NS_AVAILABLE_IOS(7_0) ;
- (void)addAction:(FFPopoverAction *)action;
/** 分割线的颜色，默认颜色为lightGrayColor */
@property (nullable, nonatomic, strong) UIColor *separatorLineColor;
/** 蒙版的透明度，默认alpha是0.0，全透明 */
@property (nonatomic, assign)  CGFloat alpha;
/** 背景颜色，默认是whiteColor */
@property (nonatomic, strong)  UIColor *contentBackgroundColor;
/** 内容尺寸，默认宽度是140 */
@property (nonatomic, assign)  CGFloat contentWidth;
/** 控制器将会销毁 */
@property (nonatomic, copy) void (^dismissCompletion)();
/** 控制器将会显示 */
@property (nonatomic, copy) void (^presentCompletion)();
@end


NS_ASSUME_NONNULL_END
