//
//  MZRankView.m
//  Tower
//
//  Created by Zhangle on 15/10/21.
//  Copyright © 2015年 Machelle. All rights reserved.
//
//  排行榜视图类

#import "MZRankView.h"

@implementation MZRankView

/**
 *  初始化，读出数据显示即可
 *
 *  @return self
 */
+(instancetype)rankView{
    NSArray *viewArray = [[NSBundle mainBundle] loadNibNamed:@"MZRankView" owner:self options:nil];
    return    viewArray[0];
}


- (void)setArr:(NSArray *)arr{
    self.layer.borderColor = [[UIColor blackColor] CGColor];
    self.layer.borderWidth = 1;
    [_closeRank addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    
    _firstName.text = arr[0][@"wechat_name"];
    _secondName.text = arr[1][@"wechat_name"];
    _thirdName.text = arr[2][@"wechat_name"];
    _fourthName.text = arr[3][@"wechat_name"];
    _fifthName.text = arr[4][@"wechat_name"];
    
    
    _score3.text = arr[0][@"number"] ;
    _score4.text = arr[1][@"number"] ;
    _score5.text = arr[2][@"number"];
    _score6.text = arr[3][@"number"];
    _score7.text = arr[4][@"number"];
}
/**
 *  关闭事件响应
 */
- (void)close {
    [self removeFromSuperview];
}

@end
