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
@property (weak, nonatomic) IBOutlet UIButton *undoButton;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *paintColourViewWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *paintColourViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *paintColourViewTrailing;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *paintColourViewTop;

@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;
@property (weak, nonatomic) IBOutlet UISlider *alphaSlider;
@property (weak, nonatomic) IBOutlet UISlider *brushWidthSlider;

@property UIColor *currentColour;
@property NSInteger currentBrushSize;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.currentColour = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0];
    self.currentBrushSize = 25;
    self.paintColourView.backgroundColor = self.currentColour;
    self.paintColourView.layer.cornerRadius = self.currentBrushSize/2;
    self.paintColourViewWidth.constant = self.currentBrushSize;
    self.paintColourViewHeight.constant = self.currentBrushSize;
    self.paintColourViewTop.constant = 62.5 - self.currentBrushSize/2;
    self.paintColourViewTrailing.constant = 57.5 - self.currentBrushSize/2;
}

- (IBAction)drawColourSliderChange:(UISlider *)sender {
    self.currentColour = [UIColor colorWithRed:self.redSlider.value/255 green:self.greenSlider.value/255 blue:self.blueSlider.value/255 alpha:self.alphaSlider.value/255];
    self.paintColourView.backgroundColor = self.currentColour;
    }

- (IBAction)brushWidthChanged:(UISlider *)sender {
    self.currentBrushSize = self.brushWidthSlider.value;
    self.paintColourView.layer.cornerRadius = sender.value/2;
    self.paintColourViewWidth.constant = sender.value;
    self.paintColourViewHeight.constant = sender.value;
    self.paintColourViewTop.constant = 62.5 - sender.value/2;
    self.paintColourViewTrailing.constant = 57.5 - sender.value/2;
}


- (IBAction)drawInPaintView:(UIPanGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan) {
        [self.paintView.gestureCollection addObject:[FingerPaintGesture new]];
        self.paintView.gestureCollection[self.paintView.gestureCollection.count-1].brushColour = self.currentColour;
        self.paintView.gestureCollection[self.paintView.gestureCollection.count-1].brushSize = self.currentBrushSize;
    }
    [self.paintView.gestureCollection[self.paintView.gestureCollection.count-1].gestureArray addObject:[NSValue valueWithCGPoint:[sender locationInView:self.paintView]]];
    [self.paintView setNeedsDisplay];
}

- (IBAction)undoButtonPressed:(UIButton *)sender {
    if (self.paintView.gestureCollection.count > 0) {
        [self.paintView.gestureCollection removeObjectAtIndex:self.paintView.gestureCollection.count - 1];
    }
    [self.paintView setNeedsDisplay];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
