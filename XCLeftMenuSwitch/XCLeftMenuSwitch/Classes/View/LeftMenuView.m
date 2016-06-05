//
//  LeftMenuView.m
//  XCLeftMenuSwitch
//
//  Created by 小蔡 on 16/6/5.
//  Copyright © 2016年 xiaocai. All rights reserved.
//

#import "LeftMenuView.h"
#import "LeftMenuButton.h"
@interface LeftMenuView()

@property (nonatomic, strong) LeftMenuButton *selectBtn;

@end


@implementation LeftMenuView

/**
 *  代码中加载
 */
- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
        
        CGFloat alpha = 0.2;
        
        [self addBtn:@"新闻" image:@"sidebar_nav_news" color:XCBg_color(202, 68, 73, alpha)];
        
        [self addBtn:@"订阅" image:@"sidebar_nav_reading" color:XCBg_color(190, 111, 69, alpha)];
        [self addBtn:@"图片" image:@"sidebar_nav_photo" color:XCBg_color(76, 132, 190, alpha)];
        [self addBtn:@"视频" image:@"sidebar_nav_video" color:XCBg_color(101, 170, 78, alpha)];
        [self addBtn:@"跟帖" image:@"sidebar_nav_comment" color:XCBg_color(170, 172, 73, alpha)];
        [self addBtn:@"电台" image:@"sidebar_nav_radio" color:XCBg_color(190, 62, 119, alpha)];
    }
    return self;
}
/**
 *  代理出来的时候,默认选中按钮
 */
- (void)setDelegate:(id<LeftMenuViewDelegate>)delegate{
    _delegate = delegate;
    
    // 默认选中新闻按钮
    [self btnClick:[self.subviews firstObject]];
}

/**
 *  添加按钮
 */
- (LeftMenuButton *)addBtn:(NSString *)title image:(NSString *)icon color:(UIColor *)bgColor{
    LeftMenuButton *btn = [LeftMenuButton buttonWithType:UIButtonTypeCustom];
    
    btn.tag = self.subviews.count;
    
    //设置图片
    [btn setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageWithColor:bgColor] forState:UIControlStateSelected];
    
    //设置标题
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:17];
    
    //高亮时,图片不变色
    btn.adjustsImageWhenHighlighted = NO;
    
    //设置按钮左对齐
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    //设置按钮内边距
    btn.contentEdgeInsets = UIEdgeInsetsMake(0, 30, 0, 0);
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    
    [self addSubview:btn];
    return btn;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    NSUInteger count = self.subviews.count;
    CGFloat btnW = self.width;
    CGFloat btnH = self.height / count;
    
    for (int i =0; i < count; i++) {
        LeftMenuButton *btn = self.subviews[i];
        btn.width = btnW;
        btn.height = btnH;
        btn.x = 0;
        btn.y = i * btnH;
    }
}

- (void)btnClick:(LeftMenuButton *)btn{
    
    if ([self.delegate respondsToSelector:@selector(leftMenu:didSelectedButtonFromIndex:toIndex:)]) {
        [self.delegate leftMenu:self didSelectedButtonFromIndex:self.selectBtn.tag toIndex:btn.tag];
    }
    self.selectBtn.selected = NO;
    btn.selected = YES;
    self.selectBtn = btn;
}

@end
