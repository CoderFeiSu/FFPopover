//
//  FFPopoverAction.m
//  test
//
//  Created by 飞飞 on 16/9/10.
//  Copyright © 2016年 飞飞. All rights reserved.
//

#import "FFPopoverAction.h"


@interface FFPopoverAction ()

@end


@implementation FFPopoverAction
- (instancetype)initWithTitle:(NSString *)title image:(UIImage *)image handler:(nonnull void (^)(FFPopoverAction * _Nonnull))handler {
    self = [super init];
    if (self) {
        _title = title;
        _image = image;
        _handler = handler;
    }
    return self;
}


@end
