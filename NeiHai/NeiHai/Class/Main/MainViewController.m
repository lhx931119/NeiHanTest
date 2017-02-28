//
//  MainViewController.m
//  NeiHai
//
//  Created by 李宏鑫 on 17/2/27.
//  Copyright © 2017年 hongxinli. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildVCWithName:@"Home"];
    [self addChildVCWithName:@"Discover"];
    [self addChildVCWithName:@"New"];
    [self addChildVCWithName:@"Message"];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)addChildVCWithName:(NSString *)name{

 
  UIStoryboard *story = [UIStoryboard storyboardWithName:name bundle:nil];
   UIViewController *vc = [story instantiateViewControllerWithIdentifier:name];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
//    nav.navigationBar.translucent = YES;
    
    [self addChildViewController:nav];
}




@end
