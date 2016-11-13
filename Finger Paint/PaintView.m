//
//  PaintView.m
//  Finger Paint
//
//  Created by Stefan Verveniotis on 2016-11-11.
//  Copyright © 2016 Stefan Verveniotis. All rights reserved.
//

#import "PaintView.h"

@implementation PaintView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _gestureCollection = [NSMutableArray new];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    for (FingerPaintGesture *fPG in self.gestureCollection) {
        CGContextSetStrokeColorWithColor(ctx, fPG.brushColour.CGColor);
        CGContextSetLineWidth(ctx, fPG.brushSize);
        CGContextMoveToPoint(ctx, [fPG.gestureArray[0] CGPointValue].x, [fPG.gestureArray[0] CGPointValue].y);
        for (NSValue *point in fPG.gestureArray) {
            CGPoint cGpoint = point.CGPointValue;
            CGContextAddLineToPoint(ctx, cGpoint.x, cGpoint.y);
        }
    CGContextStrokePath(ctx);
    }
}

@end
