//
//  NSString+Additions.h
//  WJTR
//
//  Created by 陈峰 on 16/4/18.
//  Copyright © 2015年 TYRBL. All rights reserved.
//  交流QQ  545486205

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Additions)

- (CGFloat)heightWithSize:(CGSize )size fontSize:(CGFloat )fontSize  otherAttributes:(nullable NSDictionary *)otherAttributes context:(nullable NSStringDrawingContext *)context;


- (CGFloat)widthWithSize:(CGSize )size fontSize:(CGFloat )fontSize  otherAttributes:(nullable NSDictionary *)otherAttributes context:(nullable NSStringDrawingContext *)context;


- (BOOL)judgeLastLetterEquleString:(nullable NSString *)string;

@end
