//
//  ViewController.m
//  Demo-Mediator
//
//  Created by haoyajuan on 2017/3/27.
//  Copyright © 2017年 HYJ. All rights reserved.
//

#import "ViewController.h"

#import "YJRouter.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *buttonA;
@property (weak, nonatomic) IBOutlet UIButton *buttonB;
@property (weak, nonatomic) IBOutlet UIButton *buttonC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

}

- (IBAction)buttonAClick:(id)sender {
    NSString * url = @"HYJAPP://AAAViewController?name=哈哈&age=123456";
    UIViewController *vc = [YJRouter openControllerWithURL:url];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)buttonBClick:(id)sender {
	NSString * url = @"HYJAPP://BBBViewController";
    UIViewController *vc = [YJRouter openControllerWithURL:url];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)buttonCClick:(id)sender {
    NSString * url = @"HYJAPP://CCCViewController?name=哈哈&productId=123456";
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    UIImage *image = [UIImage imageNamed:@"testImag"];
    [dict setValue:image forKey:@"image"];
    UIViewController *vc = [YJRouter openControllerWithURL:url extraParams:dict];
    [self.navigationController pushViewController:vc animated:YES];

}

@end
