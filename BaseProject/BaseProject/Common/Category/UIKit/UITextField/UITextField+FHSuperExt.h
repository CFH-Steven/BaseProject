//
//  UITextField+FHSuperExt.h
//  FHCategoriesGather
//
//  Created by FHHou on 2017/7/18.
//  Copyright © 2017年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (FHSuperExt)

/** 传入 0~9 返回 YES 否则 返回 NO */
- (BOOL)fh_validateArabicNumber:(NSString *)numberString;

/** 是否是纯数字 */
- (BOOL)fh_isPureNumandCharacters:(NSString *)string;
/**
 创建texfield

 @param textColor 文字颜色
 @param font 文字大小
 @param placeHolde 占位字符
 @return textfield
 */
+ (UITextField *)textFieldColor:(UIColor *)textColor font:(UIFont *)font placeHolde:(NSString *)placeHolde;
@end
