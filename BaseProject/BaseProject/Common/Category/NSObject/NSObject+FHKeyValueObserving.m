//
//  NSObject+FHKeyValueObserving.m
//  FHCategoriesGather
//
//  Created by FHHou on 2015/5/19.
//  Copyright © 2015年 All rights reserved.
//

#import "NSObject+FHKeyValueObserving.h"
#import <objc/runtime.h>

static char const *const kSafeObserversKey = "kSafeObserversKey";

@implementation NSObject (FHKeyValueObserving)

- (void)setKeyPathObservers:(NSMutableArray *)keyPathObservers{
    objc_setAssociatedObject(self, kSafeObserversKey, keyPathObservers, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableArray *)keyPathObservers{
    NSMutableArray *getObservers = objc_getAssociatedObject(self, kSafeObserversKey);
    if (getObservers) {
        return getObservers;
    }else{
        self.keyPathObservers = [NSMutableArray array];
        return self.keyPathObservers;
    }
}

- (void)fh_addSafeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath{

    if (keyPath == nil || observer == nil) {
        return;
    }
    NSDictionary *observerInfo = @{keyPath:observer};
    
    if (![self.keyPathObservers containsObject:observerInfo]) {
        [self.keyPathObservers addObject:observerInfo];
        [self addObserver:observer forKeyPath:keyPath options:NSKeyValueObservingOptionNew context:nil];
    }
}

- (void)fh_removeSafeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath{
    
    if (keyPath == nil || observer == nil) {
        return;
    }
    
    NSDictionary *observerInfo = @{keyPath:observer};
    if ([self.keyPathObservers containsObject:observerInfo]) {
        [self.keyPathObservers removeObject:observerInfo];
        [self removeObserver:observer forKeyPath:keyPath];
    }
}

- (void)fh_removeSafeAllObservers{
    
    NSMutableArray *keyPathObserversTemp = self.keyPathObservers.mutableCopy;
    for (NSInteger i = 0; i < keyPathObserversTemp.count; i++) {
        NSDictionary *keyObserver = [keyPathObserversTemp objectAtIndex:i];
        NSString *keyPath = [keyObserver.allKeys firstObject];
        id observer = [keyObserver.allValues firstObject];
        [self fh_removeSafeObserver:observer forKeyPath:keyPath];
    }
    
    [self.keyPathObservers removeAllObjects];
}

@end
