//
//  UIView+Frame.m
//  WJTR
//
//  Created by Peak on 16/4/18.
//  Copyright © 2015年 TYRBL. All rights reserved.
//  交流QQ  545486205

#import "UIView+Frame.h"

@implementation UIView (Frame)



- (void)setCf_size:(CGSize)cf_size{
    CGRect frame = self.frame;
    frame.size = cf_size;
    self.frame = frame;
}

- (CGSize)cf_size{
    
     return self.frame.size;
}



- (void)setCf_width:(CGFloat)cf_width{
    
    CGRect frame = self.frame;
    frame.size.width = cf_width;
    self.frame = frame;
}


- (void)setCf_height:(CGFloat)cf_height{
    
    CGRect frame = self.frame;
    frame.size.height = cf_height;
    self.frame = frame;
}


- (void)setCf_x:(CGFloat)cf_x{
    
    CGRect frame = self.frame;
    frame.origin.x = cf_x;
    self.frame = frame;
}

- (void)setCf_y:(CGFloat)cf_y{
    
    CGRect frame = self.frame;
    frame.origin.y = cf_y;
    self.frame = frame;
}


- (void)setCf_centerX:(CGFloat)cf_centerX{
    
    CGPoint center = self.center;
    center.x = cf_centerX;
    self.center = center;
}


- (void)setCf_centerY:(CGFloat)cf_centerY{
    
    CGPoint center = self.center;
    center.y = cf_centerY;
    self.center = center;
}


- (CGFloat)cf_centerY{
    
    return self.center.y;
}

-(CGFloat)cf_centerX{
    
    return self.center.x;
}

- (CGFloat)cf_width{
    
      return self.frame.size.width;
}

- (CGFloat)cf_height{
    
     return self.frame.size.height;
}

- (CGFloat)cf_x{
    
    return self.frame.origin.x;
}


- (CGFloat)cf_y{
    
     return self.frame.origin.y;
}


- (CGFloat)cf_maxX{
    
     return self.frame.size.width + self.frame.origin.x;
}

- (CGFloat)cf_maxY{
    
    return self.frame.size.height + self.frame.origin.y;
}




+ (instancetype)initWithX:(CGFloat)x Y:(CGFloat)y width:(CGFloat)width height:(CGFloat)height
{
    return [[self alloc] initWithFrame:CGRectMake(x, y, width, height)];
}

@end
