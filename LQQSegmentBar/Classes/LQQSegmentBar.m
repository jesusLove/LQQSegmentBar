//
//  LQQSegmentBar.m
//  LQQSegmentBar_Example
//
//  Created by lqq on 2017/12/6.
//  Copyright © 2017年 85174695. All rights reserved.
//

#import "LQQSegmentBar.h"
#import "UIView+LQQSegmentBar.h"

#define kMinMargin 30

@interface LQQSegmentBar ()
{
    UIButton *_lastBtn;
}

@property (nonatomic, weak) UIScrollView *contentView;

@property (nonatomic, strong) NSMutableArray <UIButton *>*itemBtns;

@property (nonatomic, weak) UIView *indicatorView;


@property (nonatomic, strong) LQQSegmentBarConfig *config;

@end

@implementation LQQSegmentBar

#pragma mark - 接口

+ (instancetype)segmentBarWithFrame:(CGRect)frame {
    LQQSegmentBar *segmentBar = [[LQQSegmentBar alloc] initWithFrame:frame];
    return segmentBar;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = self.config.segmentBarBackgroundColor;
    }
    return self;
}

- (void)updateWithConfig:(void (^)(LQQSegmentBarConfig *))configBlock {
    if (configBlock) {
        configBlock(self.config);
    }
    self.backgroundColor = self.config.segmentBarBackgroundColor;
    for (UIButton *btn in self.itemBtns) {
        [btn setTitleColor:self.config.itemNormalColor forState:UIControlStateNormal];
        [btn setTitleColor:self.config.itemSelectedColor forState:UIControlStateSelected];
        btn.titleLabel.font = self.config.font;
    }
    self.indicatorView.backgroundColor = self.config.indColor;
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)setSelectIndex:(NSInteger)selectIndex {
    if (self.itemBtns.count == 0 || selectIndex < 0 || selectIndex > self.itemBtns.count - 1) {
        return;
    }
    _selectIndex = selectIndex;
    UIButton *btn = self.itemBtns[selectIndex];
    [self btnClick:btn];
}

- (void)setItems:(NSArray<NSString *> *)items {
    _items = items;
    // 删除之前添加过组件
    [self.itemBtns makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.itemBtns = nil;
    
    for (NSString *item in items) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = self.itemBtns.count;
        [btn setTitle:item forState:UIControlStateNormal];
        [btn setTitleColor:self.config.itemNormalColor forState:UIControlStateNormal];
        [btn setTitleColor:self.config.itemSelectedColor forState:UIControlStateSelected];
        btn.titleLabel.font = self.config.font;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        [self.contentView addSubview:btn];
        [self.itemBtns addObject:btn];
    }
    //手动刷新布局
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

#pragma mark - 懒加载
- (UIScrollView *)contentView {
    if (!_contentView) {
        UIScrollView *contentView = [[UIScrollView alloc] init];
        contentView.showsHorizontalScrollIndicator = NO;
        [self addSubview:contentView];
        _contentView = contentView;
    }
    return _contentView;
}

- (NSMutableArray<UIButton *> *)itemBtns {
    if (!_itemBtns) {
        _itemBtns = [NSMutableArray array];
    }
    return _itemBtns;
}
- (UIView *)indicatorView {
    if (!_indicatorView) {
        CGFloat indicatorH = self.config.indHeight;
        UIView *indicatorView = [[UIView alloc] initWithFrame:CGRectMake(0, self.height - indicatorH, 0, indicatorH)];
        indicatorView.backgroundColor = self.config.indColor;
        [self.contentView addSubview:indicatorView];
        _indicatorView = indicatorView;
    }
    return _indicatorView;
}
- (LQQSegmentBarConfig *)config {
    if (!_config) {
        _config = [LQQSegmentBarConfig defaultConfig];
    }
    return _config;
}



#pragma mark - 私有方法
- (void)btnClick:(UIButton *)btn {
    
    
    if ([self.delegate respondsToSelector:@selector(segmentBar:didSelectIndex:fromIndex:)]) {
        [self.delegate segmentBar:self didSelectIndex:btn.tag fromIndex:_lastBtn.tag];
    }
    _selectIndex = btn.tag;
    
    _lastBtn.selected = NO;
    btn.selected = YES;
    _lastBtn = btn;
    
    [UIView animateWithDuration:0.1 animations:^{
        self.indicatorView.width = btn.width + self.config.indExtraW * 2;
        self.indicatorView.centerX = btn.centerX;
    }];
    CGFloat scrollX = btn.centerX - self.contentView.width * 0.5;
    if (scrollX < 0) {
        scrollX = 0;
    }
    if (scrollX > self.contentView.contentSize.width - self.contentView.width) {
        scrollX = self.contentView.contentSize.width - self.contentView.width;
    }
    [self.contentView setContentOffset:CGPointMake(scrollX, 0) animated:YES];
    NSLog(@"%f", scrollX);
}

#pragma mark - 布局

- (void)layoutSubviews {
    [super layoutSubviews];
    self.contentView.frame = self.bounds;
    
    CGFloat totalBtnWidth = 0;
    for (UIButton *btn in self.itemBtns) {
        [btn sizeToFit];
        totalBtnWidth += btn.width;
    }
    CGFloat caculateMargin = (self.width - totalBtnWidth) / (self.items.count + 1);
    if (caculateMargin < kMinMargin) {
        caculateMargin = kMinMargin;
    }
    CGFloat lastX = caculateMargin;
    
    for (UIButton *btn in self.itemBtns) {
        [btn sizeToFit];
        btn.y = 0;
        btn.x = lastX;
        
        lastX += btn.width + caculateMargin;
    }
    self.contentView.contentSize = CGSizeMake(lastX, 0);
    
    if (self.itemBtns.count == 0 ) {
        return;
    }
    UIButton *btn = self.itemBtns[self.selectIndex];
    self.indicatorView.width = btn.width + self.config.indExtraW * 2;
    self.indicatorView.centerX = btn.centerX;
    self.indicatorView.height = self.config.indHeight;
    self.indicatorView.y = self.height - self.indicatorView.height;
    
}
@end
