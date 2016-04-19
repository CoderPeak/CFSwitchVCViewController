//
//  CFMacro.h
//  CFSwitchVCViewController
//
//  Created by 陈峰 on 16/4/18.
//  Copyright © 2016年 TYRBL. All rights reserved.
//  全局宏


#ifndef CFMacro_h
#define CFMacro_h


/** 颜色相关 */
// 创建颜色 对象
#define NewColor(R,G,B,A) [UIColor colorWithRed:(R)/255.0 green:(G)/255.0 blue:(B)/255.0 alpha:(A)]
// 随机色
#define CFRandomColor NewColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255), 1.0)

#define  APPMainColor  [UIColor colorWithHexString:@"ff6633"]

#define  KTextBlackColor [UIColor colorWithHexString:@"333333"]

#define  KTextDarkGrayColor [UIColor colorWithHexString:@"666666"]

#define  KTextGrayColor [UIColor colorWithHexString:@"999999"]

#define  KLightGrayBackColor  [UIColor colorWithHexString:@"c8c8c8"]



#define CFScreenWidth [UIScreen mainScreen].bounds.size.width

#endif /* CFMacro_h */
