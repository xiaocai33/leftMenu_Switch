//
//  RightUpView.m
//  XCLeftMenuSwitch
//
//  Created by 小蔡 on 16/6/5.
//  Copyright © 2016年 xiaocai. All rights reserved.
//

#import "RightUpView.h"
@interface RightUpView()

@property (nonatomic, weak) UIImageView *imageView;

@end

@implementation RightUpView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupChildView];
    }
    return self;
}

- (void)setupChildView{
    UIImageView *imageView = [[UIImageView alloc] init];
    [self addSubview:imageView];
    self.imageView = imageView;
    imageView.sd_layout.centerXEqualToView(self).topSpaceToView(self, 20).heightIs(70).widthIs(70);

}

- (void)setImage:(UIImage *)image{
    _image = image;
    self.imageView.image = image;
    
}

@end
