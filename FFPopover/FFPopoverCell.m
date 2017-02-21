//
//  FFPopoverCell.m
//  test
//
//  Created by 飞飞 on 16/9/10.
//  Copyright © 2016年 飞飞. All rights reserved.
//

#import "FFPopoverCell.h"
#import "FFPopoverAction.h"

# define margin 10


@interface FFPopoverCell ()
@property (nonatomic, weak) UIImageView *iconView;
@property (nonatomic, weak) UILabel *titleView;
@end

@implementation FFPopoverCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    
        // 1.栅格化
        self.layer.shouldRasterize = YES;
        self.layer.rasterizationScale = [UIScreen mainScreen].scale;
        
        // 2.异步绘制(离屏渲染)
        self.layer.drawsAsynchronously = YES;
        
        // 3.图片
        UIImageView *iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
        
        // 文字
        UILabel *titleView = [[UILabel alloc] init];
        titleView.font = [UIFont systemFontOfSize:15.0];
        [self.contentView addSubview:titleView];
        self.titleView = titleView;
        
        // 取消cell的选中
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
    }
    return self;
}



- (void)setAction:(FFPopoverAction *)action {
       _action = action;
    
    self.iconView.image = action.image;
    self.titleView.text = action.title;
    
}



- (void)layoutSubviews {
    [super layoutSubviews];
    
    
    CGFloat iconViewX = margin;
    CGFloat iconViewY = margin;
    CGFloat iconViewH = self.bounds.size.height - 2 * margin;
    CGFloat iconViewW = iconViewH;
    self.iconView.frame = CGRectMake(iconViewX, iconViewY, iconViewW, iconViewH);
    
    
    CGFloat titleViewX = CGRectGetMaxX(self.iconView.frame) + margin;
    CGFloat titleViewY = 0;
    CGFloat titleViewH = self.bounds.size.height;
    CGFloat titleViewW = self.bounds.size.width - 3 * margin - iconViewW;
    self.titleView.frame = CGRectMake(titleViewX, titleViewY, titleViewW, titleViewH);
    
    
}


- (void)setFrame:(CGRect)frame {
    CGRect changeFrame = frame;
    changeFrame.size.height = frame.size.height - 1;
    frame = changeFrame;
    [super setFrame:frame];
}


@end
