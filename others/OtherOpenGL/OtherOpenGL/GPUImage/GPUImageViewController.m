//
//  GPUImageViewController.m
//  OtherOpenGL
//
//  Created by hourunjing on 15/12/24.
//  Copyright © 2015年 hourunjing. All rights reserved.
//
/**
 *  简单了解下GPUImage的滤镜使用（也即 OpenGL ES 2.0 的能力）；无法拍照和录像的原因应该还是在着色器上，继续学习
 */
#import "GPUImageViewController.h"
#import "GPUImage.h"

@interface GPUImageViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *filterImageView;
@property (weak, nonatomic) IBOutlet GPUImageView *cameraImageView;
- (IBAction)bulgeDistortionFilterChanged:(id)sender;

@end

@implementation GPUImageViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  GPUImageStillCamera *videoCamera = [[GPUImageStillCamera alloc] initWithSessionPreset:AVCaptureSessionPreset640x480 cameraPosition:AVCaptureDevicePositionBack];
  videoCamera.outputImageOrientation = UIInterfaceOrientationPortrait;
  
  GPUImageFilter *customFilter = [[GPUImageFilter alloc] initWithFragmentShaderFromFile:@"CustomFilter"];
  
  // Add the view somewhere so it's visible
  
  [videoCamera addTarget:customFilter];
  [customFilter addTarget:self.cameraImageView];
  
  [videoCamera startCameraCapture];
  
}

- (IBAction)bulgeDistortionFilterChanged:(id)sender {
  UISwitch *bulgeDistortionFilterSwitch = (UISwitch *)sender;
  if (bulgeDistortionFilterSwitch.on) {
    UIImage *originImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"demo" ofType:@"jpg"]];
    GPUImageBulgeDistortionFilter *filter = [[GPUImageBulgeDistortionFilter alloc] init];
    filter.scale = 0.75;
    filter.center = CGPointMake(0.25, .35);
    filter.radius = .9;
    self.filterImageView.image = [filter imageByFilteringImage:originImage];
  } else {
    self.filterImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"demo" ofType:@"jpg"]];
  }
}

@end
