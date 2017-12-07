//
//  LQQSegmentBarController.m
//  LQQSegmentBar_Example
//
//  Created by lqq on 2017/12/6.
//  Copyright © 2017年 85174695. All rights reserved.
//

#import "LQQSegmentBarController.h"
#import "UIView+LQQSegmentBar.h"

@interface LQQSegmentBarController ()<LQQSegementBarDelegate, UIScrollViewDelegate>

@property (nonatomic, weak) UIScrollView *contentView;
@end

@implementation LQQSegmentBarController

#pragma MARK - 懒加载
- (LQQSegmentBar *)segmentBar {
    if (!_segmentBar) {
        LQQSegmentBar *segmentBar = [LQQSegmentBar segmentBarWithFrame:CGRectZero];
        segmentBar.delegate = self;
        segmentBar.backgroundColor = [UIColor brownColor];
        [self.view addSubview:segmentBar];
        _segmentBar = segmentBar;
    }
    return _segmentBar;
}
- (UIScrollView *)contentView {
    if (!_contentView) {
        UIScrollView *contentView = [[UIScrollView alloc] init];
        contentView.delegate = self;
        contentView.pagingEnabled = YES;
        [self.view addSubview:contentView];
        _contentView = contentView;
    }
    return _contentView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)setUpWithItems:(NSArray<NSString *> *)items childVCs:(NSArray<UIViewController *> *)childVCs {
    NSAssert(items.count != 0 || items.count == childVCs.count, @"个数不同，Error！！！");
    self.segmentBar.items = items;
    [self.childViewControllers makeObjectsPerformSelector:@selector(removeFromParentViewController)];
    
    for (UIViewController *vc in childVCs) {
        [self addChildViewController:vc];
    }
    self.contentView.contentSize = CGSizeMake(items.count * self.view.width, 0);
    self.segmentBar.selectIndex = 0;
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    // 分离布局
    if (self.segmentBar.superview == self.view) {
        self.contentView.contentSize = CGSizeMake(self.childViewControllers.count * self.view.width, 0);
        self.segmentBar.frame = CGRectMake(0, 60, self.view.width, 40);
        CGFloat contentViewY = self.segmentBar.y + self.segmentBar.height;
        CGRect contentFrame = CGRectMake(0, contentViewY, self.view.width, self.view.height - contentViewY);
        self.contentView.frame = contentFrame;
        return;
    }
    CGRect contentFrame = CGRectMake(0, 0, self.view.width, self.view.height);
    self.contentView.frame = contentFrame;
    self.contentView.contentSize = CGSizeMake(self.childViewControllers.count * self.view.width, 0);
}

- (void)showChildVCViewsAtIndex:(NSInteger)index {
    if (self.childViewControllers.count == 0 || index < 0 || index > self.childViewControllers.count - 1) {
        return ;
    }
    UIViewController *vc = self.childViewControllers[index];
    vc.view.frame = CGRectMake(index * self.contentView.width, 0, self.contentView.width, self.contentView.height);
    [self.contentView addSubview:vc.view];
    [self.contentView setContentOffset:CGPointMake(index * self.contentView.width, 0) animated:YES];
}

#pragma MARK - LQQSegementBarDelegate
- (void)segmentBar:(LQQSegmentBar *)segmentBar didSelectIndex:(NSInteger)toIndex fromIndex:(NSInteger)fromIndex {
    [self showChildVCViewsAtIndex:toIndex];
}

#pragma MARK - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger index = self.contentView.contentOffset.x / self.contentView.width;
    self.segmentBar.selectIndex = index;
}

@end
