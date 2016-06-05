//
//  LeftMenuView.h
//  XCLeftMenuSwitch
//
//  Created by 小蔡 on 16/6/5.
//  Copyright © 2016年 xiaocai. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LeftMenuView;
@protocol LeftMenuViewDelegate <NSObject>

- (void)leftMenu:(LeftMenuView *)menu didSelectedButtonFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex;

@end

@interface LeftMenuView : UIView
@property (nonatomic, weak) id<LeftMenuViewDelegate> delegate;
@end
