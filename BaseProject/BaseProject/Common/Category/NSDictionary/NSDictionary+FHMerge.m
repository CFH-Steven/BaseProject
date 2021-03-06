//
//  NSDictionary+FHMerge.m
//  FHCategoriesGather
//
//  Created by FHHou on 2015/3/17.
//  Copyright © 2015年 All rights reserved.
//

#import "NSDictionary+FHMerge.h"

@implementation NSDictionary (FHMerge)

/** 合并两个NSDictionary */
+ (NSDictionary *)margeDictionaryWithDict:(NSDictionary *)dict1
                                     dict:(NSDictionary *)dict2{
    
    NSMutableDictionary *result = [NSMutableDictionary dictionaryWithDictionary:dict1];
    NSMutableDictionary *resultTemp = [NSMutableDictionary dictionaryWithDictionary:dict1];
    
    [resultTemp addEntriesFromDictionary:dict2];
    [resultTemp enumerateKeysAndObjectsUsingBlock: ^(id key, id obj, BOOL *stop) {
        if ([dict1 objectForKey:key]) {
            if ([obj isKindOfClass:[NSDictionary class]]) {
                NSDictionary * newVal = [[dict1 objectForKey: key] mergeDictionary: (NSDictionary *) obj];
                [result setObject: newVal forKey: key];
            } else {
                [result setObject: obj forKey: key];
            }
        }else if([dict2 objectForKey:key]){
            if ([obj isKindOfClass:[NSDictionary class]]) {
                NSDictionary * newVal = [[dict2 objectForKey: key] mergeDictionary: (NSDictionary *) obj];
                [result setObject: newVal forKey: key];
            }else{
                [result setObject: obj forKey: key];
            }
        }
    }];
    return (NSDictionary *) [result mutableCopy];
}

/** 合并入一个NSDictionary */
- (NSDictionary *)mergeDictionary:(NSDictionary *)dict{
    return [[self class] margeDictionaryWithDict:self dict:dict];
    
    /** 方式2
         NSMutableDictionary *result = [self mutableCopy];
         [result addEntriesFromDictionary:dictionary];
         return result;
     */
}

/** 遍历字典的key-Value键值对并 Return处理结果数组 */
- (NSArray *)fh_dictionaryMapBlock:(id (^)(id key, id value))block{
    
    NSMutableArray *array = [NSMutableArray array];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        id object = block(key, obj);
        if (object) {
            [array addObject:object];
        }
    }];
    return array;
}

/** 字典选择器 */
- (NSDictionary *)fh_dictionaryPickForKeys:(NSArray *)keys{
    
    NSMutableDictionary *picked = [[NSMutableDictionary alloc] initWithCapacity:keys.count];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if ([keys containsObject:key]) {
            picked[key] = obj;
        }
    }];
    return picked;
}

/** 字典忽略器 */
- (NSDictionary *)fh_removeObjectsForKeys:(NSArray *)keys{
    
    NSMutableDictionary *result = [self mutableCopy];
    [result removeObjectsForKeys:keys];
    return result;
    
    /** 方式2
        NSMutableDictionary *omitted = [[NSMutableDictionary alloc] initWithCapacity:([self allKeys].count - keys.count)];
        [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            if (![keys containsObject:key]) { omitted[key] = obj; }
        }];
        return omitted;
     */
}

@end
