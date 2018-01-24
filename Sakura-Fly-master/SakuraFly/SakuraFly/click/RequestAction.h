//
//  RequestAction.h
//  huilv
//
//  Created by zhenhui huang on 2017/11/9.
//  Copyright © 2017年 zhenhui huang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    GET,
    POST
}httpMethod;

@interface RequestAction : NSObject

+ (void)httpRequestWithURL:(NSString *_Nullable)urlstring
                  headSign:(NSString *_Nullable)sign
                httpMethod:(httpMethod)Method
           blockCompletion:(nullable void(^)(id _Nullable obj))finishBlock
                 withError:(nullable void(^)(NSURLSessionDataTask *_Nullable task,NSError *_Nonnull))errorblock;

@end
