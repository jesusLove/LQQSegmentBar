//
//  LQQSegmentBarConfig.h
//  LQQSegmentBar_Example
//
//  Created by lqq on 2017/12/7.
//  Copyright © 2017年 85174695. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LQQSegmentBarConfig : NSObject

+ (instancetype)defaultConfig;

// 链式编程
@property (nonatomic, copy, readonly) LQQSegmentBarConfig *(^itemNC)(UIColor *color);
@property (nonatomic, copy, readonly) LQQSegmentBarConfig *(^itemSC)(UIColor *color);
@property (nonatomic, copy, readonly) LQQSegmentBarConfig *(^itemFont)(UIFont *font);

@property (nonatomic, copy, readonly) LQQSegmentBarConfig *(^indicatorColor)(UIColor *color);
@property (nonatomic, copy, readonly) LQQSegmentBarConfig *(^indicatorHeight)(CGFloat h);
@property (nonatomic, copy, readonly) LQQSegmentBarConfig *(^indicatorEW)(CGFloat w);

@property (nonatomic, copy, readonly) LQQSegmentBarConfig *(^segmentBGColor)(UIColor *color);


@end
