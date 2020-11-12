//
//  LHMenuView.m
//  LiuHeCai
//
//  Created by me on 2019/1/26.
//  Copyright © 2019年 Beast. All rights reserved.
//

#import "LHMenuBtn.h"

#define CZImageRidio 0.5

@interface LHMenuBtn ()



@end


@implementation  LHMenuBtn

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //
        // 设置字体颜色
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [self setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        
        // 图片居中
        self.imageView.contentMode = UIViewContentModeCenter;
        // 文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        // 设置文字字体
//        self.titleLabel.font = [UIFont systemFontOfSize:12];
        
//        self.titleLabel.backgroundColor = [UIColor redColor];
        
    }
    return self;
}



- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 1.imageView
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageW = self.bounds.size.width ;
    CGFloat imageH = self.bounds.size.height * CZImageRidio;
    self.imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    
    
    // 2.title
    CGFloat titleX = 0;
    CGFloat titleY = imageH - 3;
    CGFloat titleW = self.bounds.size.width;
    CGFloat titleH = self.bounds.size.height - titleY;
    self.titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
 
    
}


+ (LHMenuBtn *)btnTtWithImage:(NSString *)image
                                   title:(NSString *)title
                                  target:(id)target
                                  action:(SEL)action
{
    LHMenuBtn *btn = [[LHMenuBtn alloc]init];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:10]];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 设置图片
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateHighlighted];
    [btn setTitle:title forState:UIControlStateNormal];
    
    
    return btn;
    
}


@end
