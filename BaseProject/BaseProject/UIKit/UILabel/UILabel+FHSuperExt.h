//
//  UILabel+FHSuperExt.h
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/17.
//  Copyright © 2015年 All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (FHSuperExt)
/**
 创建label
 
 @param text 文字
 @param font 字体
 @param color 字体颜色
 */
+ (UILabel *)labelText:(NSString *)text font:(UIFont *)font titleColor:(UIColor*)color;
@end
