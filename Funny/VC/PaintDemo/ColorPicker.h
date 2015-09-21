//
//  ColorPicker.h
//  PaintByHand
//
//  Created by qianfeng on 15/9/20.
//  Copyright © 2015年 Keep&Y. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ColorPickerDelegate <NSObject>
- (void)aColorPickColorForPaint:(UIColor *)color;
@end
@interface ColorPicker : UIView
@property (nonatomic,strong) id <ColorPickerDelegate> delegate;
@end
