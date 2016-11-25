//
//  DetailViewController.m
//  Test
//
//  Created by zhajianjun on 16/11/6.
//  Copyright © 2016年 TTanys. All rights reserved.
//

#import "DetailViewController.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import "NextViewController.h"
#import <WToast/WToast.h>
#import <FMDB/FMDB.h>

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIButton *nestBtn;

@end

@implementation DetailViewController

+ (void)load{
    NSLog(@"load222");
}
+ (void)initialize{
    NSLog(@"initialize222");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor brownColor];
    
    [SVProgressHUD showWithStatus:@"加载中..."];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
    });
    
    if ([self isKindOfClass:[UIViewController class]]) { //返回“YES”
        NSLog(@"YES");
    } else {
        NSLog(@"NO");
    }
    
    if ([self isMemberOfClass:[UIViewController class]]) { //返回“NO”
        NSLog(@"YES");
    } else {
        NSLog(@"NO");
    }
    
    
//    NSBlockOperation *block = [NSBlockOperation blockOperationWithBlock:^{
//        
//        // 这种方式创建的timer 必须手动添加到Runloop中去才会被调用
//        NSTimer *timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(time) userInfo:nil repeats:YES];
//        
//        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
//        NSLog(@"--%@--",[NSRunLoop currentRunLoop]);
//        // 同时让RunLoop跑起来
//        [[NSRunLoop currentRunLoop] run];
//        
//    }];
//    
//    [[[NSOperationQueue alloc] init] addOperation:block];
//    
//    NSTimer *timer2 = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(run) userInfo:nil repeats:YES];
//    
////    [[NSRunLoop currentRunLoop] run];
//    
//    [[NSRunLoop currentRunLoop] addTimer:timer2 forMode:UITrackingRunLoopMode];
//    NSLog(@"---%@---",[NSRunLoop currentRunLoop]);
}

- (IBAction)backBtnClicked:(id)sender {
    
    NSLog(@"%@",((UIButton *)sender).currentTitle);
    if (self.firstBlk) {
        self.firstBlk(999);
    }
    if (self.testBlk) {
        self.testBlk(((UIButton *)sender).currentTitle);
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)nestBtnClicked:(id)sender {
    
//    NextViewController *nextVc = [[NextViewController alloc] init];
//    [self presentViewController:nextVc animated:YES completion:nil];
    
    [WToast showWithText:@"提示内容"];
}

- (void)time{
    NSLog(@"调用了time");
}
- (void)run{
    NSLog(@"调用了run");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
