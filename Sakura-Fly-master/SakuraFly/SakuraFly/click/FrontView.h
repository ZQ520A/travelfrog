//
//  FrontView.h
//  DingDongMovie
//
//  Created by zhenhui huang on 2018/1/4.
//  Copyright © 2018年 Xu Ding. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FrontView : UIImageView
-(instancetype)initWithFrame:(CGRect)frame andImage:(NSString *)imageStr;
@property(nonatomic,copy)void(^updateClick)();

@end
