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

/**
 segmentBar背景色
 */
@property (nonatomic, strong) UIColor *segmentBarBackgroundColor;

/**
 Item颜色
 */
@property (nonatomic, strong) UIColor *itemNormalColor;

/**
 Item选中时颜色
 */
@property (nonatomic, strong) UIColor *itemSelectedColor;

/**
 字体大小
 */
@property (nonatomic, strong) UIFont *font;

/**
 指示器颜色，高度，额外宽度
 */
@property (nonatomic, strong) UIColor *indColor;
@property (nonatomic, assign) CGFloat indHeight;
@property (nonatomic, assign) CGFloat indExtraW;


// 链式编程， 设置上述属性。
@property (nonatomic, copy, readonly) LQQSegmentBarConfig *(^itemNC)(UIColor *color);
@property (nonatomic, copy, readonly) LQQSegmentBarConfig *(^itemSC)(UIColor *color);
@property (nonatomic, copy, readonly) LQQSegmentBarConfig *(^itemFont)(UIFont *font);

@property (nonatomic, copy, readonly) LQQSegmentBarConfig *(^indicatorColor)(UIColor *color);
@property (nonatomic, copy, readonly) LQQSegmentBarConfig *(^indicatorHeight)(CGFloat h);
@property (nonatomic, copy, readonly) LQQSegmentBarConfig *(^indicatorEW)(CGFloat w);

@property (nonatomic, copy, readonly) LQQSegmentBarConfig *(^segmentBGColor)(UIColor *color);


@end
