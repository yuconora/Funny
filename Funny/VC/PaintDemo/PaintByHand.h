//
//  PaintByHand.h
//  PaintByHand
//
//  Created by qianfeng on 15/9/20.
//  Copyright © 2015年 Keep&Y. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaintLine.h"
@interface PaintByHand : UIView{
    BOOL isCleared;
}
@property (nonatomic) PaintLine *currentLine;
@property (nonatomic) NSMutableArray *completedLines;
@property (nonatomic) UIColor *drawColor;
- (void)undo;
- (void)redo;
@end
