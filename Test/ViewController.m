//
//  ViewController.m
//  Test
//
//  Created by zhajianjun on 16/11/5.
//  Copyright © 2016年 TTanys. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

#import <AFNetworking/AFNetworking.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import <YYText/YYText.h>
#import <MJRefresh/MJRefresh.h>
#import <MJExtension/MJExtension.h>
#import <SVProgressHUD/SVProgressHUD.h>

@interface ViewController ()

@end

@implementation ViewController
+ (void)load{
    NSLog(@"load");
}
+ (void)initialize{
    NSLog(@"initialize");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor blackColor];
    
    BOOL (^isInputEven)(int) = ^(int input)
    {
        if (input % 2 == 0)
            return YES;
        else
            return NO;
    };
    int x = -101;
    NSLog(@"%d %@ numebr",x,isInputEven(x)?@"is an even":@"is not an even");
    
    MJRefreshNormalHeader *mheader = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
    }];
    [mheader beginRefreshing];
    
    MJRefreshBackNormalFooter *mfooter = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
    }];
    mfooter.automaticallyHidden = YES;
    
    [SVProgressHUD showWithStatus:@"加载中..."];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [SVProgressHUD dismiss];
//    });
}

- (IBAction)btnClicked:(UIButton *)sender {
    
    DetailViewController *detailVc = [[DetailViewController alloc] init];
    detailVc.firstBlk = ^(NSInteger number){
        
        NSLog(@"number=%ld",number);
        
    };
    detailVc.testBlk = ^(NSString *str){
        
        NSString *strValue = [NSString stringWithFormat:@"%@~呵呵",str];
        
        NSLog(@"%@",strValue);
        
        return strValue;
    };
    [self presentViewController:detailVc animated:YES completion:nil];
    
    
    char a[] = "hello world";
    char *p = a;
    NSLog(@"%ld",sizeof(a)); //12
    NSLog(@"%ld",sizeof(p)); //8
    
    printf("你\n好");
    NSLog(@"哈哈\n呵呵");
    NSLog(@"aaa\0bbb"); //aaa (\0是字符串的结束符，默认隐藏，占一个字节长度)
    
    char m[] = "TT\0anys";
    NSLog(@"%s",m); //TT
    NSLog(@"%ld",strlen(m)); //2
    NSLog(@"%ld",sizeof(m)); //8
    
    int x = 100;
    int *y = &x;
    NSLog(@"%ld",sizeof(x)); //4
    NSLog(@"%ld",sizeof(y)); //8
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [SVProgressHUD showWithStatus:@"加载中..."];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
