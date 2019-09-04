## FFPopover
* 简单易用，向iOS系统看齐，会用UIAlertController就会用FFPopover
* 让你的菜单想上弹就上弹，想下弹就下弹

## 怎样使用
* 通过CocoaPods安装：pod 'FFPopover'
* 手动拖入FFPopover文件夹到项目中
* 导入主文件：#import "FFPopover.h"
* 示例代码:

```objc
// 右上边加号点击
- (IBAction)rightPlusClicked:(UITapGestureRecognizer *)sender {
    
    
    FFPopoverController *popover = [[FFPopoverController alloc] initWithFromView:sender.view ];

    [popover addAction: [[FFPopoverAction alloc] initWithTitle:@"搜一搜" image:[UIImage imageNamed:@"search"] handler:^(FFPopoverAction *action) {
        UIViewController *vc = [[UIViewController alloc] init];
        vc.view.backgroundColor = [UIColor redColor];
        vc.title = @"我要搜索";
        [self.navigationController pushViewController:vc animated:YES];
    }]];
    
    [popover addAction: [[FFPopoverAction alloc] initWithTitle:@"扫一扫" image:[UIImage imageNamed:@"QRCode"] handler:^(FFPopoverAction *action) {
        UIViewController *vc = [[UIViewController alloc] init];
        vc.view.backgroundColor = [UIColor greenColor];
        vc.title = @"我要扫描";
        [self.navigationController pushViewController:vc animated:YES];
    }]];
    
    [popover addAction: [[FFPopoverAction alloc] initWithTitle:@"聊一聊" image:[UIImage imageNamed:@"chat"] handler:^(FFPopoverAction *action) {
        UIViewController *vc = [[UIViewController alloc] init];
        vc.view.backgroundColor = [UIColor blueColor];
        vc.title = @"我要聊天";
        [self.navigationController pushViewController:vc animated:YES];
    }]];
    
    [self presentViewController:popover animated:YES completion:nil];
}
```

## 效果图
![](https://github.com/CoderFeiSu/FFPopover/blob/master/display.gif)

## 支持版本
iOS7及以上
