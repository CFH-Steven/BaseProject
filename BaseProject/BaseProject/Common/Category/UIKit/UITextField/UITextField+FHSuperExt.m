//
//  UITextField+FHSuperExt.m
//  FHCategoriesGather
//
//  Created by FHHou on 2017/7/18.
//  Copyright © 2017年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UITextField+FHSuperExt.h"

@implementation UITextField (FHSuperExt)

- (BOOL)fh_validateArabicNumber:(NSString *)numberString {
    BOOL res =YES;
    NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    int i =0;
    while (i < numberString.length) {
        NSString * string = [numberString substringWithRange:NSMakeRange(i,1)];
        NSRange range = [string rangeOfCharacterFromSet:tmpSet];
        if (range.length ==0) {
            res = NO;
            break;
        }
        i++;
    }
    return res;
}

- (BOOL)fh_isPureNumandCharacters:(NSString *)string{
//    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
//    if(string.length > 0)
//    {
//        return NO;
//    } 
//    return YES;
    
    NSString *regex = @"[0-9]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([pred evaluateWithObject:string]) {
        return YES;
    }
    return NO;
}

/**
 创建texfield
 
 @param textColor 文字颜色
 @param font 文字大小
 @param placeHolde 占位字符
 @return textfield
 */
+ (UITextField *)textFieldColor:(UIColor *)textColor font:(UIFont *)font placeHolde:(NSString *)placeHolde{
    UITextField *textField = [[UITextField alloc] init];
    textField.textColor = textColor;
    textField.font = font;
    textField.placeholder = placeHolde;
    return textField;
}
@end
