//
//  HomeContentView.h
//  NeiHai
//
//  Created by 李宏鑫 on 17/2/27.
//  Copyright © 2017年 hongxinli. All rights reserved.
//

#import <UIKit/UIKit.h>


@class HomeContentView;
@protocol HomeContentViewDelegate <NSObject>

- (void)HomeContentView:(HomeContentView *)view bindingTitleWithArgs:(NSArray *)args;

@end

@interface HomeContentView : UIView

- (void)scrollWithIndexPath:(NSIndexPath *)indexPath animation:(BOOL)animation;

@property (nonatomic, assign) id<HomeContentViewDelegate>delegate;
@end
