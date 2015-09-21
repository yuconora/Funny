//
//  LineWidth.h
//  PaintByHand
//
//  Created by qianfeng on 15/9/21.
//  Copyright © 2015年 Keep&Y. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface LineWidth : NSObject
@property (nonatomic,assign) CGFloat width;
+ (LineWidth *)shareWidth;
- (CGFloat)setLineWidth;
@end
