//
//  HomeContentView.m
//  NeiHai
//
//  Created by 李宏鑫 on 17/2/27.
//  Copyright © 2017年 hongxinli. All rights reserved.
//

#import "HomeContentView.h"
#import "HomeContentViewCell.h"

static NSString *HomeContentCell = @"HomeContentCell";

@interface HomeContentView ()<UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

/**
 当前拖拽点x
 */
@property (nonatomic, assign) CGFloat currentOffX;

/**
 拖拽进度
 */
@property (nonatomic, assign) CGFloat trans;

@end

@implementation HomeContentView

- (void)awakeFromNib{

    [super awakeFromNib];
    [self.collectionView registerNib:[UINib nibWithNibName:@"HomeContentViewCell" bundle:nil] forCellWithReuseIdentifier:HomeContentCell];

}

#pragma mark ---UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return 9;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeContentViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HomeContentCell forIndexPath:indexPath];
    cell.backgroundColor = [UIColor yellowColor];
    return cell;
    
}






#pragma mark -- UIScrollViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {

    //记录开始拖拽的点offx
    self.currentOffX = scrollView.contentOffset.x;
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{

    //取出此时offx
    CGFloat currentX = scrollView.contentOffset.x;
    //判断左滑右滑
    if (currentX > _currentOffX) {
        //左滑
        //判断滑动的比例
        NSInteger count = floor( currentX / [UIScreen mainScreen].bounds.size.width);
        if (count == 8) {
            return;
        }
        CGFloat trans = currentX / [UIScreen mainScreen].bounds.size.width - count;
        if (trans > 0.5) {
            //划过一半
            [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:count + 1 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
        }else{
            //不过一半
            [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:count inSection:0] atScrollPosition:UICollectionViewScrollPositionRight animated:YES];
            
        }
        
    }else{
        //右滑
        //判断滑动的比例
        NSInteger count = floor( currentX / [UIScreen mainScreen].bounds.size.width);
        //划过一半

        CGFloat trans = 1 - (currentX / [UIScreen mainScreen].bounds.size.width - count);
        if (trans < 0.5) {
            
            [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:count + 1 inSection:0] atScrollPosition:UICollectionViewScrollPositionRight animated:YES];
        }else{
            //不过一半
            [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:count inSection:0] atScrollPosition:UICollectionViewScrollPositionRight animated:YES];
        }
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    
    CGFloat currentX = scrollView.contentOffset.x;
    NSInteger count = floor( currentX / [UIScreen mainScreen].bounds.size.width);
    if (currentX > _currentOffX) {
        //左滑
       _trans = (currentX / [UIScreen mainScreen].bounds.size.width - count);
        if (_trans == 0.00) {
            _trans = 1.00;
            count = count - 1;
        }
        //左滑
        if (_delegate && [_delegate respondsToSelector:@selector(HomeContentView:bindingTitleWithArgs:)]) {
            NSIndexPath *oldIndexPath = [NSIndexPath indexPathForRow:count inSection:0];
            NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:count + 1 inSection:0];
            NSArray *args = @[@(_trans), oldIndexPath, newIndexPath,@1];
            [_delegate  HomeContentView:self bindingTitleWithArgs:args];
        }
    }else{
        //右滑
        _trans = 1 - (currentX / [UIScreen mainScreen].bounds.size.width - count);
        if (_trans == 0.00) {
            _trans = 1.00;
            count = count + 1;
        }

        
        if (_delegate && [_delegate respondsToSelector:@selector(HomeContentView:bindingTitleWithArgs:)]) {
            NSIndexPath *oldIndexPath = [NSIndexPath indexPathForRow:count + 1 inSection:0];
            NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:count inSection:0];
            NSArray *args = @[@(_trans), oldIndexPath, newIndexPath, @0];
            [_delegate  HomeContentView:self bindingTitleWithArgs:args];
        }
        
      
    }
    
    
   
  
    
    

    
  

}


//滚动处理
- (void)scrollWithIndexPath:(NSIndexPath *)indexPath animation:(BOOL)animation{
    

    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}

@end
