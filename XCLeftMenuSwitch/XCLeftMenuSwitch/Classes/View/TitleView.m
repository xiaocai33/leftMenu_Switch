//
//  TitleView.m
//  XCLeftMenuSwitch
//
//  Created by 小蔡 on 16/6/5.
//  Copyright © 2016年 xiaocai. All rights reserved.
//

#import "TitleView.h"

@implementation TitleView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setImage:[UIImage imageNamed:@"navbar_netease"] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:22];
        self.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
        self.height = self.currentImage.size.height;
    }
    return self;
}

- (void)setTitle:(NSString *)title{
    _title = [title copy];
    [self setTitle:title forState:UIControlStateNormal];
    
    NSDictionary *attrs = @{NSFontAttributeName : self.titleLabel.font};
    CGFloat titleW = [title boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size.width;
    
    self.width = titleW + self.titleEdgeInsets.left + self.currentImage.size.width;
}

@end
