//
//  NSString+Additions.m
//  WJTR
//
//  Created by 陈峰 on 16/4/18.
//  Copyright © 2015年 TYRBL. All rights reserved.
//  交流QQ  545486205

#import "NSString+Additions.h"

@implementation NSString (Additions)

- (CGFloat )heightWithSize:(CGSize )size fontSize:(CGFloat )fontSize  otherAttributes:(NSDictionary *)otherAttributes context:(nullable NSStringDrawingContext *)context{
    
    
    CGRect rect = [self rectWithSize:size fontSize:fontSize otherAttributes:otherAttributes context:context];
  
    return rect.size.height;
}


- (CGFloat)widthWithSize:(CGSize)size fontSize:(CGFloat)fontSize otherAttributes:(NSDictionary *)otherAttributes context:(NSStringDrawingContext *)context{
    
    CGRect rect = [self rectWithSize:size fontSize:fontSize otherAttributes:otherAttributes context:context];
    
    return rect.size.width;

}


- (CGRect)rectWithSize:(CGSize)size fontSize:(CGFloat)fontSize otherAttributes:(NSDictionary *)otherAttributes context:(NSStringDrawingContext *)context{
    
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithDictionary:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]}];
    if (otherAttributes) {
        
        for (NSString *aKey in otherAttributes.allKeys) {
            
            id aValue  = [otherAttributes objectForKey:aKey];
            
            [dictionary setObject:aValue forKey:aKey];
            
        }
        
    }
    
    CGRect rect = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:dictionary context:context];
    
    return rect;
}


- (BOOL)judgeLastLetterEquleString:(NSString *)string{
    
    if (!self.length) {
        
        return  NO;
    }
    
    NSString *lastletter = [self substringFromIndex:self.length - 1];
    if (![lastletter isEqualToString:string]) {
        
        return  NO;
    }
    
    return  YES;

    
    
}

@end
