//
//  PaintView.h
//  PaintByHand
//
//  Created by qianfeng on 15/9/20.
//  Copyright © 2015年 Keep&Y. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaintByHand.h"
#import "ColorPicker.h"
@interface PaintView : UIView<ColorPickerDelegate>{
    BOOL isCleared;
    BOOL isSelectedColor;
}
@property (strong, nonatomic) IBOutlet ColorPicker *red;
@property (strong, nonatomic) IBOutlet ColorPicker *orange;
@property (strong, nonatomic) IBOutlet ColorPicker *yellow;
@property (strong, nonatomic) IBOutlet ColorPicker *green;
@property (strong, nonatomic) IBOutlet ColorPicker *cyan;
@property (strong, nonatomic) IBOutlet ColorPicker *blue;
@property (strong, nonatomic) IBOutlet ColorPicker *purple;
@property (strong, nonatomic) IBOutlet ColorPicker *black;
@property (strong, nonatomic) IBOutlet PaintByHand *place;
- (IBAction)changeOne:(id)sender;
- (IBAction)changeTwo:(id)sender;
- (IBAction)changeThree:(id)sender;


- (IBAction)up:(id)sender;

- (IBAction)down:(id)sender;
@end
