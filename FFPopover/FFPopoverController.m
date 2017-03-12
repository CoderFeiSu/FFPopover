//
//  FFPopoverController.m
//  Health
//
//  Created by suf on 16/5/12.
//  Copyright © 2016年 飞飞. All rights reserved.
//


#import "FFPopoverController.h"
#import "FFPopoverCell.h"
#import "FFPopoverArrowView.h"
#import "FFPopoverConst.h"

@interface FFPopoverController () <UITableViewDelegate, UITableViewDataSource>
/**用来展示内容*/
@property (nonatomic, weak) UITableView *contentView;
/**箭头*/
@property (nonatomic, weak) FFPopoverArrowView *arrowView;
@property (nonatomic, strong) NSMutableArray <FFPopoverAction *> *actions;

@property (nonatomic, assign) CGRect fromViewRect;
/** 菜单向下 */
@property (nonatomic, assign) BOOL isDropDown;
@end


@implementation FFPopoverController

# pragma mark - 重要方法
- (instancetype)initWithFromView:(UIView *)fromView {
    self = [super init];
    if (self) {
        
        // 1.必须传入UIView类型
        NSAssert([fromView isKindOfClass:[UIView class]], @"请传入UIView类型");
        
        // 2.设置透明和弹出的动画效果
        self.modalPresentationStyle = UIModalPresentationCustom; // UIModalPresentationCustom和UIModalPresentationOverFullScreen背景都可以为透明
        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve; // 弹出presented VC时场景切换动画的风格
        
        // 3.计算fromView在keyWindow中的位置
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        self.fromViewRect = [fromView convertRect:fromView.bounds toView:window];

        
        // 4.设置初始值
        self.contentBackgroundColor = [UIColor whiteColor];
        self.separatorLineColor = [UIColor lightGrayColor];
        self.alpha = 0.0;
        self.contentWidth = 140.0;
    }
    
    return self;
}


- (void)addAction:(FFPopoverAction *)action {
    // 不能为空，并且必须为FFPopoverAction类型
    if (![action isMemberOfClass:[FFPopoverAction class]]) {
        NSException *excp = [NSException exceptionWithName:@"类型不对" reason:@"传入的值必须为FFPopoverAction类型" userInfo:nil];
        [excp raise];
        return;
    }
    
    [self.actions addObject:action];
}


#pragma mark - 视图周期

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.contentView registerClass:[FFPopoverCell class] forCellReuseIdentifier:popoverID];
}



- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    // 1.获取尺寸
    CGSize viewSize = self.view.frame.size;
    
    // 2.设置箭头的Frame
    CGFloat arrowViewW = kArrowW;
    CGFloat arrowViewH = kArrowH;
    CGFloat arrowViewX = CGRectGetMaxX(self.fromViewRect) - (self.fromViewRect.size.width + arrowViewW) * 0.5; // 箭头始终与fromView的中心点对齐
    CGFloat arrowViewY = self.isDropDown ? CGRectGetMaxY(self.fromViewRect) : self.fromViewRect.origin.y - arrowViewH ;
    self.arrowView.frame = CGRectMake(arrowViewX, arrowViewY, arrowViewW, arrowViewH);
    
    // 3.1 设置内容的Frame
    CGFloat contentViewH = self.actions.count * kCellRowHeight;
    CGFloat contentViewW = self.contentWidth;
    CGFloat contentViewY = self.isDropDown ? CGRectGetMaxY(self.arrowView.frame) : arrowViewY - contentViewH;
    CGFloat contentViewX = self.arrowView.frame.origin.x - (contentViewW - arrowViewW) * 0.5; // 默认设置内容中心点跟箭头中心点对齐
    
    // 3.2 设置内容的X
    if (viewSize.width - self.arrowView.center.x - kContent2Border  < contentViewW * 0.5) {
        contentViewX = contentViewX - (contentViewW * 0.5 - (viewSize.width - self.arrowView.center.x - kContent2Border));
    }
    if (self.arrowView.center.x + kContent2Border < contentViewW * 0.5) {
        contentViewX = contentViewX + (contentViewW * 0.5 - self.arrowView.center.x) + kContent2Border;
    }
    self.contentView.frame = CGRectMake(contentViewX, contentViewY, contentViewW, contentViewH);

    // 4.设置背景透明度
    self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:self.alpha];
    
    // 5.分割线颜色
    self.contentView.backgroundColor = self.separatorLineColor;
    
    // 6.箭头的填充颜色
    self.arrowView.fillColor = self.contentBackgroundColor;
    
}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (self.presentCompletion) self.presentCompletion();
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if (self.dismissCompletion) self.dismissCompletion();
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - UITableView代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.actions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FFPopoverCell *cell = (FFPopoverCell *)[tableView dequeueReusableCellWithIdentifier:popoverID forIndexPath:indexPath];
    FFPopoverAction *action = self.actions[indexPath.row];
    cell.action = action;
    cell.backgroundColor = self.contentBackgroundColor;
 
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 1.销毁控制器
    [self dismissViewControllerAnimated:YES completion:nil];
    // 2.执行action
    FFPopoverAction *action = self.actions[indexPath.row];
    if (action.handler)  {
        action.handler(action);
    }
}


#pragma mark - 懒加载
- (FFPopoverArrowView *)arrowView {
    if (_arrowView ==  nil) {
        FFPopoverArrowView *arrowView = [[FFPopoverArrowView alloc] init];
        arrowView.type = self.isDropDown ? FFPopoverArrowViewTypeRegular : FFPopoverArrowViewTypeDel;
        [self.view addSubview:arrowView];
        _arrowView = arrowView;
    }
    return _arrowView;
}


- (BOOL)isDropDown {
    CGFloat fromViewMaxY = CGRectGetMaxY(self.fromViewRect);
    if (fromViewMaxY + kArrowH + self.actions.count * kCellRowHeight + kContent2Border <= self.view.frame.size.height) {
        return YES;
    } else {
        return NO;
    }
}



- (UITableView *)contentView {
    if (!_contentView) {
        UITableView *contentView = [[UITableView alloc] init];
        contentView.delegate = self;
        contentView.dataSource = self;
        contentView.rowHeight = kCellRowHeight;
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




