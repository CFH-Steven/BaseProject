//
//  BaseRequestService.h
//  BaseProject
//
//  Created by chenfeihong on 2020/2/8.
//  Copyright © 2020 chenfeihong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WWNetworkHelper.h"

NS_ASSUME_NONNULL_BEGIN

/**
 类说明:网络请求的底层类
 */
@interface BaseRequestService : NSObject

+ (BaseRequestService *)sharedManager;

/**
 POST请求接口方法
 
 @param url 请求链接
 @param parameters 请求参数
 @param showLoadingHud 是否显示Loaidng动画
 @param LoadingHudString 显示Loaidng的文本
 @param showResultHud 是否显示返回信息
 @param success 请求成功的回调
 @param failure 请求失败的回调
 @return 返回的对象可取消请求,调用cancel方法
 */
- (__kindof NSURLSessionTask *)postWithUrl:(NSString *)url
                                parameters:(id)parameters
                            showLoadingHud:(BOOL)showLoadingHud
                          LoadingHudString:(NSString *)LoadingHudString
                             showResultHud:(BOOL)showResultHud
                                   success:(WWHttpRequestSuccess)success
                                   failure:(WWHttpRequestFailed)failure;

/**
 上传图片
 
 @param url url
 @param parameters 参数
 @param imgData 图片数据
 @param name 图片名字 要和后台的名字一样
 @param success 成功
 @param failure 失败
 */
- (void)uploadImage:(NSString *)url
            parameters:(id)parameters
            imageData:(NSData *)imgData
            imageName:(NSString *)name
            showLoadingHud:(BOOL)showLoadingHud
            LoadingHudString:(NSString *)LoadingHudString
            showResultHud:(BOOL)showResultHud
            success:(WWHttpRequestSuccess)success
            failure:(WWHttpRequestFailed)failure;

@end

NS_ASSUME_NONNULL_END
