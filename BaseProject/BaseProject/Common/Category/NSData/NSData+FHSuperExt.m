//
//  NSData+FHSuperExt.m
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/17.
//  Copyright © 2015年 All rights reserved.
//

#import "NSData+FHSuperExt.h"

@implementation NSData (FHSuperExt)

/** 将APNS NSData类型token 格式化成字符串 */
- (NSString *)APNSTokenString{
    
    return [[[[self description]
              stringByReplacingOccurrencesOfString: @"<" withString: @""]
             stringByReplacingOccurrencesOfString: @">" withString: @""]
            stringByReplacingOccurrencesOfString: @" " withString: @""];
}

// 创建密匙
- (NSData *)fh_ctreatAKeyData{
    
    Byte keyByte[] = {0x30,0x31,0x31,0x32,0x33,0x34,0x31,0x35,0x36,0x37,0x38,0x39,0x30,0x31,0x31,0x32};
    return [[NSData alloc] initWithBytes:keyByte length:32];
}


@end
