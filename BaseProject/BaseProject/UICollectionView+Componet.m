//
//  UICollectionView+Componet.m
//  BaseProject
//
//  Created by chenfeihong on 2020/2/8.
//  Copyright © 2020 chenfeihong. All rights reserved.
//

#import "UICollectionView+Componet.h"

@implementation UICollectionView (Componet)
/**
 创建collectionview
 
 @param vSpec 水平间距
 @param hSpec 垂直间距
 @param itemSize cell的大小
 @param nibName nib的名字 没有可以传递nib
 @return collectionview
 */
+ (UICollectionView *)collectionViewvSpec:(CGFloat)vSpec hSpec:(CGFloat)hSpec sectionInset:(UIEdgeInsets)edgeInset itemSize:(CGSize)itemSize nibName:(NSString *)nibName direction:(UICollectionViewScrollDirection)direction{
    UICollectionViewFlowLayout *layOut = [[UICollectionViewFlowLayout alloc] init];
    layOut.itemSize = itemSize;
    layOut.scrollDirection = direction;
    //cell横向之间的间隔，此属性如果不设置，itemSize设置cell之间一定会有间隔
    layOut.minimumLineSpacing      = vSpec;
    layOut.minimumInteritemSpacing = hSpec;
    //section的边距
    layOut.sectionInset = edgeInset;
    UICollectionView *collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:layOut];
    if (nibName != nil && ![nibName isEqualToString:@""]) {
        [collectionView registerNib:[UINib nibWithNibName:nibName bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:nibName];
    }
    
    collectionView.scrollEnabled = YES;
    return collectionView;
}
@end
