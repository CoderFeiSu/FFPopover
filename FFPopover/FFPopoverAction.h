//
//  FFPopoverAction.h
//  test
//
//  Created by 飞飞 on 16/9/10.
//  Copyright © 2016年 飞飞. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface FFPopoverAction : NSObject
- (instancetype)initWithTitle:(NSString *)title image:(nullable UIImage *)image handler:(void (^)())handler;
/** 文字的颜色，默认是黑色*/
@property (nullable, nonatomic, strong) UIColor *titleColor;
/** 文字的大小，默认是15.0*/
@property (nullable, nonatomic, strong) UIFont *titleFont;
@property (nonatomic, copy, readonly) NSString *title;
@property (nullable, nonatomic, strong, readonly) UIImage *image;
@property (nonatomic, copy) void (^handler)();
@end




NS_ASSUME_NONNULL_END