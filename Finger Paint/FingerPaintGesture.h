//
//  fingerPaintGesture.h
//  Finger Paint
//
//  Created by Stefan Verveniotis on 2016-11-13.
//  Copyright © 2016 Stefan Verveniotis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FingerPaintGesture : NSObject

@property NSMutableArray <NSValue *> * gestureArray;
@property NSInteger brushSize;
@property UIColor * brushColour;

@end
