//
//  UIBarButtonItem+XDExtension.h
//  iWater
//
//  Created by Jordon.ma on 16/5/23.
//  Copyright © 2016年 Jordon.ma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (XDExtension)

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
                   highlightedImage:(NSString *)highlightedImage;

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
                           action:(SEL)action;

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
+ (UIBarButtonItem *)itemWithImage:(NSString *)image
                            title:(NSString *)title
                           target:(id)target
                           action:(SEL)action;

/**
 *  创建一个item
 *
 *  @param image  图片
 *  @param target 点击item后调用哪个对象的方法
 *  @param action 点击item后调用target的哪个方法
 *
 *  @return 创建完成的item
 */
+ (UIBarButtonItem *)itemWithImage:(NSString *)image
                           target:(id)target
                           action:(SEL)action;

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
                                  action:(SEL)action;

/**
 *  创建右侧BarButtonItem
 *
 *  @param title  标题
 *  @param target 点击item后调用哪个对象的方法
 *  @param action 点击item后调用target的哪个方法
 *
 *  @return 创建完成的item
 */
+ (UIBarButtonItem *)smallFontItemWithButtonTitle:(NSString *)title
                                           target:(id)target
                                           action:(SEL)action;

/**
 *  创建右侧BarButtonItem
 *
 *  @param title  标题
 *  @param target 点击item后调用哪个对象的方法
 *  @param action 点击item后调用target的哪个方法
 *
 *  @return 创建完成的item
 */
+ (UIBarButtonItem *)webCloseitemWithButtonTitle:(NSString *)title
                                      transformX:(CGFloat)transformX
                                          target:(id)target
                                          action:(SEL)action;


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
                                  action:(SEL)action;



+ (UIBarButtonItem *)itemWithButtonTitle:(NSString *)title withAlignment:(UIControlContentHorizontalAlignment )alignment
                                   color:(UIColor *)color
                                  target:(id)target
                                  action:(SEL)action;


+ (UIBarButtonItem *)itemTtWithImage:(NSString *)image
                               title:(NSString *)title
                              target:(id)target
                              action:(SEL)action;


+ (UIBarButtonItem *)itemWithImageUrlStr:(NSString *)imageUrlStr
                                  target:(id)target
                                  action:(SEL)action;

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
                                action:(SEL)action;


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
                                      action:(SEL)action;



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
                                       action:(SEL)action;



+ (UIBarButtonItem *)NewitemWithImageName:(NSString *)imageName
                                   target:(id)target
                                   action:(SEL)action;

+ (UIBarButtonItem *)rithitemWithImageName:(NSString *)imageStr andName:(NSString *)titleName
                                    target:(id)target
                                    action:(SEL)action;


+ (UIBarButtonItem *)leftItemWithImageName:(NSString *)imageStr andName:(NSString *)titleName
                                    target:(id)target
                                    action:(SEL)action;


+ (UIBarButtonItem *)itemLeftTtWithImage:(NSString *)image
                                   title:(NSString *)title
                                  target:(id)target
                                  action:(SEL)action;


+ (UIBarButtonItem *)itemLayerButtonTitleWith:(NSString *)title
                                                 color:(UIColor *)color
                                                target:(id)target
                                                action:(SEL)action;


+ (UIBarButtonItem *)itemWithNorImageName:(NSString *)imageName
                                   target:(id)target
                                   action:(SEL)action;


+ (UIBarButtonItem *)itemWithTitle:(NSString *)title withAlignment:(UIControlContentHorizontalAlignment )alignment
                             color:(UIColor *)color
                            target:(id)target
                            action:(SEL)action;

+ (UIBarButtonItem *)leftItemWithImageSmalName:(NSString *)imageStr andName:(NSString *)titleName
                                        target:(id)target
                                        action:(SEL)action;

+ (UIBarButtonItem *)leftItemWithImageName:(NSString *)imageStr andName:(NSString *)titleName withColor:(UIColor *)color
                                    target:(id)target
                                    action:(SEL)action;



//宽标题
+ (UIBarButtonItem *)itemRightLWithButtonTitle:(NSString *)title
                                         color:(UIColor *)color
                                        target:(id)target
                                        action:(SEL)action;


+ (UIBarButtonItem *)twoImageItemWithLeftImageName:(NSString *)leftImageStr andRightImageName:(NSString *)rightImageName  target:(id)target  action:(SEL)action;

+ (UIBarButtonItem *)twoImageItemWithLeftImage:(UIImage *)leftImage andRightImage:(UIImage *)ritImage  target:(id)target  action:(SEL)action;
@end
