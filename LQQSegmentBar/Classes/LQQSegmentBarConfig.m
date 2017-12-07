//
//  LQQSegmentBarConfig.m
//  LQQSegmentBar_Example
//
//  Created by lqq on 2017/12/7.
//  Copyright © 2017年 85174695. All rights reserved.
//

#import "LQQSegmentBarConfig.h"

@implementation LQQSegmentBarConfig
+(instancetype)defaultConfig {
    LQQSegmentBarConfig *config = [[LQQSegmentBarConfig alloc] init];
    config.segmentBarBackgroundColor = [UIColor clearColor];
    config.itemFont = [UIFont systemFontOfSize:15];
    config.itemNormlColor = [UIColor lightGrayColor];
    config.itemSelectedColor = [UIColor redColor];
    
    config.indicatorColor = [UIColor redColor];
    config.indicatorHeight = 2;
    config.indicatorExtraW = 10;
    
    return  config;
}
- (LQQSegmentBarConfig *(^)(UIColor *))itemNC {
    return ^(UIColor *color) {
        self.itemNormlColor = color;
        return self;
    };
}
- (LQQSegmentBarConfig *(^)(UIColor *))itemSC {
    return ^(UIColor *color) {
        self.itemSelectedColor = color;
        return self;
    };
}
- (LQQSegmentBarConfig *(^)(CGFloat))indicatorEW {
    return ^(CGFloat w) {
        self.indicatorExtraW = w;
        return self;
    };
}
@end
