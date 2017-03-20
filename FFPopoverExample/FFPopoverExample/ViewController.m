//
//  ViewController.m
//  FFPopoverExample
//
//  Created by 飞飞 on 16/9/11.
//  Copyright © 2016年 FeiFei. All rights reserved.
//

#import "ViewController.h"
#import "FFPopover.h"

@interface ViewController ()

@end

@implementation ViewController

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



// 右上边text点击
- (IBAction)rightTextClicked:(UITapGestureRecognizer *)sender {
    
    FFPopoverController *popover = [[FFPopoverController alloc] initWithFromView:sender.view ];
    popover.dismissCompletion = ^ {
        NSLog(@"销毁了");
    };
    popover.presentCompletion = ^ {
        NSLog(@"展现了");
    };
    
    [popover addAction: [[FFPopoverAction alloc] initWithTitle:@"哈一哈" image:nil handler:^(FFPopoverAction *action) {
        
    }] ];
    [popover addAction: [[FFPopoverAction alloc] initWithTitle:@"看一看" image:nil handler:^(FFPopoverAction *action) {
        
    }]];
    
    [self presentViewController:popover animated:YES completion:nil];
}



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


// 中间按钮点击
- (IBAction)middleBtnClicked:(UIButton *)btn {
    
    FFPopoverController *popover = [[FFPopoverController alloc] initWithFromView:btn];
    
    FFPopoverAction *action1 = [[FFPopoverAction alloc] initWithTitle:@"飞呀飞" image:[UIImage imageNamed:@"QRCode"] handler:^(FFPopoverAction *action) {
    }];
    
    FFPopoverAction *action2 = [[FFPopoverAction alloc] initWithTitle:@"飞了飞" image:[UIImage imageNamed:@"search"] handler:^(FFPopoverAction *action) {
        
    }];
    
    FFPopoverAction *action3 = [[FFPopoverAction alloc] initWithTitle:@"飞不飞" image:[UIImage imageNamed:@"search"] handler:^(FFPopoverAction *action) {
        
    }];
    
    [popover addAction:action1];
    [popover addAction:action2];
    [popover addAction:action3];
    
    [self presentViewController:popover animated:YES completion:nil];

}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}



@end
