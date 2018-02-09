//
//  BBBViewController.m
//  Demo-Mediator
//
//  Created by haoyajuan on 2017/3/29.
//  Copyright © 2017年 HYJ. All rights reserved.
//

#import "BBBViewController.h"

#import "UIViewController+YJRouter.h"

@interface BBBViewController ()

@end

@implementation BBBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor magentaColor];
    NSLog(@"%@",self.params);
}
@end
