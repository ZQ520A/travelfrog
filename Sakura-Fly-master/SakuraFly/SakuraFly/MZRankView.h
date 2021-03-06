//
//  MZRankView.h
//  Tower
//
//  Created by Zhangle on 15/10/21.
//  Copyright © 2015年 Machelle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MZRankView : UIView

@property (weak, nonatomic) IBOutlet UILabel *score3;
@property (weak, nonatomic) IBOutlet UILabel *score4;
@property (weak, nonatomic) IBOutlet UILabel *score5;
@property (weak, nonatomic) IBOutlet UILabel *score6;
@property (weak, nonatomic) IBOutlet UILabel *score7;
@property (weak, nonatomic) IBOutlet UIButton *closeRank;
@property (weak, nonatomic) IBOutlet UILabel *firstName;
@property (weak, nonatomic) IBOutlet UILabel *secondName;
@property (weak, nonatomic) IBOutlet UILabel *thirdName;
@property (weak, nonatomic) IBOutlet UILabel *fourthName;
@property (weak, nonatomic) IBOutlet UILabel *fifthName;
@property(strong,nonatomic)NSArray *arr;
+(instancetype)rankView;
@end
