//
//  UIBarButtonItem+XDExtension.m
//  iWater
//
//  Created by Jordon.ma on 16/5/23.
//  Copyright © 2016年 Jordon.ma. All rights reserved.
//

#import "UIBarButtonItem+XDExtension.h"
#import "LHMenuBtn.h"



@implementation UIBarButtonItem (XDExtension)

/**
 *  创建一个item
 *
 *  @param target    点击item后调用哪个对象的方法
 *  @param action    点击item后调用target的哪个方法
 *  @param normalImage     图片
 *  @param highlightedImage 高亮的图片
 *
 *  @return 创建完成的item
 */
+ (UIBarButtonItem *)itemWithTarget:(id)target
                             action:(SEL)action
                        normalImage:(NSString *)normalImage
                   highlightedImage:(NSString *)highlightedImage
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 设置图片
    [btn setBackgroundImage:[UIImage imageNamed:normalImage]
                   forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highlightedImage]
                   forState:UIControlStateHighlighted];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

/**
 *  创建一个item
 *
 *  @param image   图片
 *  @param hilight 高亮图片
 *  @param target  点击item后调用哪个对象的方法
 *  @param action  点击item后调用target的哪个方法
 *
 *  @return 创建完成的item
 */
+ (UIBarButtonItem *)itemWithImage:(NSString *)image
                   higlightedImage:(NSString *)hilight
                            target:(id)target
                            action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 30, 30);
    UIImage *normal  = [UIImage imageNamed:image];
    [btn setBackgroundImage:normal
                   forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:hilight]
                   forState:UIControlStateHighlighted];
    btn.bounds = CGRectMake(0, 0, normal.size.width, normal.size.height);
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}




/**
 *  创建一个item  上下
 *
 *  @param image  图片
 *  @param title  item标题
 *  @param target 点击item后调用哪个对象的方法
 *  @param action 点击item后调用target的哪个方法
 *
 *  @return 创建完成的item
 */
+ (UIBarButtonItem *)itemWithImage:(NSString *)image
                             title:(NSString *)title
                            target:(id)target
                            action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 设置图片
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateHighlighted];
    [btn setTitle:title forState:UIControlStateNormal];
//    btn.backgroundColor = [UIColor yellowColor];
    // 设置尺寸
    CGFloat w = 35;
    CGFloat h = 70;
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 15, 20, 0)];
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0 , 10)];
    
    
    btn.frame = CGRectMake(0, 0, w, h);
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}


+ (UIBarButtonItem *)itemTtWithImage:(NSString *)image
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
//    btn.backgroundColor = [UIColor yellowColor];
    // 设置尺寸
    // 设置尺寸
    CGFloat w = 35;
    CGFloat h = 50;
//    [btn setImageEdgeInsets:UIEdgeInsetsMake(30, 0, 0, 20)];
//    [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0,20, 0)];
    
    
    btn.frame = CGRectMake(0, 0, w, h);
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}





/**
 *  创建一个item
 *
 *  @param image  图片
 *  @param title  item标题
 *  @param target 点击item后调用哪个对象的方法
 *  @param action 点击item后调用target的哪个方法
 *
 *  @return 创建完成的item
 */
+ (UIBarButtonItem *)itemWith_HightImage:(NSString *)image
                             title:(NSString *)title
                            target:(id)target
                            action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:11]];
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 设置图片
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateHighlighted];
    [btn setTitle:title forState:UIControlStateNormal];
    
    // 设置尺寸
    CGFloat w = 35;
    CGFloat h = 60;
    [btn setImageEdgeInsets:UIEdgeInsetsMake(30, 0, 0, 20)];
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0,20, 0)];
    
    
    btn.frame = CGRectMake(0, 0, w, h);
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}



/**
 *  创建一个item
 *
 *  @param imageName  图片名
 *  @param target 点击item后调用哪个对象的方法
 *  @param action 点击item后调用target的哪个方法
 *
 *  @return 创建完成的item
 */
+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName
                            target:(id)target
                            action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 60, 45);
    UIImage *normal  = [UIImage imageNamed:imageName];
    [btn setImage:normal forState:UIControlStateNormal];
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//    btn.backgroundColor = [UIColor yellowColor];
//    [btn setBackgroundImage:normal forState:UIControlStateNormal];
    
//    [btn setBackgroundImage: forState:UIControlStateHighlighted];
//    btn.bounds = CGRectMake(0, 0, normal.size.width, normal.size.height);
    
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}


/**
 *  创建一个item
 *
 *  @param imageName  图片名
 *  @param target 点击item后调用哪个对象的方法
 *  @param action 点击item后调用target的哪个方法
 *
 *  @return 创建完成的item
 */
+ (UIBarButtonItem *)itemWithNorImageName:(NSString *)imageName
                                target:(id)target
                                action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 60, 45);
    UIImage *normal  = [UIImage imageNamed:imageName];
    [btn setImage:normal forState:UIControlStateNormal];
    [btn setImage:normal forState:UIControlStateHighlighted];
    
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    //    btn.backgroundColor = [UIColor yellowColor];
    //    [btn setBackgroundImage:normal forState:UIControlStateNormal];
    
    //    [btn setBackgroundImage: forState:UIControlStateHighlighted];
    //    btn.bounds = CGRectMake(0, 0, normal.size.width, normal.size.height);
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}



+ (UIBarButtonItem *)NewitemWithImageName:(NSString *)imageName
                                target:(id)target
                                action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImageView * iconView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 16, 9, 18)];
    iconView1.image =[UIImage imageNamed:imageName];
    [btn addSubview:iconView1];
    btn.frame = CGRectMake(0, 0, 100, 50);
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

/**
 *  创建右侧BarButtonItem
 *
 *  @param title  标题
 *  @param target 点击item后调用哪个对象的方法
 *  @param action 点击item后调用target的哪个方法
 *
 *  @return 创建完成的item
 */
+ (UIBarButtonItem *)itemWithButtonTitle:(NSString *)title
                                   color:(UIColor *)color
                                  target:(id)target
                                  action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 60, 35);
    [btn setTitle:title forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont boldSystemFontOfSize:15.f]];
    [btn setTitleColor:color forState:UIControlStateNormal];
//    btn.backgroundColor = [UIColor blueColor];
    btn.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}


/**
 *  创建右侧BarButtonItem
 *
 *  @param title  标题
 *  @param target 点击item后调用哪个对象的方法
 *  @param action 点击item后调用target的哪个方法
 *
 *  @return 创建完成的item
 */
+ (UIBarButtonItem *)itemRightWithButtonTitle:(NSString *)title
                                   color:(UIColor *)color
                                  target:(id)target
                                  action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 60, 35);
    [btn setTitle:title forState:UIControlStateNormal];
    [btn.titleLabel setFont:  [UIFont systemFontOfSize:15.f]];
  
    [btn setTitleColor:color forState:UIControlStateNormal];
//        btn.backgroundColor = [UIColor blueColor];
  
//    [btn sizeToFit];
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    
    if (iPhonePlus) {
          btn.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -10);
    }else{
      btn.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -5);
    }
   
   
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}


/**
 *  创建右侧BarButtonItem 长
 *
 *  @param title  标题
 *  @param target 点击item后调用哪个对象的方法
 *  @param action 点击item后调用target的哪个方法
 *
 *  @return 创建完成的item
 */
+ (UIBarButtonItem *)itemRightLWithButtonTitle:(NSString *)title
                                        color:(UIColor *)color
                                       target:(id)target
                                       action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 60, 35);
    [btn setTitle:title forState:UIControlStateNormal];
    [btn.titleLabel setFont:  [UIFont systemFontOfSize:15.f]];
    
    [btn setTitleColor:color forState:UIControlStateNormal];
//    [btn setBackgroundColor:[UIColor blueColor]];
    //    [btn sizeToFit];
    
//    if (LH_IOS11_Later) {
//        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
//    }else{
//        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
//    }
//    if (iPhonePlus) {
//        btn.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 5);
//    }else{
//        btn.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -5);
//    }
    
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}



+ (UIBarButtonItem *)itemLayerButtonTitleWith:(NSString *)title
                                        color:(UIColor *)color
                                       target:(id)target
                                       action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 54, 20);
    [btn setTitle:title forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:12.f]];
    [btn setTitleColor:color forState:UIControlStateNormal];
//    btn.contentEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);
    
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    btn.layer.borderColor = color.CGColor;
    btn.layer.borderWidth = 1.0f;
    btn.layer.cornerRadius = 3;
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}


/**
 *  创建左侧BarButtonItem
 *
 *  @param title  标题
 *  @param target 点击item后调用哪个对象的方法
 *  @param action 点击item后调用target的哪个方法
 *
 *  @return 创建完成的item
 */
+ (UIBarButtonItem *)itemLeftWithButtonTitle:(NSString *)title
                                   color:(UIColor *)color
                                  target:(id)target
                                  action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 70, 35);
    [btn setTitle:title forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont boldSystemFontOfSize:15.f]];
    [btn setTitleColor:color forState:UIControlStateNormal];
    //    btn.backgroundColor = [UIColor blueColor];
//    btn.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}


+ (UIBarButtonItem *)itemWithButtonTitle:(NSString *)title withAlignment:(UIControlContentHorizontalAlignment )alignment
                                   color:(UIColor *)color
                                  target:(id)target
                                  action:(SEL)action
{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 50, 35);
    [btn setTitle:title forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont boldSystemFontOfSize:14.f]];
    [btn setTitleColor:color forState:UIControlStateNormal];
//    btn.backgroundColor = [UIColor blueColor];
    //    btn.contentEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);
        btn.contentHorizontalAlignment =  alignment;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

+ (UIBarButtonItem *)itemWithTitle:(NSString *)title withAlignment:(UIControlContentHorizontalAlignment )alignment
                                   color:(UIColor *)color
                                  target:(id)target
                                  action:(SEL)action
{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 50, 35);
    [btn setTitle:title forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:15.f]];
    [btn setTitleColor:color forState:UIControlStateNormal];
    
//        btn.backgroundColor = [UIColor blueColor];
    //    btn.contentEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);
    btn.contentHorizontalAlignment =  alignment;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}





+ (UIBarButtonItem *)leftItemWithImageSmalName:(NSString *)imageStr andName:(NSString *)titleName
                                    target:(id)target
                                    action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    //    btn.contentMode =  UIViewContentModeScaleAspectFit;
    [btn setImage:[UIImage imageNamed:imageStr] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:imageStr] forState:UIControlStateHighlighted];
    [btn setTitle:titleName forState:UIControlStateNormal];
    
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:16];
    CGFloat btnH = 30;
    CGFloat btnW = 80;
    btn.frame = CGRectMake(0, 0, btnW, btnH);
    
    //    btn.bounds = CGRectMake(0, 0,btnW,btnW);
    [btn.titleLabel sizeToFit];
    //左对齐
          btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0,0);

    
    //    btn.cons
    //    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.size.mas_equalTo(CGSizeMake(btnW, btnW));
    //    }];
    //    btn.backgroundColor  = [UIColor grayColor];
    //    CGFloat lW =  btn.titleLabel.width;
    
    //    [btn setBackgroundImage:[UIImage  imageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];

    
    //    btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -lW  -35);
    //    btn.backgroundColor = [UIColor greenColor];
    //    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}



+ (UIBarButtonItem *)twoImageItemWithLeftImageName:(NSString *)leftImageStr andRightImageName:(NSString *)rightImageName  target:(id)target  action:(SEL)action
{
    UIView *bView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 40)];
//    bView.backgroundColor = [UIColor yellowColor];
    UIButton *leftBtn =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 25, 40)];
    [leftBtn setImage:[UIImage imageNamed:leftImageStr] forState:UIControlStateNormal];
    [leftBtn setImage:[UIImage imageNamed:leftImageStr] forState:UIControlStateHighlighted];
   leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 5);
     [bView addSubview:leftBtn];
    leftBtn.tag = 2000;
    UIButton *rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(30, 0, 25, 40)];
    [rightBtn setImage:[UIImage imageNamed:rightImageName] forState:UIControlStateNormal];
    [rightBtn setImage:[UIImage imageNamed:rightImageName] forState:UIControlStateHighlighted];
    rightBtn.tag  = 2001;
       [bView addSubview:rightBtn];
    rightBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -5);
    
    [rightBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [leftBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
 
    
    return [[UIBarButtonItem alloc]initWithCustomView:bView];
    
}



+ (UIBarButtonItem *)twoImageItemWithLeftImage:(UIImage *)leftImage andRightImage:(UIImage *)ritImage  target:(id)target  action:(SEL)action
{
    UIView *bView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 40)];
    //    bView.backgroundColor = [UIColor yellowColor];
    UIButton *leftBtn =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 25, 40)];
    [leftBtn setImage:leftImage forState:UIControlStateNormal];
    [leftBtn setImage:ritImage forState:UIControlStateHighlighted];
    leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 5);
    [bView addSubview:leftBtn];
    leftBtn.tag = 2000;
    UIButton *rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(30, 0, 25, 40)];
    [rightBtn setImage:leftImage forState:UIControlStateNormal];
    [rightBtn setImage:ritImage forState:UIControlStateHighlighted];
    rightBtn.tag  = 2001;
    [bView addSubview:rightBtn];
    rightBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -5);
    
    [rightBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [leftBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    
    return [[UIBarButtonItem alloc]initWithCustomView:bView];
    
}



@end
