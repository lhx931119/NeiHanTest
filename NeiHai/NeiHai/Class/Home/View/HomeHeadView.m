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
    cell.backgroundColor = [UIColor greenColor];
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
    self.currentCell = cell;
    
}




- (void)select{

    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self collectionView:self.collectionView didSelectItemAtIndexPath:indexPath];
}

@end
