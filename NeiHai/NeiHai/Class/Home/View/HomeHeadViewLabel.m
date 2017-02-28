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
    
    if (self.isSelect) {
        [[UIColor clearColor] set];
    }else{
        [[UIColor redColor] set];
    }
    self.isSelect = !self.isSelect;
    CGRect fillRect = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width * self.progress, rect.size.height);
    UIRectFillUsingBlendMode(fillRect, kCGBlendModeSourceAtop);
}


- (void)setProgress:(CGFloat)progress   {

    _progress = progress;
    
    [self setNeedsDisplay];
    
}
@end
