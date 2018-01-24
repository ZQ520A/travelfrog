//
//  FrontView.m
//  DingDongMovie
//
//  Created by zhenhui huang on 2018/1/4.
//  Copyright © 2018年 Xu Ding. All rights reserved.
//

#import "FrontView.h"

#import "UIImageView+WebCache.h"


@implementation FrontView



-(instancetype)initWithFrame:(CGRect)frame andImage:(NSString *)imageStr{
    self = [super initWithFrame:frame ];
    if (self) {
        self.userInteractionEnabled = YES;
        [self sd_setImageWithURL:[NSURL URLWithString:imageStr]];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickAction)];
        [self addGestureRecognizer:tap];
    }
    return self;
}
-(void)clickAction{
    if (self.updateClick) {
        self.updateClick();
    }
}


@end
