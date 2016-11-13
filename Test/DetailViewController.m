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
    
    NextViewController *nextVc = [[NextViewController alloc] init];
    [self presentViewController:nextVc animated:YES completion:nil];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
