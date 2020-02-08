//
//  BaseRequestService.m
//  BaseProject
//
//  Created by chenfeihong on 2020/2/8.
//  Copyright © 2020 chenfeihong. All rights reserved.
//

#import "BaseRequestService.h"
#import "AFNetworking.h"

@implementation BaseRequestService

+ (BaseRequestService *)sharedManager {
    static BaseRequestService *shared_manager = nil;
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        shared_manager = [[self alloc] init];
    });
    return shared_manager;
}

/**
 POST请求接口方法
 */
- (__kindof NSURLSessionTask *)postWithUrl:(NSString *)url
                                parameters:(id)parameters
                            showLoadingHud:(BOOL)showLoadingHud
                          LoadingHudString:(NSString *)LoadingHudString
                             showResultHud:(BOOL)showResultHud
                                   success:(WWHttpRequestSuccess)success
                                   failure:(WWHttpRequestFailed)failure {
    NSMutableDictionary *pars = [[NSMutableDictionary alloc] initWithDictionary:parameters];
    NSString *token = @"";
    NSString *sessionID = @"";
    [pars setObject:token forKey:@"token"];
    [pars setObject:sessionID forKey:@"session_id"];
    if (showLoadingHud) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD showActivityMessageInWindow:LoadingHudString];
        });
    }
    NSLog(@"传递的参数:%@ -- url:%@",pars,url);
    return [WWNetworkHelper POST:url parameters:pars success:^(id responseObject) {
        NSError *error = nil;
        if (showLoadingHud) {
            [MBProgressHUD hideHUD];
        }
        //ResponseObject *response = [MTLJSONAdapter modelOfClass:ResponseObject.class fromJSONDictionary:responseObject error:&error];
        //需要提示信息且不为空
//        if (showResultHud && response.msg && ![response.msg isEmpty]) {
//            [MBProgressHUD showTipMessageInWindow:response.msg timer:ResponseShowTipTimer];
//        }
        if (responseObject) {
            success(responseObject);
        }else {
            failure(responseObject);
        }
    } failure:^(NSError *error) {
        failure(error);
        if (showLoadingHud) {
            [MBProgressHUD hideHUD];
            [MBProgressHUD showErrorMessage:@"请求服务器失败了"];
        }
    }];
}

/**
 上传图片
 */
- (void)uploadImage:(NSString *)url
            parameters:(id)parameters
            imageData:(NSData *)imgData
            imageName:(NSString *)name
            showLoadingHud:(BOOL)showLoadingHud
            LoadingHudString:(NSString *)LoadingHudString
            showResultHud:(BOOL)showResultHud
            success:(WWHttpRequestSuccess)success
            failure:(WWHttpRequestFailed)failure{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //设置接收返回数据类型
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/plain",@"text/html", nil];
    NSMutableDictionary *pars = [[NSMutableDictionary alloc] initWithDictionary:parameters];
    NSString *token = @"";
    NSString *sessionID = @"";
    [pars setObject:token forKey:@"token"];
    [pars setObject:sessionID forKey:@"session_id"];
    if (showLoadingHud) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD showActivityMessageInWindow:LoadingHudString];
        });
    }
    NSLog(@"传递的参数:%@",pars);
    //多个参数的时候
    [manager POST:url parameters:pars constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        //以本地时间作为图片名
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *imgName = [formatter stringFromDate:[NSDate date]];
        NSString *fileName = [NSString stringWithFormat:@"%@.png",imgName];
        //上传
        /*
         此方法参数
         1. 要上传的[二进制数据]
         2. 对应网站上[upload.php中]处理文件的[字段"file"]
         3. 要保存在服务器上的[文件名]
         4. 上传文件的[mimeType]
         */
        [formData appendPartWithFileData:imgData name:name fileName:fileName mimeType:@"image/png"];
        
    }progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"上传中%f",1.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (showLoadingHud) {
            dispatch_async(dispatch_get_main_queue(), ^{
               [MBProgressHUD hideHUD];
            });
        }
        NSLog(@"上传成功 %@", responseObject);
        if ([responseObject[@"id"] integerValue] == 10001) {
            if (showResultHud) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [MBProgressHUD showTipMessageInWindow:@"上传失败" timer:ResponseShowTipTimer];
                });
            }
            failure(responseObject);
        }else{
            success(responseObject);
            if (showResultHud) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [MBProgressHUD showTipMessageInWindow:@"上传成功" timer:ResponseShowTipTimer];
                });
            }
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
        if (showLoadingHud) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [MBProgressHUD hideHUD];
            });
        }
        if (showResultHud) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [MBProgressHUD showTipMessageInWindow:@"上传失败" timer:ResponseShowTipTimer];
            });
        }
    }];
}


@end
