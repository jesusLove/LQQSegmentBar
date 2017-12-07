//
//  LQQViewController.m
//  LQQSegmentBar
//
//  Created by 85174695 on 12/06/2017.
//  Copyright (c) 2017 85174695. All rights reserved.
//

#import "LQQViewController.h"
#import "LQQSegmentBarController.h"

@interface LQQViewController ()
@property (nonatomic,weak) LQQSegmentBarController *segmentBarVC;
@end

@implementation LQQViewController

- (LQQSegmentBarController *)segmentBarVC {
    if (!_segmentBarVC) {
        LQQSegmentBarController *vc = [[LQQSegmentBarController alloc] init];
        [self addChildViewController:vc];
        _segmentBarVC = vc;
    }
    return _segmentBarVC;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.segmentBarVC.segmentBar.frame = CGRectMake(0, 0, 300, 35);
    self.navigationItem.titleView = self.segmentBarVC.segmentBar;
    
    self.segmentBarVC.view.frame = self.view.bounds;
    [self.view addSubview:self.segmentBarVC.view];
    NSArray *items = @[@"专辑", @"声xxx音", @"下载中xxxx", @"下载中xxxx", @"下载中xxxx"];
    
    // 添加几个自控制器
    // 在contentView, 展示子控制器的视图内容
    
    UIViewController *vc1 = [UIViewController new];
    vc1.view.backgroundColor = [UIColor redColor];
    
    UIViewController *vc2 = [UIViewController new];
    vc2.view.backgroundColor = [UIColor greenColor];
    
    UIViewController *vc3 = [UIViewController new];
    vc3.view.backgroundColor = [UIColor yellowColor];
    
    UIViewController *vc4 = [UIViewController new];
    vc4.view.backgroundColor = [UIColor greenColor];
    
    UIViewController *vc5 = [UIViewController new];
    vc5.view.backgroundColor = [UIColor yellowColor];
    
    
    [self.segmentBarVC setUpWithItems:items childVCs:@[vc1, vc2, vc3, vc4, vc5]];
    
    [self.segmentBarVC.segmentBar updateWithConfig:^(LQQSegmentBarConfig *config) {
        config.itemNC([UIColor greenColor]).itemSC([UIColor orangeColor]).indicatorEW(5);
    }];
    
}


@end
