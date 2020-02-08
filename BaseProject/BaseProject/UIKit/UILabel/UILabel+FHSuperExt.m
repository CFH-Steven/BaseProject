//
//  UILabel+FHSuperExt.m
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/17.
//  Copyright © 2015年 All rights reserved.
//

#import "UILabel+FHSuperExt.h"

@implementation UILabel (FHSuperExt)
+ (UILabel *)labelText:(NSString *)text font:(UIFont *)font titleColor:(UIColor*)color{
    UILabel *label = [[UILabel alloc] init];
    if (text != nil) {
        label.text = text;
    }
    if (font != nil) {
        label.font = font;
    }
    if (color != nil) {
        label.textColor = color;
    }
    return label;
}
@end
