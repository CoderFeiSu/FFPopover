//
//  FFPopoverController.m
//  Health
//
//  Created by suf on 16/5/12.
//  Copyright © 2016年 飞飞. All rights reserved.
//


#import "FFPopoverController.h"

# define kArrowW 15 // 箭头宽度
# define kArrowH 8 // 箭头高度
# define cellRowHeight 45


@interface FFPopoverController () <UITableViewDelegate, UITableViewDataSource>
/**用来展示内容*/
@property (nonatomic, weak) UITableView *contentView;
/**箭头*/
@property (nonatomic, weak) FFPopoverArrowView *arrowView;
@property (nonatomic, strong) NSMutableArray <FFPopoverAction *> *actions;

@property (nonatomic, assign) CGRect fromViewRect;
@end


@implementation FFPopoverController

- (instancetype)initWithFromView:(UIView *)fromView {
    self = [super init];
    if (self) {
        
        // 1.设置透明和弹出的动画效果
        self.modalPresentationStyle = UIModalPresentationCustom; // UIModalPresentationCustom和UIModalPresentationOverFullScreen背景都可以为透明
        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve; // 弹出presented VC时场景切换动画的风格
        
        // 2.计算fromView在keyWindow中的位置
        if ([fromView isKindOfClass:[UIView class]]) {
            
            UIWindow *window = [UIApplication sharedApplication].keyWindow;
            self.fromViewRect = [fromView.superview convertRect:fromView.frame toView:window];
        }
        
        
        // 3.设置初始值
        self.contentBackgroundColor = [UIColor whiteColor];
        self.separatorLineColor = [UIColor lightGrayColor];
        self.alpha = 0.0;
        self.contentWidth = 140.0;
        
        
    }
    
    return self;
}


- (void)addAction:(FFPopoverAction *)action {
    [self.actions addObject:action];
}



- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    // 1.获取尺寸
    CGSize viewSize = self.view.frame.size;
    
    // 2.设置箭头的Frame
    CGFloat arrowViewW = kArrowW;
    CGFloat arrowViewH = kArrowH;
    CGFloat arrowViewX = CGRectGetMaxX(self.fromViewRect) - (self.fromViewRect.size.width + arrowViewW) * 0.5; // 箭头始终与fromView的中心点对齐
    CGFloat arrowViewY = CGRectGetMaxY(self.fromViewRect);

    
    self.arrowView.frame = CGRectMake(arrowViewX, arrowViewY, arrowViewW, arrowViewH);
    
    
    // 1.1 设置内容的Frame
    CGFloat contentViewH = self.actions.count * cellRowHeight;
    CGFloat contentViewW = self.contentWidth;
    CGFloat contentViewY = CGRectGetMaxY(self.arrowView.frame);
    CGFloat contentViewX = self.arrowView.frame.origin.x - (contentViewW - self.arrowView.frame.size.width) * 0.5; // 默认设置内容中心点跟箭头中心点对齐
    
    // 1.2 设置内容的X
    if (viewSize.width - self.arrowView.center.x - 5  < contentViewW * 0.5) {
        contentViewX = contentViewX - (contentViewW / 2 - (viewSize.width - self.arrowView.center.x - 5));
    }
    if (self.arrowView.center.x + 5 < contentViewW * 0.5) {
        contentViewX = contentViewX + (contentViewW / 2 - self.arrowView.center.x) + 5;
    }
    self.contentView.frame = CGRectMake(contentViewX, contentViewY, contentViewW, contentViewH);

    
    
    // 2.设置背景透明度
    self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:self.alpha];
    
    // 3.分割线颜色
    self.contentView.backgroundColor = self.separatorLineColor;
    
    // 4.箭头的填充颜色
    self.arrowView.fillColor = self.contentBackgroundColor;
  

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.actions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FFPopoverCell  *cell = [FFPopoverCell cellWithTableView:tableView];
    FFPopoverAction *action = self.actions[indexPath.row];
    cell.action = action;
    
    cell.backgroundColor = self.contentBackgroundColor;
 
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self dismissViewControllerAnimated:YES completion:nil];
    FFPopoverAction *action = self.actions[indexPath.row];
   if (action.handler)  action.handler();
}


#pragma mark - 懒加载
- (FFPopoverArrowView *)arrowView {
    if (_arrowView ==  nil) {
        FFPopoverArrowView *arrowView = [[FFPopoverArrowView alloc] init];
        [self.view addSubview:arrowView];
        _arrowView = arrowView;
    }
    return _arrowView;
}



- (UITableView *)contentView {
    if (!_contentView) {
        UITableView *contentView = [[UITableView alloc] init];
        contentView.delegate = self;
        contentView.dataSource = self;
        contentView.rowHeight = cellRowHeight;
        contentView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        contentView.separatorStyle = UITableViewCellSeparatorStyleNone; // 去除原来的分割线
        contentView.showsVerticalScrollIndicator = NO;
        contentView.scrollEnabled  = NO;
        contentView.layer.cornerRadius  = 5.f;
        contentView.layer.borderColor   = self.contentBackgroundColor.CGColor;
        contentView.layer.borderWidth   = 1.f;
        [self.view addSubview:contentView];
        _contentView = contentView;
    }
    return _contentView;
}


- (NSMutableArray<FFPopoverAction *> *)actions {
    if (!_actions) {
        _actions = [[NSMutableArray alloc] init];
    }
    return _actions;
}


@end




