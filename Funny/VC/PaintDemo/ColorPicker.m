//
//  ColorPicker.m
//  PaintByHand
//
//  Created by qianfeng on 15/9/20.
//  Copyright © 2015年 Keep&Y. All rights reserved.
//

#import "ColorPicker.h"
#import <QuartzCore/QuartzCore.h>
@implementation ColorPicker

- (void)drawRect:(CGRect)rect{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 15.0f;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if ([self.delegate respondsToSelector:@selector(aColorPickColorForPaint:)]) {
        [self.delegate aColorPickColorForPaint:self.backgroundColor];
        
    }
    self.layer.borderWidth = 1.5f;
    self.layer.borderColor = [UIColor redColor].CGColor;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
