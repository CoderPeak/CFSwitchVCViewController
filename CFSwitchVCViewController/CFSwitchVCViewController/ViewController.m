//
//  ViewController.m
//  CFSwitchVCViewController
//
//  Created by 陈峰 on 16/4/18.
//  Copyright © 2016年 TYRBL. All rights reserved.
//  交流QQ  545486205

#import "ViewController.h"
#import "CFSwitchUnderLineVC.h"
#import "UIView+Frame.h"
#import "CFMacro.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    
    /* 引导页 可以选择你喜欢的 切换指示器 样式 */
    // 目前仅提供了 切换时下划线样式  可以手滑
    
    [self sutupSubViews];
    
}

#pragma mark 布局子控件
- (void)sutupSubViews
{
    UILabel *titleL = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.cf_width, 50)];
    titleL.numberOfLines = 0;
    titleL.textAlignment = NSTextAlignmentCenter;
    titleL.textColor = CFRandomColor;
    titleL.text = @"新人第一次写demo, 大神海涵, 不喜勿喷...\n目前demo仅一种样式, 有空补上其他样式";
    [self.view addSubview:titleL];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"点此进入-->底部下划线样式切换" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(switchVCWithUnderLineShow) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(0, 200, self.view.cf_width, 50);
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.backgroundColor = CFRandomColor;
    [self.view addSubview:btn];
}

#pragma mark - button actions
- (void)switchVCWithUnderLineShow
{
    CFSwitchUnderLineVC *toVC = [[CFSwitchUnderLineVC alloc] init];
    [self.navigationController pushViewController:toVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
