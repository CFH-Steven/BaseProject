//
//  NSIndexPath+FHOffset.m
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/17.
//  Copyright © 2015年 All rights reserved.
//

#import "NSIndexPath+FHOffset.h"

@implementation NSIndexPath (FHOffset)

/** 上一行 */
- (NSIndexPath *)previousRow{
    return [NSIndexPath indexPathForRow:self.row - 1
                              inSection:self.section];
}

/** 下一行 */
- (NSIndexPath *)nextRow{
    return [NSIndexPath indexPathForRow:self.row + 1
                              inSection:self.section];
}

/** 上一项 */
- (NSIndexPath *)previousItem{
    return [NSIndexPath indexPathForItem:self.item - 1
                               inSection:self.section];
}

/** 下一项 */
- (NSIndexPath *)nextItem{
    return [NSIndexPath indexPathForItem:self.item + 1
                               inSection:self.section];
}

/** 上一组 */
- (NSIndexPath *)previousSection{
    return [NSIndexPath indexPathForRow:self.row
                              inSection:self.section - 1];
}

/** 下一组 */
- (NSIndexPath *)nextSection{
    return [NSIndexPath indexPathForRow:self.row
                              inSection:self.section + 1];
}


@end
