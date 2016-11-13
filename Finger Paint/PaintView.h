//
//  PaintView.h
//  Finger Paint
//
//  Created by Stefan Verveniotis on 2016-11-11.
//  Copyright © 2016 Stefan Verveniotis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FingerPaintGesture.h"

@interface PaintView : UIView

@property (nonatomic) NSMutableArray <FingerPaintGesture*> * gestureCollection;

- (void)drawRect:(CGRect)rect;

@end
