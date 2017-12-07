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

- (void)setUpWithItems:(NSArray <NSString *>*)items childVCs:(NSArray <UIViewController *>*)childVCs;

@end
