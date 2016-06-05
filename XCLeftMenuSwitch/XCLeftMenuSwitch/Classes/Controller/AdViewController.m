//
//  AdViewController.m
//  XCLeftMenuSwitch
//
//  Created by 小蔡 on 16/6/5.
//  Copyright © 2016年 xiaocai. All rights reserved.
//

#import "AdViewController.h"

@implementation AdViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    //添加广告图片
    [self addAdImage];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //根据 stroryboard 的名称得到 stroryboard
        UIStoryboard *stroryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        //根据 stroryboard 对应控制器的 Identifier 取出相应的控制器
        UIViewController *mainVc = [stroryboard instantiateViewControllerWithIdentifier:@"MainVc"];
        [UIApplication sharedApplication].keyWindow.rootViewController = mainVc;
    });
}

- (void)addAdImage{
    UIImageView *adImageView = [[UIImageView alloc] init];
    adImageView.image = [UIImage imageNamed:@"ad"];
    [self.view addSubview:adImageView];
    adImageView.sd_layout.centerXEqualToView(self.view).topSpaceToView(self.view, 50).heightIs(300).widthIs(300);
}

@end
