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

// 右边加号点击
- (IBAction)rightPlusClicked:(UITapGestureRecognizer *)sender {
    
    
    FFPopoverController *popover = [[FFPopoverController alloc] initWithFromView:sender.view ];
    popover.contentColor = [UIColor blueColor];
    [popover addAction: [[FFPopoverAction alloc] initWithTitle:@"扫一扫" image:nil handler:^() {
        
    }] ];
    [popover addAction: [[FFPopoverAction alloc] initWithTitle:@"看一看" image:nil handler:^() {
        
    }] ];
    
    [self presentViewController:popover animated:YES completion:nil];
    

}


- (IBAction)rightTextClicked:(UITapGestureRecognizer *)sender {
    
    FFPopoverController *popover = [[FFPopoverController alloc] initWithFromView:sender.view ];
    popover.contentColor = [UIColor blueColor];
    [popover addAction: [[FFPopoverAction alloc] initWithTitle:@"哈一哈" image:nil handler:^() {
        
    }] ];
    [popover addAction: [[FFPopoverAction alloc] initWithTitle:@"看一看" image:nil handler:^() {
        
    }] ];
    
    [self presentViewController:popover animated:YES completion:nil];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}



@end
