//
//  UIView+Frame.h
//  WJTR
//
//  Created by 陈峰 on 16/4/18.
//  Copyright © 2015年 TYRBL. All rights reserved.
//  交流QQ  545486205

#import <UIKit/UIKit.h>

@interface UIView (Frame)

@property (nonatomic, assign) CGSize cf_size;
@property (nonatomic, assign) CGFloat cf_width;
@property (nonatomic, assign) CGFloat cf_height;
@property (nonatomic, assign) CGFloat cf_x;
@property (nonatomic, assign) CGFloat cf_y;
@property (nonatomic, assign) CGFloat cf_centerX;
@property (nonatomic, assign) CGFloat cf_centerY;
@property (nonatomic,assign,readonly) CGFloat cf_maxY;
@property (nonatomic,assign,readonly) CGFloat cf_maxX;


+ (instancetype)initWithX:(CGFloat)x Y:(CGFloat)y width:(CGFloat)width height:(CGFloat)height;
@end
