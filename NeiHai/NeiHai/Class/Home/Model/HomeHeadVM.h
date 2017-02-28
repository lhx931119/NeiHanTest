//
//  HomeHeadVM.h
//  NeiHai
//
//  Created by 李宏鑫 on 17/2/27.
//  Copyright © 2017年 hongxinli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeHeadVM : NSObject

@property (nonatomic, strong) NSString *title;

@property (nonatomic, assign, getter=isSelect) BOOL select;

@end
