//
//  RequestAction.m
//  huilv
//
//  Created by zhenhui huang on 2017/11/9.
//  Copyright © 2017年 zhenhui huang. All rights reserved.
//

#import "RequestAction.h"

#import "AFNetworking.h"

#import "NSData+FCExtension.h"


@implementation RequestAction

+ (void)httpRequestWithURL:(NSString *)urlstring
                                            headSign:(NSString *)sign
                                            httpMethod:(httpMethod)Method
                blockCompletion:(void (^)(id _Nullable))finishBlock
                 withError:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))errorblock{
    if (urlstring == nil) {
        urlstring  = @"";
    }
    NSString *str = [urlstring stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    AFHTTPSessionManager *httpsession = [AFHTTPSessionManager manager];
    
    httpsession.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    if (Method == GET) {
        
        [httpsession.requestSerializer setValue:sign forHTTPHeaderField:@"sign"];
        
        [httpsession GET:str parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
            id obj = [responseObject aesJsonObject];

            if (finishBlock) {
                finishBlock(obj);
            }

        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (errorblock) {
                errorblock(task,error);
            }
        }];
        
//        [httpsession GET:str parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//           
//        }];
    }
    
}

@end
