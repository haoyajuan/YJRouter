//
//  ViewController.m
//  Demo-Mediator
//
//  Created by haoyajuan on 2017/3/27.
//  Copyright © 2017年 HYJ. All rights reserved.
//

#import "ViewController.h"

#import "JuanRouter.h"
#import "URLNavigation.h"

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
    NSString * url = @"APPTicket://AAAViewController?name=哈哈&productId=123456";
    UIViewController *vc = [JuanRouter openControllerWithURL:url];
//    [self.navigationController pushViewController:vc animated:YES];
//        [self presentViewController:vc animated:YES completion:nil];
    [URLNavigation pushViewController:vc animated:YES];
}
- (IBAction)buttonBClick:(id)sender {
	NSString * url = @"APPTicket://BBBViewController";
    UIViewController *vc = [JuanRouter openControllerWithURL:url];
//    [self.navigationController pushViewController:vc animated:YES];
    [URLNavigation pushViewController:vc animated:YES];
}
- (IBAction)buttonCClick:(id)sender {
    NSString * url = @"APPTicket://CCCViewController?name=哈哈&productId=123456";
//    UIViewController *vc = [YJRouter openControllerWithURL:url];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    UIImage *image = [UIImage imageNamed:@"testImag"];
//    NSData *data = [NSData ]
    
    [dict setValue:image forKey:@"image"];
    UIViewController *vc = [YJRouter openControllerWithURL:url extraParams:dict];
    [self.navigationController pushViewController:vc animated:YES];
//    [self presentViewController:vc animated:YES completion:nil];
//    [URLNavigation pushViewController:vc animated:YES];

}

@end
