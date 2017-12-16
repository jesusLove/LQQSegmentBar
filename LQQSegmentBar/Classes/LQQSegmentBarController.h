//
//  LQQSegmentBarController.h
//  LQQSegmentBar_Example
//
//  Created by lqq on 2017/12/6.
//  Copyright © 2017年 85174695. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LQQSegmentBar.h"

@interface LQQSegmentBarController : UIViewController

@property (nonatomic, weak) LQQSegmentBar *segmentBar;

/**
 SegmentBar高度，segment放在NavigationBar.titleView中时可以不使用这个属性
 */
@property (nonatomic, assign) CGFloat segmentBarHeight;

/**
 向SegmentController传递数据和VC

 @param items 数据
 @param childVCs 子控制器
 */
- (void)setUpWithItems:(NSArray <NSString *>*)items childVCs:(NSArray <UIViewController *>*)childVCs;

@end
