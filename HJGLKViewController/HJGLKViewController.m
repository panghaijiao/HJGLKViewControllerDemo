//
//  HJGLKViewController.m
//  HJGLKViewControllerDemo
//
//  Created by haijiao on 15/11/5.
//  Copyright © 2015年 com.olinone. All rights reserved.
//

#import "HJGLKViewController.h"

static const NSInteger HJGLKDefaultFramesPerSecond = 30;

@interface HJGLKViewController () <GLKViewDelegate>

@property (nonatomic, strong) GLKView       *glkView;
@property (nonatomic, strong) CADisplayLink *displayLink;

@end

@implementation HJGLKViewController

- (void)dealloc {
    self.paused = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.glkView = [[GLKView alloc] initWithFrame:self.view.frame];
    self.glkView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.glkView.delegate = self;
    [self.view addSubview:self.glkView];
    
    self.preferredFramesPerSecond = HJGLKDefaultFramesPerSecond;
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(drawView)];
    self.displayLink.frameInterval = MAX(1, 60.0f / _preferredFramesPerSecond);
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

#pragma mark -
- (void)setPreferredFramesPerSecond:(NSInteger)preferredFramesPerSecond {
    _preferredFramesPerSecond = preferredFramesPerSecond;
    self.displayLink.frameInterval = MAX(1, 60.0f / _preferredFramesPerSecond);
}

- (BOOL)isPaused {
    return self.displayLink.paused;
}

- (void)setPaused:(BOOL)paused {
    self.displayLink.paused = paused;
}

- (void)drawView {
    [self update];
    [self.glkView display];
}

- (void)update {
    
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {
    
}

@end
