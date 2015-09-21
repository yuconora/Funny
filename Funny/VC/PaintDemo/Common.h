//
//  Common.h
//  PaintByHand
//
//  Created by qianfeng on 15/9/20.
//  Copyright © 2015年 Keep&Y. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Common : NSObject

+ (BOOL)color:(UIColor *)color1
isEqualToColor:(UIColor *)color2
withTolerance:(CGFloat)tolerance;
@end
