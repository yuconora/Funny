//
//  PaintLine.m
//  PaintByHand
//
//  Created by qianfeng on 15/9/20.
//  Copyright © 2015年 Keep&Y. All rights reserved.
//

#import "PaintLine.h"

@implementation PaintLine
@synthesize begin,end,color;
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setColor:[UIColor blackColor]];
    }
    return self;
}
@end
