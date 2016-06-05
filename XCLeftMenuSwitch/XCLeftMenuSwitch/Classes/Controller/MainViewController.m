//
//  MainViewController.m
//  XCLeftMenuSwitch
//
//  Created by 小蔡 on 16/6/5.
//  Copyright © 2016年 xiaocai. All rights reserved.
//

#import "MainViewController.h"
#import "LeftMenuView.h"
#import "TitleView.h"
#import "NavigationController.h"
#import "RightViewController.h"

/** 左菜单的宽高 */
#define LeftMenuWidth 170
#define LeftMenuHeight 300
#define LeftMenuY 50

#define RightMenuWidth 260

#define CoverTag 237
#define NavShowAnimDuration 1.0
@interface MainViewController() <LeftMenuViewDelegate>

/**
 *  正在显示的导航控制器
 */
@property (nonatomic, weak) NavigationController *showingNavigationController;
@property (nonatomic, weak) LeftMenuView *leftMenuView;
@property (nonatomic, strong) RightViewController *rightVc;

@end


@implementation MainViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    //添加上面的控制器
    [self addAllChildVc];
    
    //添加左菜单
    [self addLeftMenu];
    
    //添加右菜单
    [self addRightMenu];
    
}
/**
 *  添加子控制器
 */
- (void)addAllChildVc{
    // 1.新闻控制器
    UITableViewController *news = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
    [self setupVc:news title:@"新闻"];
    
    // 2.订阅控制器
    UITableViewController *reading = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
    [self setupVc:reading title:@"订阅"];
    
    // 3.图片控制器
    UIViewController *photo = [[UIViewController alloc] init];
    [self setupVc:photo title:@"图片"];
    
    // 4.视频控制器
    UIViewController *video = [[UIViewController alloc] init];
    [self setupVc:video title:@"视频"];
    
    // 5.跟帖控制器
    UIViewController *comment = [[UIViewController alloc] init];
    [self setupVc:comment title:@"跟帖"];
    
    // 6.电台控制器
    UIViewController *radio = [[UIViewController alloc] init];
    [self setupVc:radio title:@"电台"];
}

/**
 *  初始化一个控制器
 *
 *  @param vc      需要初始化的控制器
 *  @param title   控制器的标题
 */
- (void)setupVc:(UIViewController *)vc title:(NSString *)title{
    vc.view.backgroundColor = XCRadomColor;
    
    //设置标题
    TitleView *titleView = [[TitleView alloc] init];
    titleView.title = title;
    vc.navigationItem.titleView = titleView;
    
    //设置左右按钮
    vc.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(leftMenuBtnClick) image:@"top_navigation_menuicon"];
    vc.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(rightMenuBtnClick) image:@"top_navigation_infoicon"];
    
    // 包装一个导航控制器
    NavigationController *nav = [[NavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
    
}


/**
 *  添加左菜单
 */
- (void)addLeftMenu{
    LeftMenuView *leftMenu = [[LeftMenuView alloc] init];
    leftMenu.delegate = self;
    [self.view insertSubview:leftMenu atIndex:1];
    leftMenu.sd_layout.leftEqualToView(self.view).topSpaceToView(self.view, LeftMenuY).heightIs(LeftMenuHeight).widthIs(LeftMenuWidth);
    self.leftMenuView = leftMenu;
}

/**
 *  添加右菜单
 */
- (void)addRightMenu{
    RightViewController *rightMenuVc = [[RightViewController alloc] init];
    [self.view insertSubview:rightMenuVc.view atIndex:1];
    rightMenuVc.view.sd_layout.rightEqualToView(self.view).topEqualToView(self.view).bottomEqualToView(self.view).widthIs(RightMenuWidth);
    self.rightVc = rightMenuVc;
}

/**
 *  左菜单按钮点击:实现显示控制器的缩放
 */
- (void)leftMenuBtnClick{
    self.leftMenuView.hidden = NO;
    self.rightVc.view.hidden = YES;
    //NSLog(@"leftMenuBtnClick");
    [UIView animateWithDuration:NavShowAnimDuration animations:^{
        // 取出正在显示的导航控制器的view
        UIView *showingView = self.showingNavigationController.view;
        
        //计算缩放比例
        CGFloat navH = [UIScreen mainScreen].bounds.size.height - LeftMenuY * 2;
        CGFloat scale = navH / [UIScreen mainScreen].bounds.size.height;
        
        //计算左边菜单的距离
        CGFloat leftMenuMargin = [UIScreen mainScreen].bounds.size.width * (1 - scale) * 0.5;
        CGFloat translateX = LeftMenuWidth - leftMenuMargin;
        
        CGFloat topMargin = [UIScreen mainScreen].bounds.size.height * (1 - scale) * 0.5;
        CGFloat translateY = LeftMenuY - topMargin;
        
        //缩放
        CGAffineTransform scaleForm = CGAffineTransformMakeScale(scale, scale);
        
        // 平移
        CGAffineTransform translateForm = CGAffineTransformTranslate(scaleForm, translateX / scale, translateY / scale);
        
        showingView.transform = translateForm;
        
        //添加遮盖
        // 添加一个遮盖
        UIButton *cover = [[UIButton alloc] init];
        cover.tag = CoverTag;
        [cover addTarget:self action:@selector(coverClick:) forControlEvents:UIControlEventTouchUpInside];
        cover.frame = showingView.bounds;
        [showingView addSubview:cover];
    }];
}

/**
 *  右菜单按钮点击
 */
- (void)rightMenuBtnClick{
    self.leftMenuView.hidden = YES;
    self.rightVc.view.hidden = NO;
    [UIView animateWithDuration:NavShowAnimDuration animations:^{
        // 取出正在显示的导航控制器的view
        UIView *showingView = self.showingNavigationController.view;
        
        //计算缩放比例
        CGFloat navH = [UIScreen mainScreen].bounds.size.height - LeftMenuY * 2;
        CGFloat scale = navH / [UIScreen mainScreen].bounds.size.height;
        
        //计算左边菜单的距离
        CGFloat leftMenuMargin = [UIScreen mainScreen].bounds.size.width * (1 - scale) * 0.5;
        CGFloat translateX = leftMenuMargin - RightMenuWidth;
        
        CGFloat topMargin = [UIScreen mainScreen].bounds.size.height * (1 - scale) * 0.5;
        CGFloat translateY = LeftMenuY - topMargin;
        
        //缩放
        CGAffineTransform scaleForm = CGAffineTransformMakeScale(scale, scale);
        
        // 平移
        CGAffineTransform translateForm = CGAffineTransformTranslate(scaleForm, translateX / scale, translateY / scale);
        
        showingView.transform = translateForm;
        
        //添加遮盖
        // 添加一个遮盖
        UIButton *cover = [[UIButton alloc] init];
        cover.tag = CoverTag;
        [cover addTarget:self action:@selector(coverClick:) forControlEvents:UIControlEventTouchUpInside];
        cover.frame = showingView.bounds;
        [showingView addSubview:cover];
    } completion:^(BOOL finished) {
        [self.rightVc didShow];
    }];

}

- (void)coverClick:(UIView *)cover{
    [UIView animateWithDuration:NavShowAnimDuration animations:^{
        self.showingNavigationController.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [cover removeFromSuperview];
    }];

}

#pragma mark - LeftMenuViewDelegate
- (void)leftMenu:(LeftMenuView *)menu didSelectedButtonFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex{
    // 0.移除旧控制器的view
    NavigationController *oldNav = self.childViewControllers[fromIndex];
    [oldNav.view removeFromSuperview];
    
    // 1.添加新的控制器View
    NavigationController *newNav = self.childViewControllers[toIndex];
    [self.view addSubview:newNav.view];
    
    // 2.设置新控制的transform跟旧控制器一样
    newNav.view.transform = oldNav.view.transform;
    
    // 设置阴影
    newNav.view.layer.shadowColor = [UIColor blackColor].CGColor;
    newNav.view.layer.shadowOffset = CGSizeMake(-3, 0);
    newNav.view.layer.shadowOpacity = 0.2;
    
    // 一个导航控制器的view第一次显示到它的父控件上时，如果transform的缩放值被改了，上面的20高度当时是不会出来
    
    // 2.设置当前正在显示的控制器
    self.showingNavigationController = newNav;
    
    // 3.单击遮盖
    [self coverClick:[newNav.view viewWithTag:CoverTag]];
}

/**
 *  设置控制器的StatusBarStyle
 */
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}



@end
