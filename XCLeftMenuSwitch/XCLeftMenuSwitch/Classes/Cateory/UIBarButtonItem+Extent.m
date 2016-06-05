//
//  UIBarButtonItem+Extent.m
//  01-微博UITabBarViewController的创建
//
//  Created by 小蔡 on 15/12/13.
//  Copyright © 2015年 小蔡. All rights reserved.
//

#import "UIBarButtonItem+Extent.h"

@implementation UIBarButtonItem (Extent)
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    
    btn.size = btn.currentBackgroundImage.size;
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}
@end
