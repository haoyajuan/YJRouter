//
//  CCCViewController.m
//  Demo-Mediator
//
//  Created by haoyajuan on 2017/3/29.
//  Copyright © 2017年 HYJ. All rights reserved.
//

#import "CCCViewController.h"
#import "UIViewController+YJRouter.h"
@interface CCCViewController ()

@end

@implementation CCCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    NSLog(@"%@",self.params);
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 200, 300)];
    [self.view addSubview:imageView];
    
    UIImage *image = self.params[@"image"];
    if (image) {
        imageView.image = image;
    }
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 70, 200, 30)];
    [self.view addSubview:label];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = self.params[@"name"];
}


@end
