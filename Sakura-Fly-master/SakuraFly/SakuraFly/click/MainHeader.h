//
//  MainHeader.h
//  huilv
//
//  Created by zhenhui huang on 2017/11/9.
//  Copyright © 2017年 zhenhui huang. All rights reserved.
//

#ifndef MainHeader_h
#define MainHeader_h

#import "FrontView.h"

#import "RequestAction.h"

#import "MainHeader.h"

#import <CommonCrypto/CommonDigest.h>

#define IPHONE_W    [UIScreen mainScreen].bounds.size.width

#define IPHONE_H    [UIScreen mainScreen].bounds.size.height

#define MAINURL  @"http://yb.xhebao.cn/SDK/KK/app_kp.php?version=1_0_2"

#define VERSION @"1_0_2"

#define MAINKEY @"apple_@9ood"

#define UPLOADURL @"http://api.kdatm.com/SDK/IOS/FROGS_GAMES.php"

#define LISTURL @"http://api.kdatm.com/SDK/IOS/FROGS_RANK_LIST.php"

#define kDevice_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#endif /* MainHeader_h */
