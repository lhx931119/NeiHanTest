//
//  HomeHeadView.h
//  NeiHai
//
//  Created by 李宏鑫 on 17/2/27.
//  Copyright © 2017年 hongxinli. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HomeHeadView;

@protocol HomeHeadViewDelegate <NSObject>

- (void)homeHeadView:(HomeHeadView *)view bindingContentWithIndexPath:(NSIndexPath *)indexPath;

@end

@interface HomeHeadView : UIView

@property (nonatomic, assign) id <HomeHeadViewDelegate>delegate;

- (void)select;

- (void)scrollWithArgs:(NSArray *)args animation:(BOOL)animation;

@end
