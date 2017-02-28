//
//  HomeHeadView.m
//  NeiHai
//
//  Created by 李宏鑫 on 17/2/27.
//  Copyright © 2017年 hongxinli. All rights reserved.
//

#import "HomeHeadView.h"
#import "HomeHeadViewCell.h"

@interface HomeHeadView ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong)HomeHeadViewCell *currentCell;

@property (nonatomic, strong) NSArray *dataSource;

@property (nonatomic, assign) CGFloat progress;

@end

@implementation HomeHeadView


- (NSArray *)dataSource{
    if (!_dataSource) {
        _dataSource = @[@"图片",@"段友秀",@"推荐",@"段子",@"精华",@"同城",@"游戏",@"视频",@"直播"];
    }
    return _dataSource;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"HomeHeadViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    
//    [self.collectionView setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin &UIViewAutoresizingFlexibleRightMargin];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView    {

    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    HomeHeadViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.label.text = self.dataSource[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    HomeHeadViewCell *cell = (HomeHeadViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    if (cell == self.currentCell) {
        return;
    }
    
    cell.label.textColor = [UIColor redColor];
    self.currentCell.label.textColor = [UIColor darkGrayColor];
//    cell.label.progress = _progress;

    self.currentCell = cell;
    
    if (indexPath.row > 2 && indexPath.row < 6) {
        CGPoint point = CGPointMake(50 * (indexPath.row - 3), 0);
        [self.collectionView setContentOffset:point animated:YES];
    }
  
    if (_delegate && [_delegate respondsToSelector:@selector(homeHeadView:bindingContentWithIndexPath:)]) {
        [_delegate homeHeadView:self bindingContentWithIndexPath:indexPath];
    }
    
    
    
    
}

- (void)scrollWithArgs:(NSArray *)args animation:(BOOL)animation{

//    _progress = [args[1] floatValue];
//    
//    HomeHeadViewCell *cell = (HomeHeadViewCell *)[self.collectionView cellForItemAtIndexPath:args[0]];
//    
//    cell.label.progress = _progress;
//    
//    NSLog(@"%.2f", _progress);0[self 0collectionView:self.collectionView didSelectItemAtIndexPath:args[0]];
    
    //取出进度 旧的indexPath 新的indexPath
    CGFloat trans = [args[0] floatValue];
    NSIndexPath *oldIndexPath = args[1];
    NSIndexPath *newIndexPath = args[2];
    BOOL direction = [args[3] boolValue];
    
    //根据indexPath取cell
    HomeHeadViewCell *oldCell = (HomeHeadViewCell *)[self.collectionView cellForItemAtIndexPath:oldIndexPath];
    oldCell.label.isSelect = YES;
    oldCell.label.direction = direction;
    
    HomeHeadViewCell *newCell = (HomeHeadViewCell *)[self.collectionView cellForItemAtIndexPath:newIndexPath];
    newCell.label.isSelect = NO;
    newCell.label.direction = direction;

    
    //设置进度
    oldCell.label.progress = trans;
    newCell.label.progress = trans;
    
    //判断进度
    if (trans == 1.00) {
        [self collectionView:self.collectionView didSelectItemAtIndexPath:newIndexPath];
    }
    
}



- (void)select{

    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:3 inSection:0];
    [self collectionView:self.collectionView didSelectItemAtIndexPath:indexPath];
}

@end
