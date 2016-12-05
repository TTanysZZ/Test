//
//  RTFViewController.m
//  Test
//
//  Created by zhajianjun on 2016/12/5.
//  Copyright © 2016年 TTanys. All rights reserved.
//

#import "RTFViewController.h"

@interface RTFViewController ()
@property (weak, nonatomic) IBOutlet UIButton *backBtn;

@end

@implementation RTFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)backBtnClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
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
