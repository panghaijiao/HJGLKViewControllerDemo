//
//  HJGLKViewController.h
//  HJGLKViewControllerDemo
//
//  Created by haijiao on 15/11/5.
//  Copyright © 2015年 com.olinone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GLKit/GLKView.h>

@class CADisplayLink;

@interface HJGLKViewController : UIViewController

@property (nonatomic, readonly) GLKView *glkView;

@property (nonatomic) NSInteger preferredFramesPerSecond;

@property (nonatomic, getter=isPaused) BOOL paused;

@end
