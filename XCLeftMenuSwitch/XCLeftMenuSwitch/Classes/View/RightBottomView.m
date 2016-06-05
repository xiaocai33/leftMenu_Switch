//
//  RightBottomView.m
//  XCLeftMenuSwitch
//
//  Created by 小蔡 on 16/6/5.
//  Copyright © 2016年 xiaocai. All rights reserved.
// 下半部分视图

#import "RightBottomView.h"
#define colNum 3
#define maigin 40.0

@implementation RightBottomView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.autoresizingMask = UIViewAutoresizingNone;
        self.backgroundColor = [UIColor clearColor];
        [self setupButton];
    }
    return self;
}
/**
 *  添加子按钮
 */
- (void)setupButton{
    [self addBtnWithTitle:@"跟帖" imageName:@"pluginboard_icon_comment"];
    [self addBtnWithTitle:@"收藏" imageName:@"pluginboard_icon_favor"];
    [self addBtnWithTitle:@"离线" imageName:@"pluginboard_icon_offline"];
    [self addBtnWithTitle:@"夜间" imageName:@"pluginboard_icon_night"];
    [self addBtnWithTitle:@"天气" imageName:@"pluginboard_icon_weather"];
    [self addBtnWithTitle:@"搜索" imageName:@"pluginboard_icon_search"];
    [self addBtnWithTitle:@"消息" imageName:@"pluginboard_icon_message"];
    [self addBtnWithTitle:@"邮件" imageName:@"pluginboard_icon_mailbox"];
    [self addBtnWithTitle:@"" imageName:@"pluginboard_icon_add"];
}

- (void)addBtnWithTitle:(NSString *)title imageName:(NSString *)image{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.showsTouchWhenHighlighted = YES;
    
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    
    btn.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 5, 0);
    
    [self addSubview:btn];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    NSUInteger count = self.subviews.count;
    
    CGFloat btnW = 55;
    CGFloat btnH = 55;
    int col = 0;
    int row = 0;
    for (int i =0; i<count; i++) {
        UIButton *btn = self.subviews[i];
        col = i % colNum;
        row = i / colNum;
        btn.width = btnW;
        btn.height = btnH;
        btn.x = col * (btnW + maigin);
        btn.y = row * btnH;
    }
}

@end
