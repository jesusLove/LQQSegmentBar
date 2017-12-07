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

+ (instancetype)segmentBarWithFrame: (CGRect)frame;

@property (nonatomic, strong) NSArray <NSString*> * items;

@property (nonatomic, weak) id <LQQSegementBarDelegate> delegate;

@property (nonatomic, assign) NSInteger selectIndex;

- (void)updateWithConfig:(void(^)(LQQSegmentBarConfig *config))configBlock;
@end
