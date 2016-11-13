//
//  ViewController.m
//  Finger Paint
//
//  Created by Stefan Verveniotis on 2016-11-11.
//  Copyright © 2016 Stefan Verveniotis. All rights reserved.
//

#import "ViewController.h"
#import "PaintView.h"
#import "FingerPaintGesture.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet PaintView *paintView;
@property (weak, nonatomic) IBOutlet UIView *paintColourView;
@property (weak, nonatomic) IBOutlet UIView *paintBrushWidthView;

@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;
@property (weak, nonatomic) IBOutlet UISlider *alphaSlider;
@property (weak, nonatomic) IBOutlet UISlider *brushWidthSlider;
@property (nonatomic) int arrayCounter;

@property UIColor *currentColour;
@property NSInteger currentBrushSize;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrayCounter = -1;
    self.currentColour = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0];
    self.currentBrushSize = 10.5;
    
    
}

- (IBAction)drawColourSliderChange:(UISlider *)sender {
    self.currentColour = [UIColor colorWithRed:self.redSlider.value/255 green:self.greenSlider.value/255 blue:self.blueSlider.value/255 alpha:self.alphaSlider.value/255];
    self.paintColourView.backgroundColor = self.currentColour;
    self.currentBrushSize = self.brushWidthSlider.value;
}

- (IBAction)drawInPaintView:(UIPanGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan) {
        self.arrayCounter++;
        [self.paintView.gestureCollection addObject:[FingerPaintGesture new]];
        self.paintView.gestureCollection[self.arrayCounter].brushColour = self.currentColour;
        self.paintView.gestureCollection[self.arrayCounter].brushSize = self.currentBrushSize;
    }
    [self.paintView.gestureCollection[self.arrayCounter].gestureArray addObject:[NSValue valueWithCGPoint:[sender locationInView:self.paintView]]];
//    if (sender.state == UIGestureRecognizerStateEnded) { }
    [self.paintView setNeedsDisplay];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
