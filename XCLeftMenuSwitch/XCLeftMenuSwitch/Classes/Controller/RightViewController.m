//
//  RightViewController.m
//  XCLeftMenuSwitch
//
//  Created by 小蔡 on 16/6/5.
//  Copyright © 2016年 xiaocai. All rights reserved.
//

#import "RightViewController.h"
#import "RightUpView.h"
#import "RightMiddleView.h"
#import "RightBottomView.h"

@interface RightViewController()

@property (nonatomic, weak) RightUpView *rightUpView;
@property (nonatomic, weak) UIView *bottomView;

@end

@implementation RightViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    //self.view.backgroundColor = XCRadomColor;
    self.view.backgroundColor = [UIColor clearColor];
    //添加上部分View
    [self setupUpView];
    
    
    
    //添加下半部分View
}


- (void)setupUpView{
    RightUpView *upView = [[RightUpView alloc] init];
    upView.image = [UIImage imageNamed:@"default_avatar"];
    [self.view addSubview:upView];
    upView.sd_layout.centerXEqualToView(self.view).topSpaceToView(self.view, 50).heightIs(90).widthIs(200);
    self.rightUpView = upView;
    
    UILabel *loginLabel = [[UILabel alloc] init];
    loginLabel.text = @"立即登录";
    loginLabel.textAlignment = NSTextAlignmentCenter;
    loginLabel.textColor = [UIColor whiteColor];
    loginLabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:loginLabel];
    loginLabel.sd_layout.leftEqualToView(self.view).rightEqualToView(self.view).topSpaceToView(upView, 5).heightIs(20);
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"赢积分抢大礼!";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:label];
    label.sd_layout.leftEqualToView(self.view).rightEqualToView(self.view).topSpaceToView(loginLabel, 5).heightIs(20);
    
    //添加中间部分View
    RightMiddleView *row1 = [self setupCenterViewRow:@"商城 能赚能花，土豪当家" icon:@"promoboard_icon_mall"];
    row1.sd_layout.leftEqualToView(self.view).rightEqualToView(self.view).topSpaceToView(label, 10).heightIs(44);
    
    RightMiddleView *row2 = [self setupCenterViewRow:@"活动 4.0发布会粉丝招募" icon:@"promoboard_icon_activities"];
    row2.sd_layout.leftEqualToView(self.view).rightEqualToView(self.view).topSpaceToView(row1, 2).heightIs(44);
    
    RightMiddleView *row3 = [self setupCenterViewRow:@"应用 金币从来都是这送的" icon:@"promoboard_icon_apps"];
    row3.sd_layout.leftEqualToView(self.view).rightEqualToView(self.view).topSpaceToView(row2, 2).heightIs(44);
    
    RightBottomView *bottom = [[RightBottomView alloc] init];
    [self.view addSubview:bottom];
    bottom.sd_layout.leftSpaceToView(self.view, 10).rightSpaceToView(self.view, 10).topSpaceToView(row3, 10).heightIs(200);
    
}
/**
 *  填充中间的内容
 */
- (RightMiddleView *)setupCenterViewRow:(NSString *)title icon:(NSString *)icon
{
    RightMiddleView *row = [RightMiddleView rightMiddleView];
    row.icon = icon;
    row.title = title;
    [self.view addSubview:row];
    return row;
}


- (void)didShow{
    //转场动画
    [UIView transitionWithView:self.rightUpView duration:1.0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
        self.rightUpView.image = [UIImage imageNamed:@"user_defaultgift"];
    } completion:^(BOOL finished) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView transitionWithView:self.rightUpView duration:1.0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
                self.rightUpView.image = [UIImage imageNamed:@"default_avatar"];
            } completion:nil];
        });
    }];
    
//    CATransition转场动画
//    CATransition *anim = [CATransition animation];
//    anim.duration = 1.0;
//    anim.type = @"rippleEffect";
//    [self.rightUpView.layer addAnimation:anim forKey:nil];
}

@end
