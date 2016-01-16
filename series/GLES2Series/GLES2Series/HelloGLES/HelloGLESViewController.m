//
//  HelloGLESViewController.m
//  GLES2Series
//
//  Created by hourunjing on 15/12/26.
//  Copyright © 2015年 hourunjing. All rights reserved.
//

#import "HelloGLESViewController.h"
#import <GLKit/GLKit.h>

typedef NS_ENUM(NSUInteger, kCycleThreeColor) {
  kCycleThreeColorRed    = 0,
  kCycleThreeColorGreen  = 1,
  kCycleThreeColorBlue   = 2
};

@interface HelloGLESViewController ()
<GLKViewDelegate>

@property (weak, nonatomic) IBOutlet GLKView *glkView;
@property (nonatomic) NSInteger cycleThreeNumber;


@end

@implementation HelloGLESViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  _cycleThreeNumber = 0;
  
  [self setupGLEnv];
  
  [self updateLayout];
}

#pragma mark - action

- (void)updateGLColor:(CADisplayLink *)displayLink
{
  _cycleThreeNumber += 1;
  _cycleThreeNumber %= 90;
  [self.glkView display];
}

#pragma mark - GLKViewDelegate

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
  CGFloat redFloat    = (_cycleThreeNumber/30 == kCycleThreeColorRed  )?1.0:0.0;
  CGFloat greenFloat  = (_cycleThreeNumber/30 == kCycleThreeColorGreen)?1.0:0.0;
  CGFloat blueFloat   = (_cycleThreeNumber/30 == kCycleThreeColorBlue )?1.0:0.0;
  glClearColor(redFloat, greenFloat, blueFloat, 1.0);
  glClear(GL_COLOR_BUFFER_BIT);
}

#pragma mark - set up

- (void)setupGLEnv
{
  EAGLContext *context  = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
  self.glkView.context  = context;
  self.glkView.delegate = self;
  self.glkView.enableSetNeedsDisplay = NO;
}

- (void)updateLayout
{
  CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateGLColor:)];
  [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

@end
