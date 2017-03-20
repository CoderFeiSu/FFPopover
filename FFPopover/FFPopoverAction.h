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

- (instancetype)initWithTitle:(NSString *)title image:(nullable UIImage *)image handler:(void (^)(FFPopoverAction *))handler;
@property (nonatomic, copy, readonly) NSString *title;
@property (nullable, nonatomic, strong, readonly) UIImage *image;
@property (nonatomic, copy, readonly) void (^handler)(FFPopoverAction *action);

@end


NS_ASSUME_NONNULL_END
