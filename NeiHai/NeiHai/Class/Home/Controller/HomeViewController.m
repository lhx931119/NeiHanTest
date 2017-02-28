//
//  HomeViewController.m
//  NeiHaiTest
//
//  Created by 李宏鑫 on 17/2/27.
//  Copyright © 2017年 hongxinli. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeHeadView.h"
#import "HomeContentView.h"
@interface HomeViewController ()<HomeHeadViewDelegate, HomeContentViewDelegate>

@property (nonatomic, strong) HomeHeadView *headView;
@property (nonatomic, strong) HomeContentView *contentView;

@end

@implementation HomeViewController

- (HomeHeadView *)headView{

    if (!_headView) {
        
      _headView =  [[[NSBundle mainBundle] loadNibNamed:@"HomeHeadView" owner:0 options:0] firstObject];
        _headView.delegate = self;
        _headView.frame = CGRectMake(0, 64, 375, 40);
        

    }
    return _headView;
}


- (HomeContentView *)contentView    {

    if (!_contentView) {
       _contentView = [[[NSBundle mainBundle] loadNibNamed:@"HomeContentView" owner:0 options:0] firstObject];
        _contentView.delegate = self;
        _contentView.frame = CGRectMake(0, 104, 375, 563);
    }
    return _contentView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    self.automaticallyAdjustsScrollViewInsets = NO;

    [self setNav];

    [self.view addSubview:self.headView];
    [self.view addSubview:self.contentView];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.headView select];
    });
    
}


- (void)setNav{
    
    UIImageView *icnImage = [[UIImageView alloc] init];
    icnImage.userInteractionEnabled = YES;
    icnImage.frame = CGRectMake(0, 0, 20, 20);
    icnImage.layer.cornerRadius = 10.0;
    icnImage.backgroundColor = [UIColor redColor];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(info:)];
    [icnImage addGestureRecognizer:tap];
    
    NSArray *items = @[@"精选",@"关注"];
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:items];
    segment.selectedSegmentIndex = 0;
    segment.frame = CGRectMake(0, 0, 100, 20);
    segment.tintColor = [UIColor darkGrayColor];
    [segment addTarget:self action:@selector(select:) forControlEvents:UIControlEventValueChanged];
    
    UIButton *editBtn = [[UIButton alloc] init];
    [editBtn setImage:[UIImage imageNamed:@"compile"] forState:UIControlStateNormal];
    [editBtn sizeToFit];
    [editBtn addTarget:self action:@selector(edit:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:icnImage];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:editBtn];
    
    
    self.navigationController.navigationBar.backgroundColor = [UIColor darkGrayColor];
    
    
    self.navigationItem.leftBarButtonItem = leftItem;
    self.navigationItem.rightBarButtonItem = rightItem;
    self.navigationItem.titleView = segment;
    
}



- (void)info:(UITapGestureRecognizer *)tap{

    
}

- (void)select:(UISegmentedControl *)segment{


}

- (void)edit:(UIButton *)edit{

}

#pragma  mark -HomeHeadViewDelegate
- (void)homeHeadView:(HomeHeadView *)view bindingContentWithIndexPath:(NSIndexPath *)indexPath{
    
    [self.contentView scrollWithIndexPath:indexPath animation:YES];
        
}

#pragma mark -- HomeContentViewDelegate

- (void)HomeContentView:(HomeContentView *)view bindingTitleWithArgs:(NSArray *)args{

    [self.headView scrollWithArgs:args animation:YES];
}
@end
