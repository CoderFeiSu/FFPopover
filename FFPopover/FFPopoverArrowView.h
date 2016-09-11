//
//  FFPopoverArrowView.h
//  test
//
//  Created by 飞飞 on 16/9/10.
//  Copyright © 2016年 飞飞. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM (NSInteger, FFPopoverArrowViewType) {
     FFPopoverArrowViewTypeRegular, // 正三角
     FFPopoverArrowViewTypeDel // 倒三角
};


@interface FFPopoverArrowView : UIView
@property (nonatomic, strong) UIColor *fillColor;
@property (nonatomic, assign) FFPopoverArrowViewType type;
@end
