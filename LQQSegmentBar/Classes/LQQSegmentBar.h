//
//  LQQSegmentBar.h
//  LQQSegmentBar_Example
//
//  Created by lqq on 2017/12/6.
//  Copyright © 2017年 85174695. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LQQSegmentBarConfig.h"

@class LQQSegmentBar;

@protocol LQQSegementBarDelegate <NSObject>

- (void)segmentBar: (LQQSegmentBar *)segmentBar didSelectIndex:(NSInteger)toIndex fromIndex: (NSInteger)fromIndex;
@end

@interface LQQSegmentBar : UIView

/**
 创建SegmentBar对象

 @param frame Frame
 @return 实例
 */
+ (instancetype)segmentBarWithFrame: (CGRect)frame;

// 要显示的字符数组
@property (nonatomic, strong) NSArray <NSString*> * items;
// 代理
@property (nonatomic, weak) id <LQQSegementBarDelegate> delegate;
// 被选中项
@property (nonatomic, assign) NSInteger selectIndex;

// 更新配置信息
- (void)updateWithConfig:(void(^)(LQQSegmentBarConfig *config))configBlock;
@end
