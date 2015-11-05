//
//  HJGLKCoordinateViewController.m
//  HJGLKViewControllerDemo
//
//  Created by haijiao on 15/11/5.
//  Copyright © 2015年 com.olinone. All rights reserved.
//

#import "HJGLKCoordinateViewController.h"
#import <OpenGLES/ES1/gl.h>

@interface HJGLKCoordinateViewController () {
    GLfloat *vertexBuffer;
}

@end

@implementation HJGLKCoordinateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GLKView *view = self.glkView;
    view.backgroundColor = [UIColor clearColor];
    view.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES1];
    [EAGLContext setCurrentContext:view.context];
    
    vertexBuffer = (GLfloat*)calloc(sizeof(GLfloat) * 2 * 4, 1);
    memset(vertexBuffer, 0, 2 * 4 * sizeof(GLfloat));
    
    vertexBuffer[0] = 0;
    vertexBuffer[1] = 50;
    
    vertexBuffer[2] = 50;
    vertexBuffer[3] = 75;
    
    vertexBuffer[4] = 100;
    vertexBuffer[5] = 50;
    
    vertexBuffer[6] = 50;
    vertexBuffer[7] = 25;
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {
    
    glViewport(0, 0, rect.size.width * 2, rect.size.height * 2);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glOrthof(0, 100, 0, 100, -1024, 1024);
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    
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
