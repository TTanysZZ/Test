//
//  DetailViewController.h
//  Test
//
//  Created by zhajianjun on 16/11/6.
//  Copyright © 2016年 TTanys. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^FirstBlock)(NSInteger number);
typedef NSString *(^TestBlock)(NSString *str);

@interface DetailViewController : UIViewController

@property (nonatomic, copy)FirstBlock firstBlk;
@property (nonatomic, copy)TestBlock testBlk;

@end
