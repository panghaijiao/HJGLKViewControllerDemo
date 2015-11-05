//
//  GLKDemoViewController.m
//  HJGLKViewControllerDemo
//
//  Created by haijiao on 15/11/5.
//  Copyright © 2015年 com.olinone. All rights reserved.
//

#import "GLKDemoViewController.h"
#import <OpenGLES/ES1/gl.h>

@interface GLKDemoViewController () <GLKViewDelegate> {
    GLfloat *vertexBuffer;
}

@end

@implementation GLKDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GLKView *view = (GLKView *)self.view;
    view.backgroundColor = [UIColor clearColor];
    view.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES1];
    view.delegate = self;
    [EAGLContext setCurrentContext:view.context];
    
    vertexBuffer = (GLfloat*)calloc(sizeof(GLfloat) * 2 * 4, 1);
    memset(vertexBuffer, 0, 2 * 4 * sizeof(GLfloat));
    
    vertexBuffer[0] = -1;
    vertexBuffer[1] = 0;
    
    vertexBuffer[2] = 0;
    vertexBuffer[3] = 0.5;
    
    vertexBuffer[4] = 1;
    vertexBuffer[5] = 0;
    
    vertexBuffer[6] = 0;
    vertexBuffer[7] = -0.5;
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {
    glEnable(GL_BLEND);
    glDisable(GL_DEPTH_TEST);
    glBlendFunc(GL_SRC_ALPHA, GL_SRC_COLOR);
    
    glEnableClientState(GL_VERTEX_ARRAY);
    glClear(GL_COLOR_BUFFER_BIT);
    glColor4f(1, 0, 0, 1);
    
    glVertexPointer(2, GL_FLOAT, 0, vertexBuffer);
    glDrawArrays(GL_TRIANGLE_FAN, 0, 4);
}

@end
