//
//  LQQSegmentBarConfig.m
//  LQQSegmentBar_Example
//
//  Created by lqq on 2017/12/7.
//  Copyright © 2017年 85174695. All rights reserved.
//

#import "LQQSegmentBarConfig.h"

@interface LQQSegmentBarConfig ()


@end

@implementation LQQSegmentBarConfig
+(instancetype)defaultConfig {
    LQQSegmentBarConfig *config = [[LQQSegmentBarConfig alloc] init];
    config.segmentBarBackgroundColor = [UIColor clearColor];
    config.font = [UIFont systemFontOfSize:15];
    config.itemNormalColor = [UIColor lightGrayColor];
    config.itemSelectedColor = [UIColor redColor];
    
    config.indColor = [UIColor redColor];
    config.indHeight = 2;
    config.indExtraW = 10;
    
    return  config;
}
- (LQQSegmentBarConfig *(^)(UIColor *))itemNC {
    return ^(UIColor *color) {
        self.itemNormalColor = color;
        return self;
    };
}
- (LQQSegmentBarConfig *(^)(UIColor *))itemSC {
    return ^(UIColor *color) {
        self.itemSelectedColor = color;
        return self;
    };
}

- (LQQSegmentBarConfig *(^)(UIFont *))itemFont {
    return ^(UIFont *font) {
        self.font = font;
        return  self;
    };
}
- (LQQSegmentBarConfig *(^)(CGFloat))indicatorEW {
    return ^(CGFloat w) {
        self.indExtraW = w;
        return self;
    };
}
- (LQQSegmentBarConfig *(^)(UIColor *))indicatorColor {
    return ^(UIColor *color) {
        self.indColor = color;
        return self;
    };
}
- (LQQSegmentBarConfig *(^)(CGFloat))indicatorHeight {
    return ^(CGFloat h) {
        self.indHeight = h;
        return self;
    };
}
- (LQQSegmentBarConfig *(^)(UIColor *))segmentBGColor {
    return ^(UIColor *color) {
        self.segmentBarBackgroundColor = color;
        return self;
    };
}

@end
