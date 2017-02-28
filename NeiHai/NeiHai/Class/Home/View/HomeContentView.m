//
//  HomeContentView.m
//  NeiHai
//
//  Created by 李宏鑫 on 17/2/27.
//  Copyright © 2017年 hongxinli. All rights reserved.
//

#import "HomeContentView.h"
#import "HomeContentViewCell.h"


@interface HomeContentView ()<UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@end

@implementation HomeContentView

- (void)awakeFromNib{

    [super awakeFromNib];
    [self.collectionView registerNib:[UINib nibWithNibName:@"HomeContentViewCell" bundle:nil] forCellWithReuseIdentifier:@"iiicell"];

}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return 9;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeContentViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"iiicell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor yellowColor];
    return cell;
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    NSInteger count = floor(scrollView.contentOffset.x / 375);
    CGFloat result =  scrollView.contentOffset.x / 375  - count;
    
    if (result > 0.5) {
        
//        [scrollView setContentOffset:CGPointMake(count, 0) animated:YES];
    }
    

//   CGFloat org = ;
//    if (org > 0.5) {
//        NSInteger count =
//        scrollView setContentOffset:CGPointMake(<#CGFloat x#>, <#CGFloat y#>) animated:<#(BOOL)#>
//    }
    
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{

    NSInteger count = floor(scrollView.contentOffset.x / 375);
    CGFloat result =  scrollView.contentOffset.x / 375  - count;
    
    if (result > 0.5) {
        
        [self.collectionView setContentOffset:CGPointMake((count + 1) * 375, 0) animated:YES];
    }else{
    
        [self.collectionView setContentOffset:CGPointMake(count * 375, 0) animated:YES];

    }
    
}



@end
