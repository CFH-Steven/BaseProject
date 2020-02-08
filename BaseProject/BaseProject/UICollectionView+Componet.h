//
//  UICollectionView+Componet.h
//  BaseProject
//
//  Created by chenfeihong on 2020/2/8.
//  Copyright © 2020 chenfeihong. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionView (Componet)

/**
 创建collectionview

 @param vSpec 水平间距
 @param hSpec 垂直间距
 @param edgeInset 边距
 @param itemSize cell的大小
 @param nibName nib的名字 没有可以传递nib
 @return collectionview
 */
+ (UICollectionView *)collectionViewvSpec:(CGFloat)vSpec hSpec:(CGFloat)hSpec sectionInset:(UIEdgeInsets)edgeInset itemSize:(CGSize)itemSize nibName:(NSString *)nibName direction:(UICollectionViewScrollDirection)direction;
@end

NS_ASSUME_NONNULL_END
