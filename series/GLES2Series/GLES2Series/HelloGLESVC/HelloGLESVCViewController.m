//
//  HelloGLESVCViewController.m
//  GLES2Series
//
//  Created by hourunjing on 15/12/27.
//  Copyright © 2015年 hourunjing. All rights reserved.
//

#import "HelloGLESVCViewController.h"

//画一个正方形，两个三角形拼。需要顶点、颜色；三角形位置
typedef struct {
  CGFloat Position[3];
  CGFloat Color[4];
} Vertex;

const Vertex verteis[] = {
  {{-1, 1,0},{1,0,0,1}},
  {{ 1, 1,0},{0,1,0,1}},
  {{ 1,-1,0},{0,0,1,1}},
  {{-1,-1,0},{0,0,0,1}}
};

const GLuint Indices[] = {
  0,1,2,
  0,2,3
};

typedef NS_ENUM(NSUInteger, kCycleThreeColor) {
  kCycleThreeColorRed    = 0,
  kCycleThreeColorGreen  = 1,
  kCycleThreeColorBlue   = 2
};

@interface HelloGLESVCViewController ()

@property (nonatomic        ) NSInteger     cycleThreeNumber;
@property (strong, nonatomic) EAGLContext   * context;
@property (strong, nonatomic) GLKBaseEffect *effect;

@end

@implementation HelloGLESVCViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  _cycleThreeNumber = 0;
  
  [self setupGLEnv];
  
}

#pragma mark - GLKViewDelegate

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
  CGFloat redFloat   = (_cycleThreeNumber/30 == kCycleThreeColorRed  )?1.0:0.0;
  CGFloat greenFloat = (_cycleThreeNumber/30 == kCycleThreeColorGreen)?1.0:0.0;
  CGFloat blueFloat  = (_cycleThreeNumber/30 == kCycleThreeColorBlue )?1.0:0.0;
  glClearColor(redFloat, greenFloat, blueFloat, 1.0);
  glClear(GL_COLOR_BUFFER_BIT);
}

#pragma mark - action

- (void)update
{
  _cycleThreeNumber += 1;
  _cycleThreeNumber %= 90;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
  self.paused = !self.paused;
  NSLog(@"timeSinceLastUpdate: %f", self.timeSinceLastUpdate);
  NSLog(@"timeSinceLastDraw: %f", self.timeSinceLastDraw);
  NSLog(@"timeSinceFirstResume: %f", self.timeSinceFirstResume);
  NSLog(@"timeSinceLastResume: %f", self.timeSinceLastResume);
}

#pragma mark - set up

- (void)dealloc
{
  if ([EAGLContext currentContext] == self.context) {
    [EAGLContext setCurrentContext:nil];
  }
  self.context = nil;
}

- (void)setupGLEnv
{
  self.context  = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
  if (!self.context) {
    NSLog(@"fail to create context");
    return;
  }
  ((GLKView *)self.view).context  = self.context;
  ((GLKView *)self.view).delegate = self;
  self.preferredFramesPerSecond = 60;
  
  
}

@end
