//
//  CFShowContentVC.m
//  CFSwitchVCViewController
//
//  Created by 陈峰 on 16/4/18.
//  Copyright © 2016年 TYRBL. All rights reserved.
//  此控制器仅仅用于展示简单的图片内容

#import "CFShowContentVC.h"
#import "CFMacro.h"
#import "UIView+Frame.h"

@interface CFShowContentVC ()

@end

@implementation CFShowContentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = CFRandomColor;
    // 布局子控件---仅展示图片
    [self setupSubViews];
    
}

#pragma mark - 布局子控件
- (void)setupSubViews
{
    UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64+45, self.view.cf_width, self.view.cf_height-64-45)];
//    imgV.contentMode = UIViewContentModeScaleAspectFit;
    imgV.image = [UIImage imageNamed:self.imgNameStr];
    [self.view addSubview:imgV];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
