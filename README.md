## FFPopover
* 简单易用，向iOS系统看齐，会用UIAlertController就会用FFPopover
* 让你的菜单想上弹就上弹，想下弹就下弹

## 怎样使用
* 手动拖入FFPopover文件夹到项目中
* 导入主文件：#import "FFPopover.h"
* 示例代码:

```objc
- (IBAction)leftDownBtnClicked:(UIButton *)btn {
    
    FFPopoverController *popover = [[FFPopoverController alloc] initWithFromView:btn];
    
    FFPopoverAction *action1 = [[FFPopoverAction alloc] initWithTitle:@"飞呀飞" image:[UIImage imageNamed:@"QRCode"] handler:^(FFPopoverAction *action) {
        NSLog(@"我是%@",action.title);
    }];
    
    FFPopoverAction *action2 = [[FFPopoverAction alloc] initWithTitle:@"飞了飞" image:[UIImage imageNamed:@"search"] handler:^(FFPopoverAction *action) {
        NSLog(@"我是%@",action.title);
    }];
    
    FFPopoverAction *action3 = [[FFPopoverAction alloc] initWithTitle:@"飞不飞" image:[UIImage imageNamed:@"search"] handler:^(FFPopoverAction *action) {
        NSLog(@"我是%@",action.title);
    }];
    
    [popover addAction:action1];
    [popover addAction:action2];
    [popover addAction:action3];
    
    [self presentViewController:popover animated:YES completion:nil];  
}
```

## 支持版本
* iOS7及以上
