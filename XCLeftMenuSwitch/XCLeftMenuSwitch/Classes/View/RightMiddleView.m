//
//  RightMiddleView.m
//  XCLeftMenuSwitch
//
//  Created by 小蔡 on 16/6/5.
//  Copyright © 2016年 xiaocai. All rights reserved.
//

#import "RightMiddleView.h"

@interface RightMiddleView()

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UIButton *titleBtn;

@end

@implementation RightMiddleView

+ (instancetype)rightMiddleView{
    return [[[NSBundle mainBundle] loadNibNamed:@"RightMiddleView" owner:nil options:nil] lastObject];
}

- (void)setTitle:(NSString *)title{
    _title = [title copy];
    [self.titleBtn setTitle:title forState:UIControlStateNormal];
}

- (void)setIcon:(NSString *)icon{
    _icon = [icon copy];
    self.iconImage.image = [UIImage imageNamed:icon];
}

@end
