//
//  LineWidth.m
//  PaintByHand
//
//  Created by qianfeng on 15/9/21.
//  Copyright © 2015年 Keep&Y. All rights reserved.
//

#import "LineWidth.h"

@implementation LineWidth
+(LineWidth *)shareWidth{
    static LineWidth *_manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //
        if (_manager==nil) {
            _manager = [[LineWidth alloc] init];
        }
    });
    return _manager;
}
- (CGFloat)setLineWidth{
    return self.width?self.width:5.0f;
}
@end
