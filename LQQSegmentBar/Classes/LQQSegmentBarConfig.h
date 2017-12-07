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

@property (nonatomic, strong) UIColor *segmentBarBackgroundColor;
@property (nonatomic, strong) UIColor *itemNormlColor;
@property (nonatomic, strong) UIColor *itemSelectedColor;
@property (nonatomic, strong) UIFont *itemFont;

@property (nonatomic, strong) UIColor *indicatorColor;

@property (nonatomic, assign) CGFloat indicatorHeight;
@property (nonatomic, assign) CGFloat indicatorExtraW;

@property (nonatomic, copy, readonly) LQQSegmentBarConfig *(^itemNC)(UIColor *color );
@property (nonatomic, copy, readonly) LQQSegmentBarConfig *(^itemSC)(UIColor *color);
@property (nonatomic, copy, readonly) LQQSegmentBarConfig *(^indicatorEW)(CGFloat w);

@end
