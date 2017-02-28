//
//  HomeHeadViewLabel.m
//  NeiHai
//
//  Created by 李宏鑫 on 17/2/27.
//  Copyright © 2017年 hongxinli. All rights reserved.
//

#import "HomeHeadViewLabel.h"

@implementation HomeHeadViewLabel


- (void)drawRect:(CGRect)rect{

    [super drawRect:rect];
    
    [self scrollWithRect:rect];
     
}

- (void)scrollWithRect:(CGRect)rect{
    
    if (self.isSelect) {
        
        [[UIColor darkGrayColor] set];
        
    }else{
        [[UIColor redColor] set];
        
    }
    CGRect fillRect = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width * self.progress, rect.size.height);
    
    UIRectFillUsingBlendMode(fillRect, kCGBlendModeSourceIn);
    
}



- (void)setProgress:(CGFloat)progress   {

    if (!_direction) {
        _progress = 1 - progress;
    }else {
        _progress = progress;
    }
        [self setNeedsDisplay];

    
}
@end
