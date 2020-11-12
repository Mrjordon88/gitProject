//
//  LHMenuBtn.h
//  LiuHeCai
//
//  Created by me on 2019/1/26.
//  Copyright © 2019年 Beast. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface LHMenuBtn : UIButton


+ (LHMenuBtn *)btnTtWithImage:(NSString *)image
                        title:(NSString *)title
                       target:(id)target
                       action:(SEL)action;

@end
