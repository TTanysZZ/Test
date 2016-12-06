//
//  RTFViewController.m
//  Test
//
//  Created by zhajianjun on 2016/12/5.
//  Copyright © 2016年 TTanys. All rights reserved.
//

#import "RTFViewController.h"
#import "Test-Swift.h"

@interface RTFViewController ()
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIButton *swiftBtn;

@end

@implementation RTFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSDictionary * dic = @{NSFontAttributeName:[UIFont fontWithName:@"Zapfino" size:20],NSForegroundColorAttributeName:[UIColor redColor],NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle)};
    NSMutableAttributedString * attributeStr = [[NSMutableAttributedString alloc] initWithString:@"0我是一个富文本，9听说我有很多属性，19I will try。32这里清除yesorno属性."];
    //设置属性
    [attributeStr setAttributes:dic range:NSMakeRange(0, attributeStr.length)];
    //添加属性
    [attributeStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:30] range:NSMakeRange(9, 10)];
    [attributeStr addAttribute:NSForegroundColorAttributeName value:[UIColor cyanColor] range:NSMakeRange(13, 13)];
    //添加多个属性
    NSDictionary * dicAdd = @{NSBackgroundColorAttributeName:[UIColor yellowColor],NSLigatureAttributeName:@1};
    [attributeStr addAttributes:dicAdd range:NSMakeRange(36, 12)];
    //移除属性
    [attributeStr removeAttribute:NSFontAttributeName range:NSMakeRange(32, 9)];
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 400)];
//    label.backgroundColor = [UIColor orangeColor];
    label.numberOfLines = 0;
    label.attributedText = attributeStr;
    [self.view addSubview:label];
    
}

- (IBAction)backBtnClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}
- (IBAction)swiftBtnClicked:(id)sender {
    SwiftViewController *swiftVc = [[SwiftViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:swiftVc];
    [self presentViewController:nav animated:YES completion:nil];
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
