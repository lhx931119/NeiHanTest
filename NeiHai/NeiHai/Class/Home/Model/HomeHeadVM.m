//
//  HomeHeadVM.m
//  NeiHai
//
//  Created by 李宏鑫 on 17/2/27.
//  Copyright © 2017年 hongxinli. All rights reserved.
//

#import "HomeHeadVM.h"

@implementation HomeHeadVM

- (instancetype)initWithDic:(NSDictionary *)dict{
    
    self = [super init];
    if (self) {
        
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}




@end
