//
//  UITableView+FHSuperExt.m
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/17.
//  Copyright © 2015年 Hm houmanager@Hotmail.com. All rights reserved.
//

#import "UITableView+FHSuperExt.h"

@implementation UITableView (FHSuperExt)


#pragma - 设置线条画满
//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
//
//    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
//
//        [cell setSeparatorInset:UIEdgeInsetsZero];
//    }
//    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
//
//        [cell setLayoutMargins:UIEdgeInsetsZero];
//    }
//}

+ (UITableView *)tableViewFrame:(CGRect)frame style:(UITableViewStyle)style{
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:style];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.showsHorizontalScrollIndicator = NO;
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.estimatedRowHeight = 0;
    tableView.estimatedSectionFooterHeight = 0;
    tableView.estimatedSectionHeaderHeight = 0;
    return tableView;
}

@end
