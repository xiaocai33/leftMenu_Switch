//
//  MainViewController.m
//  XCLeftMenuSwitch
//
//  Created by 小蔡 on 16/6/5.
//  Copyright © 2016年 xiaocai. All rights reserved.
//

#import "MainViewController.h"
#import "LeftMenuView.h"

/** 左菜单的宽高 */
#define LeftMenuWidth 130
#define LeftMenuHeight 300

@implementation MainViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    //添加上面的控制器
    
    //添加左菜单
    [self addLeftMenu];
    //添加右菜单
}
/**
 *  添加左菜单
 */
- (void)addLeftMenu{
    LeftMenuView *leftMenu = [[LeftMenuView alloc] init];
    [self.view addSubview:leftMenu];
    leftMenu.sd_layout.leftEqualToView(self.view).centerYEqualToView(self.view).heightIs(LeftMenuHeight).widthIs(LeftMenuWidth);
}

/**
 *  设置控制器的StatusBarStyle
 */
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

@end
