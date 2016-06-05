//
//  UIBarButtonItem+Extent.h
//  01-微博UITabBarViewController的创建
//
//  Created by 小蔡 on 15/12/13.
//  Copyright © 2015年 小蔡. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extent)
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image;
@end
