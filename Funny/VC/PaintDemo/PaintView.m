//
//  PaintView.m
//  PaintByHand
//
//  Created by qianfeng on 15/9/20.
//  Copyright © 2015年 Keep&Y. All rights reserved.
//

#import "PaintView.h"
#import "LineWidth.h"
@implementation PaintView
-(void)drawRect:(CGRect)rect{
    isCleared = NO;
    isSelectedColor = NO;
    [self setColorDelegate];
}
- (void)setColorDelegate{
    [_red setDelegate:self];
    [_orange setDelegate:self];
    [_yellow setDelegate:self];
    [_green setDelegate:self];
    [_cyan setDelegate:self];
    [_blue setDelegate:self];
    [_purple setDelegate:self];
    [_black setDelegate:self];
}

- (void)aColorPickColorForPaint:(UIColor *)color{
    [self.place setDrawColor:color];
    _red.layer.borderWidth = 0.0f;
    _orange.layer.borderWidth = 0.0f;
    _yellow.layer.borderWidth = 0.0f;
    _green.layer.borderWidth = 0.0f;
    _cyan.layer.borderWidth = 0.0f;
    _blue.layer.borderWidth = 0.0f;
    _purple.layer.borderWidth = 0.0f;
    _black.layer.borderWidth = 0.0f;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
     Drawing code
}
*/

- (IBAction)changeOne:(id)sender {
    [LineWidth shareWidth].width = 5.0f;
    [self.place setNeedsDisplay];
}

- (IBAction)changeTwo:(id)sender {
    [LineWidth shareWidth].width = 10.0f;
    [self.place setNeedsDisplay];
}

- (IBAction)changeThree:(id)sender {
    [LineWidth shareWidth].width = 15.0f;
    [self.place setNeedsDisplay];
}

- (IBAction)up:(id)sender {
    [self.place undo];
}

- (IBAction)down:(id)sender {
    [self.place redo];
}
@end
