//
//  PaintLine.h
//  PaintByHand
//
//  Created by qianfeng on 15/9/20.
//  Copyright © 2015年 Keep&Y. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@interface PaintLine : NSObject
@property (nonatomic) CGPoint begin;
@property (nonatomic) CGPoint end;
@property (nonatomic,retain) UIColor *color;
@end
