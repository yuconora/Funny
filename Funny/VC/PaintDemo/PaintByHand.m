//
//  PaintByHand.m
//  PaintByHand
//
//  Created by qianfeng on 15/9/20.
//  Copyright © 2015年 Keep&Y. All rights reserved.
//

#import "PaintByHand.h"
#import "Common.h"
#import <QuartzCore/QuartzCore.h>
#import "LineWidth.h"
@implementation PaintByHand{
    BOOL _isEraser;

}
@synthesize currentLine;
@synthesize completedLines;
@synthesize drawColor;

- (id)initWithCoder:(NSCoder *)c
{
    self = [super initWithCoder:c];
    if (self) {
        completedLines = [[NSMutableArray alloc] init];
        [self setMultipleTouchEnabled:YES];
        
        drawColor = [UIColor blackColor];
        [self becomeFirstResponder];
    }
    return self;
}

//  It is a method of UIView called every time the screen needs a redisplay or refresh.
- (void)drawRect:(CGRect)rect
{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, [[LineWidth shareWidth] setLineWidth]);
    CGContextSetLineCap(context, kCGLineCapRound);
    for (PaintLine *line in completedLines) {
        [[line color] set];
        CGContextMoveToPoint(context, [line begin].x, [line begin].y);
        CGContextAddLineToPoint(context, [line end].x, [line end].y);
        CGContextStrokePath(context);
    }
}

- (void)undo
{
    if ([self.undoManager canUndo]) {
        [self.undoManager undo];
    }
}

- (void)redo
{
    if ([self.undoManager canRedo]) {
        [self.undoManager redo];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.undoManager beginUndoGrouping];
    for (UITouch *t in touches) {
        // Create a line for the value
        CGPoint loc = [t locationInView:self];
        PaintLine *newLine = [[PaintLine alloc] init];
        [newLine setBegin:loc];
        [newLine setEnd:loc];
        [newLine setColor:drawColor];
        currentLine = newLine;
    }
}

- (void)addLine:(PaintLine*)line
{
    [[self.undoManager prepareWithInvocationTarget:self] removeLine:line];
    [completedLines addObject:line];
    [self setNeedsDisplay];
}

- (void)removeLine:(PaintLine*)line
{
    if ([completedLines containsObject:line]) {
        [[self.undoManager prepareWithInvocationTarget:self] addLine:line];
        [completedLines removeObject:line];
        [self setNeedsDisplay];
    }
}

- (void)removeLineByEndPoint:(CGPoint)point
{
    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        PaintLine *evaluatedLine = (PaintLine *)evaluatedObject;
        //        return (evaluatedLine.end.x == point.x && evaluatedLine.end.y == point.y) ||
        //               (evaluatedLine.end.x == point.x - 1.0f && evaluatedLine.end.y == point.y - 1.0f) ||
        //               (evaluatedLine.end.x == point.x + 1.0f && evaluatedLine.end.y == point.y + 1.0f);
        return (evaluatedLine.end.x <= point.x-1 || evaluatedLine.end.x > point.x+1) &&
        (evaluatedLine.end.y <= point.y-1 || evaluatedLine.end.y > point.y+1);
    }];
    NSArray *result = [completedLines filteredArrayUsingPredicate:predicate];
    if (result && result.count > 0) {
        [completedLines removeObject:result[0]];
    }
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!isCleared) {
        for (UITouch *t in touches) {
            [currentLine setColor:drawColor];
            CGPoint loc = [t locationInView:self];
            [currentLine setEnd:loc];
            
            if (currentLine) {
                if ([Common color:drawColor isEqualToColor:[UIColor clearColor] withTolerance:0.2]) {
                    // eraser
                    // [self removeLineByEndPoint:loc]; //this solution can not work.
                    _isEraser = YES;
                } else {
                    _isEraser = NO;
                    [self addLine:currentLine];
                }
            }
            PaintLine *newLine = [[PaintLine alloc] init];
            [newLine setBegin:loc];
            [newLine setEnd:loc];
            [newLine setColor:drawColor];
            currentLine = newLine;
        }
    }
}

- (void)endTouches:(NSSet *)touches
{
    if (!isCleared) {
        [self setNeedsDisplay];
    } else {
        isCleared = NO;
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self endTouches:touches];
    [self.undoManager endUndoGrouping];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self endTouches:touches];
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)didMoveToWindow
{
    [self becomeFirstResponder];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
