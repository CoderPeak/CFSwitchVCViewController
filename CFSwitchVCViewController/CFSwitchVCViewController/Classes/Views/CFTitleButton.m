//
//  CFTitleButton.m
//  WJTR
//
//  Created by 陈峰 on 16/4/18.
//  Copyright © 2016年 TYRBL. All rights reserved.
//  交流QQ  545486205

#import "CFTitleButton.h"
#import "CFMacro.h"
#import "UIColor+Additions.h"

@implementation CFTitleButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setTitleColor:KTextGrayColor forState:UIControlStateNormal];
        [self setTitleColor:APPMainColor forState:UIControlStateSelected];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return self;
}

/**
 *  重写这个方法的目的：去掉父类在highlighted时做的一切操作
 */
- (void)setHighlighted:(BOOL)highlighted {}

@end
