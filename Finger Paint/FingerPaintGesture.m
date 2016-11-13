//
//  fingerPaintGesture.m
//  Finger Paint
//
//  Created by Stefan Verveniotis on 2016-11-13.
//  Copyright © 2016 Stefan Verveniotis. All rights reserved.
//

#import "FingerPaintGesture.h"

@implementation FingerPaintGesture

- (instancetype)init
{
    self = [super init];
    if (self) {
        _gestureArray = [NSMutableArray new];
        _brushSize = 10.5;
        _brushColour = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5];
    }
    return self;
}

@end
