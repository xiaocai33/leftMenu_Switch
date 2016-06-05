//
//  NavigationController.m
//  XCLeftMenuSwitch
//
//  Created by 小蔡 on 16/6/5.
//  Copyright © 2016年 xiaocai. All rights reserved.
//

#import "NavigationController.h"

@implementation NavigationController

+ (void)initialize{
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBackgroundImage:[UIImage imageNamed:@"top_navigation_background"] forBarMetrics:UIBarMetricsDefault];
}

@end
