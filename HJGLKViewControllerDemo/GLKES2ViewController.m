//
//  GLKES2ViewController.m
//  HJGLKViewControllerDemo
//
//  Created by haijiao on 15/11/5.
//  Copyright © 2015年 com.olinone. All rights reserved.
//

#import "GLKES2ViewController.h"

typedef struct {
    GLKVector3 positionCoords;
} SceneVertex;

static const SceneVertex vertices[] = {
    {{-1,    0}},
    {{ 0,  0.5}},
    {{ 1,    0}},
    {{ 0, -0.5}}
};

@interface GLKES2ViewController () <GLKViewDelegate> {
    GLuint vertexBufferID;
}

@property (nonatomic, strong) GLKBaseEffect *baseEffect;

@end

@implementation GLKES2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GLKView *view = (GLKView *)self.view;
    view.backgroundColor = [UIColor clearColor];
    view.context=[[EAGLContext alloc]initWithAPI:kEAGLRenderingAPIOpenGLES2];
    [EAGLContext setCurrentContext:view.context];
    
    self.baseEffect = [[GLKBaseEffect alloc]init];
    self.baseEffect.useConstantColor = GL_TRUE;
    self.baseEffect.constantColor = GLKVector4Make(1.0f, 0.0f, 0.0f, 1.0f);
    
    glGenBuffers(1, &vertexBufferID);
    glBindBuffer(GL_ARRAY_BUFFER, vertexBufferID);
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);
}

#pragma mark -
- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {
    [self.baseEffect prepareToDraw];
    
    glClear(GL_COLOR_BUFFER_BIT);
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(GLKVertexAttribPosition, 2, GL_FLOAT, GL_FALSE, sizeof(SceneVertex), NULL);
    glDrawArrays(GL_TRIANGLE_FAN, 0, 4);
}

@end
