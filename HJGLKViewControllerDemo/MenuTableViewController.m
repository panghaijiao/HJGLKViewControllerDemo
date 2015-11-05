//
//  MenuTableViewController.m
//  HJGLKViewControllerDemo
//
//  Created by haijiao on 15/11/5.
//  Copyright © 2015年 com.olinone. All rights reserved.
//

#import "MenuTableViewController.h"
#import "GLKDemoViewController.h"
#import "GLKES2ViewController.h"

#import "HJGLKDemoViewController.h"
#import "HJGLKCoordinateViewController.h"
#import "HJGLKAnimViewController.h"

@implementation MenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"olinone";
    self.tableView.rowHeight = 80.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIViewController *vc = nil;
    switch (indexPath.row) {
        case 0:
            vc = [GLKDemoViewController new];
            break;
        case 1:
            vc = [GLKES2ViewController new];
            break;
        case 2:
            vc = [HJGLKDemoViewController new];
            break;
        case 3:
            vc = [HJGLKCoordinateViewController new];
            break;
        case 4:
            vc = [HJGLKAnimViewController new];
            break;
    }
    
    [self.navigationController pushViewController:vc animated:YES];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    vc.title = cell.textLabel.text;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"GLKOpenGLES1";
            break;
        case 1:
            cell.textLabel.text = @"GLKOpenGLES2";
            break;
        case 2:
            cell.textLabel.text = @"HJGLKOpenGLES1";
            break;
        case 3:
            cell.textLabel.text = @"HJGLKCoordinate";
            break;
        case 4:
            cell.textLabel.text = @"HJGLKOpenGLAnim";
            break;
    }
    return cell;
}

@end
