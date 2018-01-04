//
//  LQQBaseViewController.m
//  LQQSegmentBar_Example
//
//  Created by lqq on 2017/12/16.
//  Copyright © 2017年 85174695. All rights reserved.
//

#import "LQQBaseViewController.h"
#import "LQQSegmentBarController.h"


@interface LQQBaseViewController ()
@property (nonatomic,weak) LQQSegmentBarController *segmentBarVC;
@end

@implementation LQQBaseViewController
- (LQQSegmentBarController *)segmentBarVC {
    if (!_segmentBarVC) {
        LQQSegmentBarController *vc = [[LQQSegmentBarController alloc] init];
        [self addChildViewController:vc];
        _segmentBarVC = vc;
    }
    return _segmentBarVC;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.segmentBarVC.view.frame = self.view.bounds;
    self.segmentBarVC.segmentBarHeight = 50;
    [self.view addSubview:self.segmentBarVC.view];
    NSArray *items = @[@"新闻",@"体育",@"综艺",@"教育",@"生活"];
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
        // 改变Bar样式
        config.itemNC(UIColor.orangeColor).itemSC(UIColor.redColor);
    }];
}

@end
